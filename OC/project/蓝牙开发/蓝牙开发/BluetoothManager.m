//
//  BluetoothManager.m
//  蓝牙开发
//
//  Created by 江连松 on 2017/4/26.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "BluetoothManager.h"

@implementation BluetoothManager

//步骤一：建立centralManager 进行蓝牙管理
- (CBCentralManager *)centralManager {
    if (_centralManager == nil) {
        _centralManager = [[CBCentralManager alloc]initWithDelegate:self queue:nil];
    }
    return _centralManager;
}

- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
//    typedef NS_ENUM(NSInteger, CBManagerState) {
//        CBManagerStateUnknown = 0,//未知
//        CBManagerStateResetting,//重置
//        CBManagerStateUnsupported,//不支持
//        CBManagerStateUnauthorized,//未授权
//        CBManagerStatePoweredOff,//关闭
//        CBManagerStatePoweredOn,//开启
//    } NS_ENUM_AVAILABLE(NA, 10_0);
    
    NSLog(@"centralManager.state = %ld",(long)central.state);
    if (central.state == 5) {
        //附带某些条件，开始扫描周围设备
        [self.centralManager scanForPeripheralsWithServices:nil options:nil];
//        //停止扫描
//        [self.centralManager stopScan];
    }
}

//步骤二：搜索外围设备

//成功发现外围设备的回调。没发现一个外围设备都会调用一次
- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *,id> *)advertisementData RSSI:(NSNumber *)RSSI {
    
    //根据peripheral的各种信息，确认。开始连接。
    self.peripheral = peripheral;
    [self.centralManager connectPeripheral:peripheral options:nil];
//    //取消连接
//    [self.centralManager cancelPeripheralConnection:peripheral];
}

//步骤三：连接外围设备

//连接成功的回调
- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral {
    self.peripheral.delegate = self;
    //发现服务
    [self.peripheral discoverServices:nil];
}

//连接失败的回调
- (void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error {
    
}

//丢失连接
- (void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error {
    
}

//步骤4: 获得外围设备的服务
//步骤5: 获得外围设备的特征
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error {
    
    self.service = service;
    for (CBCharacteristic *cha in service.characteristics) {
        NSLog(@"cha == %@",cha);
    }
}

//步骤6: 从外围设备读取数据

//凡是从蓝牙传过来的数据都要经过这个回调，简单的说这个方法就是你拿数据的唯一方法
- (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error {
    
    self.characteristic = characteristic;
    
    //打印特征的属性
    NSLog(@"characteristic.properties = %lu",(unsigned long)self.characteristic.properties);
    /*
     typedef NS_OPTIONS(NSUInteger, CBCharacteristicProperties) {
     CBCharacteristicPropertyBroadcast                                                = 0x01,
     CBCharacteristicPropertyRead                                                    = 0x02,
     CBCharacteristicPropertyWriteWithoutResponse                                    = 0x04,
     CBCharacteristicPropertyWrite                                                    = 0x08,
     CBCharacteristicPropertyNotify                                                    = 0x10,
     CBCharacteristicPropertyIndicate                                                = 0x20,
     CBCharacteristicPropertyAuthenticatedSignedWrites                                = 0x40,
     CBCharacteristicPropertyExtendedProperties                                        = 0x80,
     CBCharacteristicPropertyNotifyEncryptionRequired NS_ENUM_AVAILABLE(NA, 6_0)        = 0x100,
     CBCharacteristicPropertyIndicateEncryptionRequired NS_ENUM_AVAILABLE(NA, 6_0)    = 0x200
     };
     
     打印出特征的权限(characteristic.properties),可以看到有很多种,这是一个NS_OPTIONS的枚举,可以是多个值
     常见的又read,write,noitfy,indicate.知道这几个基本够用了,前俩是读写权限,后俩都是通知,俩不同的通知方式
     */
}

//步骤七: 开始写入数据
- (void)writeData {
//    typedef NS_ENUM(NSInteger, CBCharacteristicWriteType) {
//        CBCharacteristicWriteWithResponse = 0,
//        CBCharacteristicWriteWithoutResponse,
//    };
    
    [self.peripheral writeValue:[NSData data] forCharacteristic:self.characteristic type:CBCharacteristicWriteWithResponse];
}

@end
