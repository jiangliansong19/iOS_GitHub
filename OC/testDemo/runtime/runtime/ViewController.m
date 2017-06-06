//
//  ViewController.m
//  runtime
//
//  Created by 江连松 on 2017/4/21.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "ViewController.h"
#import "ViewController+Function.h"
#import "SendMessage.h"
#import <objc/runtime.h>
#import <objc/message.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"%p === ",@selector(printfSELAddress));
    
    //使用1:分类增加属性
    self.address = @"jiangliansong-Chinese.hubei";
    NSLog(@"self.address = %@",self.address);
    
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
    objc_property_t *properties = class_copyPropertyList([UITableViewCell class], &outCount);
    for (i=0; i<outCount; i++) {
        objc_property_t property = properties[i];
        NSString *name = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        NSLog(@"第%d个属性--%@",i,name);
    }
    free(properties);
}

- (void)printfSELAddress {
    
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

- (void)printf:(NSString *)message {
    NSLog(@"%s--%@",__FUNCTION__,message);
}

#pragma mark - 运行时

//使用4:拦截系统方法
- (IBAction)拦截系统方法:(UIButton *)sender {
    class_getInstanceMethod([ViewController class], @selector(viewWillDisappear:));
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

- (IBAction)直接调用objc_msgSend:(UIButton *)sender {
    
    //直接调用objc_msgSend()
    void(*action)(id,SEL,NSString*) = (void(*)(id,SEL,NSString*))objc_msgSend;
    action(self,@selector(printf:),@"jiangliansong");
    
    
}

- (IBAction)直接调用objc_msgForward:(id)sender {
    
    //一旦调用_objc_msgForward，将跳过查找 IMP 的过程，直接触发“消息转发”，
    //即使这个对象确实已经实现了这个方法，你也会告诉objc_msgSend：“我没有在这个对象里找到这个方法的实现”
    void(*action)(id,SEL,NSString*) = (void(*)(id,SEL,NSString*))_objc_msgForward;
    action(self,@selector(printf:),@"jiangliansong");
    
    [self performSelector:@selector(printf:)];
}

- (IBAction)获取对象的属性列表:(id)sender {
    
    NSMutableArray *ivarsArray = [NSMutableArray arrayWithCapacity:0];
    NSMutableArray *typesArray = [NSMutableArray arrayWithCapacity:0];
    unsigned int count = 0;
    
    Ivar *ivars = class_copyIvarList([SendMessage class], &count);
    
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        //根据ivar获得其成员变量的名称
        const char *name = ivar_getName(ivar);
        
        //C的字符串转OC的字符串
        NSString *key = [NSString stringWithUTF8String:name];
        //放入数组
        NSString *keyString = [key stringByReplacingOccurrencesOfString:@"_" withString:@""];
        [ivarsArray addObject:keyString];
        
        // 获取变量类型，c字符串
        const char *cType = ivar_getTypeEncoding(ivar);
        //C的字符串转OC的字符串
        NSString *Type = [NSString stringWithUTF8String:cType];
        NSLog(@"======%@",Type);
        
        NSString *repleaceString = [self repleaceStringWithCSting:Type];
        //放入数组
        [typesArray addObject:repleaceString];
    }

}

/*****属性和数据库数据的类型相互转换*****/

- (NSString *)repleaceStringWithCSting:(NSString *)cSting{
    if (![cSting isEqualToString:@""]) {
        if ([cSting isEqualToString:@"i"]) {
            return @"int";
        }else if([cSting isEqualToString:@"q"]){
            return @"double";
        }else if([cSting isEqualToString:@"f"]){
            return @"float";
        }else if([cSting isEqualToString:@"d"]){
            return @"double";
        }else if([cSting isEqualToString:@"B"]){
            return @"int";
        }else if([cSting containsString:@"NSString"]){
            return @"text";
        }else if([cSting containsString:@"NSNumber"]){
            return @"long";
        }
        NSAssert(1, @"handleSqliteTable类中 model的属性状态不对导致数据库状态不对，请核对后再拨");
        return @"未知";
    }else return nil;
}
@end
