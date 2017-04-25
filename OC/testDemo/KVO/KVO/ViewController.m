//
//  ViewController.m
//  KVO
//
//  Created by 江连松 on 2017/4/17.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()
{
    NSString *_firstName;
}

@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (nonatomic, strong) Person *person;
@property (nonatomic, strong) NSString *name;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    self.person = [Person new];
    [self.person addObserver:self forKeyPath:@"address" options:NSKeyValueObservingOptionOld| NSKeyValueObservingOptionNew context:nil];
    
    //有属性变量_firstName,赋值是，key可以位 firstName或者_firstName;
    [self setValue:@"jiang" forKey:@"firstName"];
    NSLog(@"_firstName = %@", _firstName);
    [self setValue:@"lian" forKey:@"_firstName"];
    NSLog(@"_firstName = %@", _firstName);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//1.复制时，会自动触发KVO
- (IBAction)buttonAction:(UIButton *)sender {
    self.name = _nameTF.text;
}

//2.同时使用以下两个方法，会出发KVO
- (IBAction)buttonAction2:(UIButton *)sender {
    [self.person willChangeValueForKey:@"address"];
    [self.person didChangeValueForKey:@"address"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"name"]) {
        NSLog(@"self.name = %@",self.name);
    }else if ([keyPath isEqualToString:@"address"]) {
        NSLog(@"self.person.address = %@", _nameTF.text);
    }
}

@end
