//
//  AccelerometerModel.swift
//  Sensation
//
//  Created by Hüsamettin Eyibil on 12.12.2021.
//

import Foundation

class GPSModel {
    var creationTime : String
    var coordinates : [String:Double]
    
    init(creationTime: String, coordinates: [String:Double]) {
        self.creationTime = creationTime
        self.coordinates = coordinates
    }
}
