//
//  AccelerometerManager.swift
//  Sensation
//
//  Created by Hüsamettin Eyibil on 20.11.2021.
//

import CoreMotion

class AccelerometerManager {
    
    let motionManager = CMMotionManager()
    
    let updateInterval : Double = 0.2 // Manager updates the acc values every 0.2 sec.
    
    var accelerationX : Double = 0
    var accelerationY : Double = 0
    var accelerationZ : Double = 0
    
    
    func startAccelerometers() {
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = updateInterval
            motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { (data, error) in
                if let accelerometerData = data {
                    self.accelerationX = accelerometerData.acceleration.x
                    self.accelerationY = accelerometerData.acceleration.y
                    self.accelerationZ = accelerometerData.acceleration.z
                }
            }
        }
    }
    
    func getValues() -> [Double] {
        return [accelerationX, accelerationY, accelerationZ]
    }
    
}

