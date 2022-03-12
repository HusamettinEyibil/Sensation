//
//  AccelerometerManager.swift
//  Sensation
//
//  Created by Hüsamettin Eyibil on 20.11.2021.
//

import CoreMotion

class GyroManager {
    
    let motionManager = CMMotionManager()
    
    let updateInterval : Double = 0.2 // Manager updates the acc values every 0.2 sec.
    
    var gyroX : Double = 0
    var gyroY : Double = 0
    var gyroZ : Double = 0
    
    
    func startGyro() {
        if motionManager.isGyroAvailable {
            motionManager.gyroUpdateInterval = updateInterval
            motionManager.startGyroUpdates(to: OperationQueue.current!) { (data, error) in
                if let gyroData = data {
                    self.gyroX = gyroData.rotationRate.x
                    self.gyroY = gyroData.rotationRate.y
                    self.gyroZ = gyroData.rotationRate.z
                }
            }
        }
    }
    
    func getValues() -> [Double] {
        return [gyroX, gyroY, gyroZ]
    }
    
}

