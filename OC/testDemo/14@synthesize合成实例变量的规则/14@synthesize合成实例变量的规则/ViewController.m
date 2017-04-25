//
//  ViewController.m
//  14@synthesize合成实例变量的规则
//
//  Created by 江连松 on 2017/4/15.
//  Copyright © 2017年 JLS. All rights reserved.
//


//@synthesize合成实例变量的规则是什么？
//假如property名为foo，存在一个名为_foo的实例变量，那么还会自动合成新变量么？


#import "ViewController.h"

@interface ViewController ()
{
    NSString *_address;
    NSString *_village;
}


//如果使用了属性的话，那么编译器就会自动编写访问属性所需的方法，此过程叫做“自动合成”(auto synthesis)
//需要强调的是，这个过程由编译器在编译期执行，所以编辑器里看不到这些“合成方法” (synthesized method)的源代码。
//除了生成方法代码之外，编译器还要自动向类中添加适当类型的实例变量，并且在属性名前面加下划线，以此作为实例变量的名字。
//将会默认生成两个实例变量 _firstName, _lastName;
@property NSString *firstName;
@property NSString *lastName;


@property NSString *country; //@synthesize country = _country;
@property NSString *_country;//这个属性将不会再自动合成 @synthesize _country = __country;



@property NSString *village;//将生成与_village同名的成员变量。


@property NSString *_address;//使用时，是self._address, __address;

@end



@implementation ViewController


//上述语法会将生成的实例变量命名为 _myFirstName 与 _myLastName ，而不再使用默认的名字。
@synthesize firstName = _myFristName;
@synthesize lastName = _myLastName;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _myFristName = @"jiang";
    _myLastName = @"liansong";
    NSLog(@"%@%@",_myFristName,_myLastName);
    NSLog(@"%@%@",self.firstName,self.lastName);
    
    self._address = @"中国湖北省";
    NSLog(@"self._address = %@",self._address);
    NSLog(@"__address = %@",__address);
    
    _address = @"美国华盛顿";
    NSLog(@"_address = %@",_address);
    
    _village = @"CCC";
    self.village = @"杨浦村";
    NSLog(@"%@,%@",self.village,_village);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
