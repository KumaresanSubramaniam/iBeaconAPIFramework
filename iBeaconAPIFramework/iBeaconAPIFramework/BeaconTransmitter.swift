//
//  BeaconTransmitter.swift
//  iBeaconAPI
//
//  Created by Selvaganesh Ilango on 2/25/18.
//  Copyright © 2018 Nifty Campaingns. All rights reserved.
//

import Foundation
import CoreBluetooth
import CoreLocation


class BeaconTransmitter: NSObject,CBPeripheralManagerDelegate{
    
    var localBeacon: CLBeaconRegion!
    var beaconPeripheralData: NSDictionary!
    var peripheralManager: CBPeripheralManager!
    
    override init() {
        super.init();
        let locationManager : CLLocationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()

        self.initLocalBeacon()
    }
    
    func initLocalBeacon() {
        if localBeacon != nil {
            stopLocalBeacon()
        }
        
        let localBeaconUUID = "5A4BCFCE-174E-4BAC-A814-092E77F6B7E5"
        let localBeaconMajor: CLBeaconMajorValue = 123
        let localBeaconMinor: CLBeaconMinorValue = 456
        
        let uuid = UUID(uuidString: localBeaconUUID)!
        localBeacon = CLBeaconRegion(proximityUUID: uuid, major: localBeaconMajor, minor: localBeaconMinor, identifier: "selva")
        
        beaconPeripheralData = localBeacon.peripheralData(withMeasuredPower: nil)
        peripheralManager = CBPeripheralManager(delegate: self, queue: nil, options: nil)
        print("InitLocalBeacon")
    }
    
    func stopLocalBeacon() {
        peripheralManager.stopAdvertising()
        peripheralManager = nil
        beaconPeripheralData = nil
        localBeacon = nil
    }
    
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        print("StatusUpdate")
        if peripheral.state == .poweredOn {
            print("Power On");
            peripheralManager.startAdvertising(beaconPeripheralData as! [String: AnyObject]!)
        } else if peripheral.state == .poweredOff {
            peripheralManager.stopAdvertising()
        }
    }
}
