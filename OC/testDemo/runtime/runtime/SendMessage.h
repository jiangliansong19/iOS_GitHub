//
//  SendMessage.h
//  runtime
//
//  Created by 江连松 on 2017/4/22.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SendMessage : NSObject

@property (nonatomic, strong) NSString *from;
@property (nonatomic, strong) NSString *to;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, assign) int totalNum;

- (void)printf:(NSString *)message;


@end
