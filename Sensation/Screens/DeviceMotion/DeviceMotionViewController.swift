//
//  AccelerometerViewController.swift
//  Sensation
//
//  Created by Hüsamettin Eyibil on 18.11.2021.
//

import UIKit

class DeviceMotionViewController: UIViewController {
    
    let deviceMotionManager = DeviceMotionManager()
    var models : [DeviceMotionModel] = [] {
        didSet {
            tableView.reloadData()
            DispatchQueue.main.async {
                    let indexPath = IndexPath(row: self.models.count-1, section: 0)
                    self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
                }
        }
    }
    
    var timer : Timer?
    
    var sliderValue = 1 {
        didSet {
            timer?.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: Double(sliderValue), repeats: true) { timer in
                self.updateValues()
            }
        }
    }
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Device Motion"
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: DeviceMotionCell.identifier, bundle: nil), forCellReuseIdentifier: DeviceMotionCell.identifier)
        tableView.separatorColor = UIColor(red: 1, green: 0.5, blue: 0.5, alpha: 0.2)
        
        deviceMotionManager.startDeviceMotion()
        
        timer = Timer.scheduledTimer(withTimeInterval: Double(sliderValue), repeats: true) { timer in
            self.updateValues()
        }
    }
    
    @IBAction func sliderValueDidChange(_ sender: UISlider) {
        sliderValue = Int(sender.value)
    }
    
    func updateValues() {
        let newModel = DeviceMotionModel(creationTime: getCurrentTime(), values: deviceMotionManager.getValues())
        models.append(newModel)
    }
    
    func getCurrentTime() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        let time = formatter.string(from: date)
        
        return time
    }
    
}

extension DeviceMotionViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DeviceMotionCell.identifier, for: indexPath) as! DeviceMotionCell
        if indexPath.row == 0 {
            cell.dateLabel.text = ""
            cell.heading.text = "Heading"
            cell.roll.text = "Roll"
            cell.pitch.text = "Pitch"
            cell.yaw.text = "Yaw"
        } else {
            let model = models[indexPath.row-1]
            let values = model.values
            cell.dateLabel.text = model.creationTime
            cell.heading.text = String(format: "%.2f", values["heading"]!)
            cell.roll.text = String(format: "%.2f", values["roll"]!)
            cell.pitch.text = String(format: "%.2f", values["pitch"]!)
            cell.yaw.text = String(format: "%.2f", values["yaw"]!)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
}



/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


