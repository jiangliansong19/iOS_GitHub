//
//  DownLoadOperation.h
//  NSOperationQuene
//
//  Created by jls on 15-6-2.
//  Copyright (c) 2015年 JLS. All rights reserved.
//

#import <Foundation/Foundation.h>


@class DownLoadOperation;//仅仅表示这是一个类

typedef void (^downLoadBlock)(DownLoadOperation *operation,NSData *data);


//自定义NSOperation
@interface DownLoadOperation : NSOperation<NSURLConnectionDataDelegate>

{
    downLoadBlock saveBlcok;
    NSString *_url;
    NSMutableData *_receiveData;
}


- (instancetype)initWithUrl:(NSString *)url andCompletionBlock:(downLoadBlock)block;

@property (nonatomic,assign) int tag;
@end
