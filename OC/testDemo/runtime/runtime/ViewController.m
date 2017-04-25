//
//  ViewController.m
//  runtime
//
//  Created by 江连松 on 2017/4/21.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "ViewController.h"
#import "ViewController+Function.h"
#import <objc/runtime.h>
#import <objc/message.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //使用1:分类增加属性
    self.address = @"jiangliansong-Chinese.hubei";
    NSLog(@"self.address = %@",self.address);
    
    //直接调用objc_msgSend()
    void(*action)(id,SEL,NSString*) = (void(*)(id,SEL,NSString*))objc_msgSend;
    action(self,@selector(printf:),@"jiangliansong");
    
    //使用2:runtime创建一个对象
    Class newClass = objc_getClass("SendMessage");
    id instance = [[newClass alloc]init];
    [instance setValue:@"jiangliansong" forKey:@"message"];
    NSLog(@"%@--%@",NSStringFromClass([instance class]),[instance valueForKey:@"message"]);
    
    //runtime创建控制器
    Class nextVCClass = objc_getClass("ViewControllerA");
    id nextVC = [[nextVCClass alloc]init];
    [nextVC setValue:@"jiang" forKey:@"title"];
    [self.navigationController pushViewController:nextVC animated:YES];
    
    //使用3:runtime读写属性
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList(newClass, &outCount);
    for (i=0; i<outCount; i++) {
        objc_property_t property = properties[i];
        NSString *name = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        NSLog(@"第%d个属性--%@",i,name);
    }
    free(properties);
}


- (void)printf:(NSString *)message {
    NSLog(@"%@",message);
}

- (void)function1 {
    NSLog(@"%s",__FUNCTION__);
}

- (void)function2 {
    NSLog(@"%s",__FUNCTION__);
}

void func3(id self, SEL _cmd) {
    NSLog(@"%s",__FUNCTION__);
}

#pragma mark - 运行时

//使用4:拦截系统方法
- (IBAction)拦截系统方法:(UIButton *)sender {
    Method *mothod = class_getInstanceMethod([ViewController class], @selector(viewWillDisappear:));
    NSLog(@"====");
}

//使用5:动态交换方法
- (IBAction)动态交换方法:(id)sender {
    Method method1 = class_getInstanceMethod([self class], @selector(function1));
    Method method2 = class_getInstanceMethod([self class], @selector(function2));
    method_exchangeImplementations(method2, method1);
    
    [self function1];
}

//使用6:动态添加方法
- (IBAction)动态添加方法:(id)sender {
    class_addMethod([self class], @selector(function3), (IMP)func3, "v@:");
    if ([self respondsToSelector:@selector(function3)]) {
        [self performSelector:@selector(function3)];
    }else {
        NSLog(@"add method error");
    }
}

@end
