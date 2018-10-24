//
//  JsonModelViewController.m
//  MainProject
//
//  Created by 江连松 on 2017/12/26.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "JsonModelViewController.h"

//#import "JSONModel.h"

@interface JsonModelViewController ()
@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@end

@implementation JsonModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = RGB(20, 90, 86);
    NSString *path = [[NSBundle mainBundle].bundlePath stringByReplacingOccurrencesOfString:@"MainProject.app" withString:@"JMResource.bundle"];
    NSBundle *bundle = [NSBundle bundleWithPath:path];
    
    
    
    
    _imageView.image = [UIImage imageNamed:@"girl" inBundle:bundle compatibleWithTraitCollection:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
