//
//  ViewController.swift
//  Sensation
//
//  Created by Hüsamettin Eyibil on 18.11.2021.
//

import UIKit
import SensorKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    enum Sensors : String, CaseIterable {
        case accelerometer = "Accelerometer"
        case magnetometer = "Magnetometer"
        case gyro = "Gyro"
        case location = "DeviceMotion"
        case GSM = "GPS"
        
        var controller : String {
            return self.rawValue + "ViewController"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Sensors"
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
      
        
        
    }


}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: Sensors.allCases[indexPath.row].controller)
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Sensors.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        cell.textLabel?.text = Sensors.allCases[indexPath.row].rawValue
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
}

