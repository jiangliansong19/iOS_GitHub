//
//  ViewController.m
//  NSURLConnection
//
//  Created by 江连松 on 2017/4/25.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "ViewController.h"
#import "AFnetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)request:(id)sender {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager GET:@"http://localhost:8080/TomcatTest/getNews" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    
    }] ;
    

    [manager GET:@"https://httpbin.org/get" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }] ;
}

@end
