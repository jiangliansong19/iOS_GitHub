//
//  ReadWriteObject.h
//  dispatch_barrier-Demo
//
//  Created by 江连松 on 2019/10/17.
//  Copyright © 2019 JLS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ReadWriteObject : NSObject

- (void)writeValue:(id)value forKey:(NSString *)key;

- (NSString *)readValueForKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
