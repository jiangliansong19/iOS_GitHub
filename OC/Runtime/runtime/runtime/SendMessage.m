//
//  SendMessage.m
//  runtime
//
//  Created by 江连松 on 2017/4/22.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "SendMessage.h"

@implementation SendMessage

- (void)printf:(NSString *)message {
    NSLog(@"%s发送消息%@",__FUNCTION__,message);
}

@end
