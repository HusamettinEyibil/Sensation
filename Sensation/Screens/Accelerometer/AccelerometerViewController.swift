//
//  AccelerometerViewController.swift
//  Sensation
//
//  Created by Hüsamettin Eyibil on 18.11.2021.
//

import UIKit

class AccelerometerViewController: UIViewController {
    
    let accelerometerManager = AccelerometerManager()
    var models : [AccelerometerModel] = [] {
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
        navigationItem.title = "Accelerometer"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: AccelerometerCell.identifier, bundle: nil), forCellReuseIdentifier: AccelerometerCell.identifier)
        tableView.separatorColor = UIColor(red: 1, green: 0.5, blue: 0.5, alpha: 0.2)
        
        accelerometerManager.startAccelerometers()
        
        timer = Timer.scheduledTimer(withTimeInterval: Double(sliderValue), repeats: true) { timer in
            self.updateValues()
        }
    }
    
    @IBAction func sliderValueDidChange(_ sender: UISlider) {
        sliderValue = Int(sender.value)
    }
    
    func updateValues() {
        let newModel = AccelerometerModel(creationTime: getCurrentTime(), values: accelerometerManager.getValues())
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

extension AccelerometerViewController: UITableViewDelegate {
    
}

extension AccelerometerViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AccelerometerCell.identifier, for: indexPath) as! AccelerometerCell
        if indexPath.row == 0 {
            cell.dateLabel.text = ""
            cell.xLabel.text = "X"
            cell.yLabel.text = "Y"
            cell.zLabel.text = "Z"
        } else {
            let model = models[indexPath.row-1]
            let values = model.values
            cell.dateLabel.text = model.creationTime
            cell.xLabel.text = String(format: "%.2f", values[0])
            cell.yLabel.text = String(format: "%.2f", values[1])
            cell.zLabel.text = String(format: "%.2f", values[2])
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


