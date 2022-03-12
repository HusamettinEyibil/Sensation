//
//  AccelerometerManager.swift
//  Sensation
//
//  Created by Hüsamettin Eyibil on 20.11.2021.
//

import CoreMotion

class DeviceMotionManager {
    
    let motionManager = CMMotionManager()
    
    let updateInterval : Double = 0.2 // Manager updates the acc values every 0.2 sec.
    
    var roll : Double = 0
    var pitch : Double = 0
    var yaw : Double = 0
    var heading : Double = 0
    
    
    func startDeviceMotion() {
        if motionManager.isDeviceMotionAvailable {
            motionManager.deviceMotionUpdateInterval = updateInterval
            motionManager.startDeviceMotionUpdates(to: OperationQueue.current!) { (data, error) in
                if let deviceMotionData = data {
                    self.roll = deviceMotionData.attitude.roll
                    self.pitch = deviceMotionData.attitude.pitch
                    self.yaw = deviceMotionData.attitude.yaw
                    self.heading = deviceMotionData.heading
                }
            }
        }
    }
    
    func getValues() -> [String:Double] {
        return ["roll":roll, "pitch":pitch, "yaw":yaw, "heading":heading]
    }
    
}

