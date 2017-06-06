//
//  ViewController.m
//  msg_forward
//
//  Created by 江连松 on 2017/4/18.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "ViewController.h"
#import <objc/message.h>
#import "Monkey.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    Monkey *monkey = [[Monkey alloc]init];
    
    
//    class->instance->method->SEL+IMP
//    class->instance->property->set+get+ivar
    
//    objc_msgSend(self, @selector(printHelloworld));
//    class_replaceMethod([self class], @selector(printHelloworld), method_getImplementation(class_getInstanceMethod([self class], @selector(printHelloSchool))), "v@0");
    
    
    Class cls = objc_getClass("UIView");
    UIView *subView = (UIView *)[cls new];
    subView.frame = CGRectMake(0, 0, 100, 100);
    subView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:subView];
    
    
    class_replaceMethod(self.class, @selector(printHelloworld), (IMP)printHelloTom, "v@");
    objc_msgSend(self, @selector(printHelloworld));
    
    unsigned count,i;
    Method *methods = class_copyMethodList(self.class, &count);
    for (i = 0; i<count; i++) {
        Method item = methods[i];
        NSLog(@"======%@",NSStringFromSelector(method_getName(item)));
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)printHelloworld {
    NSLog(@"helloworld");
}

- (void)printHelloSchool {
    NSLog(@"printHelloSchool");
}

void printHelloTom (id self, SEL _cmd) {
    NSLog(@"helloTom");
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {

    if ([NSStringFromSelector(sel) isEqualToString:@"printHelloworld1"]) {
        class_addMethod(self.class, @selector(printHelloworld5656), (IMP)printHelloTom, "v@");
    }
    return YES;
}

@end
