//
//  AccelerometerManager.swift
//  Sensation
//
//  Created by Hüsamettin Eyibil on 20.11.2021.
//

import CoreMotion

class MagnetometerManager {
    
    let motionManager = CMMotionManager()
    
    let updateInterval : Double = 0.2 // Manager updates the acc values every 0.2 sec.
    
    var magneticFieldX : Double = 0
    var magneticFieldY : Double = 0
    var magneticFieldZ : Double = 0
    
    
    func startMagnetometers() {
        if motionManager.isMagnetometerAvailable {
            motionManager.magnetometerUpdateInterval = updateInterval
            motionManager.startMagnetometerUpdates(to: OperationQueue.current!) { (data, error) in
                if let magnetometerData = data {
                    self.magneticFieldX = magnetometerData.magneticField.x
                    self.magneticFieldY = magnetometerData.magneticField.y
                    self.magneticFieldZ = magnetometerData.magneticField.z
                }
            }
        }
    }
    
    func getValues() -> [Double] {
        return [magneticFieldX, magneticFieldY, magneticFieldZ]
    }
    
}

