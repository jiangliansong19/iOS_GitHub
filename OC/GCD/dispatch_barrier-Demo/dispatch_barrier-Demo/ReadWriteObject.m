//
//  ReadWriteObject.m
//  dispatch_barrier-Demo
//
//  Created by 江连松 on 2019/10/17.
//  Copyright © 2019 JLS. All rights reserved.
//

#import "ReadWriteObject.h"

@interface ReadWriteObject()

@property (nonatomic, strong) dispatch_queue_t queue;
@property (nonatomic, strong) NSMutableDictionary *dataDict;

@end

@implementation ReadWriteObject

- (instancetype)init {
    if (self = [super init]) {
        _queue = dispatch_queue_create("readWrite", DISPATCH_QUEUE_CONCURRENT);
        _dataDict = [NSMutableDictionary dictionaryWithCapacity:0];
    }
    return self;
}

- (void)writeValue:(id)value forKey:(NSString *)key {
    
    __weak typeof(self) weakSelf = self;
    dispatch_barrier_async(_queue, ^{
        [weakSelf.dataDict setValue:value forKey:key];
    });
}

- (NSString *)readValueForKey:(NSString *)key {
    
    __weak typeof(self) weakSelf = self;
    __block id obj;
    dispatch_sync(_queue, ^{
        obj = [weakSelf.dataDict valueForKey:key];
    });
    return obj;
}

@end
