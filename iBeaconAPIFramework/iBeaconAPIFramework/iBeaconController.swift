//
//  ViewController.swift
//  iBeaconAPI
//
//  Created by Selvaganesh Ilango on 2/25/18.
//  Copyright © 2018 Nifty Campaingns. All rights reserved.
//

import UIKit
import CoreLocation
import CoreBluetooth

public class iBeaconController: NSObject, CBPeripheralManagerDelegate {
    
    var localBeacon: CLBeaconRegion!
    var beaconPeripheralData: NSDictionary!
    var peripheralManager: CBPeripheralManager!
    
    public func startScanning() -> CLBeaconRegion {
        
        let uuid = UUID(uuidString: "2f234454-cf6d-4a0f-adf2-f4911ba9ffa7")!
        let beaconRegion = CLBeaconRegion(proximityUUID: uuid, identifier: "MyBeacon")
        beaconRegion.notifyEntryStateOnDisplay = true
        beaconRegion.notifyOnExit = true
        beaconRegion.notifyOnEntry = true
        
        return beaconRegion
        
    }
    
    public func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        print("StatusUpdate")
        if peripheral.state == .poweredOn {
            print("Power On");
            peripheralManager.startAdvertising(beaconPeripheralData as! [String: AnyObject]!)
        } else if peripheral.state == .poweredOff {
            peripheralManager.stopAdvertising()
        }
    }
    
    public func initLocalBeacon(localBeaconUUID: String, identifier: String) {
        if localBeacon != nil {
            stopLocalBeacon()
        }
        
        //let localBeaconUUID = "5A4BCFCE-174E-4BAC-A814-092E77F6B7E5"
        
        let localBeaconMajor: CLBeaconMajorValue = 123
        let localBeaconMinor: CLBeaconMinorValue = 456
        
        let uuid = UUID(uuidString: localBeaconUUID)!
        localBeacon = CLBeaconRegion(proximityUUID: uuid, major: localBeaconMajor, minor: localBeaconMinor, identifier: identifier)
        
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
}

