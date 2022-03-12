//
//  AccelerometerModel.swift
//  Sensation
//
//  Created by Hüsamettin Eyibil on 12.12.2021.
//

import Foundation

class DeviceMotionModel {
    var creationTime : String
    var values : [String:Double]
    
    init(creationTime: String, values: [String:Double]) {
        self.creationTime = creationTime
        self.values = values
    }
}
