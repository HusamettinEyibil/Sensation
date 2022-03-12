//
//  AccelerometerModel.swift
//  Sensation
//
//  Created by Hüsamettin Eyibil on 12.12.2021.
//

import Foundation

class AccelerometerModel {
    var creationTime : String
    var values : [Double]
    
    init(creationTime: String, values: [Double]) {
        self.creationTime = creationTime
        self.values = values
    }
}
