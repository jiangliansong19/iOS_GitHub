//
//  BluetoothManager.h
//  蓝牙开发
//
//  Created by 江连松 on 2017/4/26.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreBluetooth/CoreBluetooth.h>

@interface BluetoothManager : NSObject<CBCentralManagerDelegate,CBPeripheralDelegate>
    
@property (nonatomic, strong) CBCentralManager *centralManager;
@property (nonatomic, strong) CBPeripheral *peripheral;
@property (nonatomic, strong) CBService *service;
@property (nonatomic, strong) CBCharacteristic *characteristic;
@end
