//
//  BeaconScanner.swift
//  iBeaconAPI
//
//  Created by Selvaganesh Ilango on 2/25/18.
//  Copyright © 2018 Nifty Campaingns. All rights reserved.
//

import Foundation
import CoreLocation

class BeaconScanner {
    var locationManager : CLLocationManager!
    
    init(manager: CLLocationManager) {
//        super.init()
        self.locationManager = manager
        print("Scanner Init")
        //startScanning()
    }
    
    func startScanning() {
        let uuid = UUID(uuidString: "2f234454-cf6d-4a0f-adf2-f4911ba9ffa7")!
        let beaconRegion = CLBeaconRegion(proximityUUID: uuid, identifier: "MyBeacon")
        beaconRegion.notifyEntryStateOnDisplay = true
        beaconRegion.notifyOnExit = true
        beaconRegion.notifyOnEntry = true
        
        self.locationManager.startMonitoring(for: beaconRegion)
        self.locationManager.startRangingBeacons(in: beaconRegion)
        self.locationManager.requestState(for: beaconRegion)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    startScanning()
                    print("Start Scanning")
                }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        print("DidRangeBeacon")
        if beacons.count > 0 {
            print("Found Beacon")
        } else {
            print("No Beacon Found")
        }
    }
}
