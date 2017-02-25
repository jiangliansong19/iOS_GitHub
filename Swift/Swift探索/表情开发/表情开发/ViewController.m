//
//  ViewController.m
//  表情开发
//
//  Created by JLS on 2017/1/12.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //在这里以😀表情为例,😀的Unicode编码为U+1F604,UTF-16编码为:\ud83d\ude04
    NSString * emojiUnicode = @"\U0001F604";
    NSLog(@"emojiUnicode:%@",emojiUnicode);
    //如果直接输入\ud83d\ude04会报错，加了转义后不会报错，但是会输出字符串\ud83d\ude04,而不是😀
    NSString * emojiUTF16 = @"\\ud83d\\ude04";
    NSLog(@"emojiUTF16:%@",emojiUTF16);
    //转换
    emojiUTF16 = [NSString stringWithCString:[emojiUTF16 cStringUsingEncoding:NSUTF8StringEncoding] encoding:NSNonLossyASCIIStringEncoding];
    NSLog(@"emojiUnicode2:%@",emojiUTF16);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
