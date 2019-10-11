//
//  ViewController.m
//  WebViewTest
//
//  Created by 江连松 on 2019/8/9.
//  Copyright © 2019 jls. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController ()<WKScriptMessageHandler>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://127.0.0.1:8088"]]];
    [self.view addSubview:webView];
    
    [webView.configuration.userContentController addScriptMessageHandler:self name:@"showMsg"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    if ([message.name isEqualToString:@"openCamera"]) {
        NSLog(@"%@ -- %@", message.name, message.body);//openCamera -- <null>
    }else if([message.name isEqualToString:@"playVideo"]) {
        NSLog(@"%@ -- %@", message.name, message.body);//playVideo -- {Author = "Jhon Trank";name = God;}
    } else if ([message.name isEqualToString:@"showMsg"]) {
        NSLog(@"%@ -- %@", message.name, message.body);
    }
}

@end
