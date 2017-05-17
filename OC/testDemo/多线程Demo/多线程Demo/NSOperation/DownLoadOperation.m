//
//  DownLoadOperation.m
//  NSOperationQuene
//
//  Created by jls on 15-6-2.
//  Copyright (c) 2015年 JLS. All rights reserved.
//

#import "DownLoadOperation.h"

@implementation DownLoadOperation

- (instancetype)initWithUrl:(NSString *)url andCompletionBlock:(downLoadBlock)block
{
    self = [super init];
    if (self) {
        _receiveData = [[NSMutableData alloc]init];
        _url = url;
        saveBlcok = [block copy];
    }
    return self;
}

//如果要自定义个一个operation，必须要重写main方法
- (void)main
{
    [NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_url]] delegate:self];
    
    /**
     *  NSRunloop是一个循环事件，让系统有事可做，没事就休息
     *  主线程NSRunLoop   默认打开
     *  子线程要手动打开
     */
    [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    
}

#pragma mark- NSURLConnectionDataDelegate的代理方法
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    _receiveData.length = 0;
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_receiveData appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    if (saveBlcok) {
        saveBlcok(self,_receiveData);
    }
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"error = %@",error);
}

@end
