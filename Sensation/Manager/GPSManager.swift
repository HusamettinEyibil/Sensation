//
//  AccelerometerManager.swift
//  Sensation
//
//  Created by Hüsamettin Eyibil on 20.11.2021.
//

import CoreLocation

class GPSManager: NSObject, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    var latitude : Double = 0
    var longitude : Double = 0
    
    
    func startGPS() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 10
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            latitude = location.coordinate.latitude as Double
            longitude = location.coordinate.longitude as Double
        }
    }
    
    func getCoordinates() -> [String:Double] {
        return ["latitude": latitude, "longitude": longitude]
    }
    
}


