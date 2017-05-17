//
//  PersonViewController.m
//  CoreData使用
//
//  Created by 江连松 on 2017/5/4.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "PersonViewController.h"
#import "CarViewController.h"
#import "DataBase.h"
#import "Person+CoreDataProperties.h"
#import <CoreData/CoreData.h>

@interface PersonViewController ()<UITabBarDelegate,UITableViewDataSource,UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, assign) NSInteger editingRow;

@end

@implementation PersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _dataArray = [NSMutableArray arrayWithCapacity:0];
    
    self.tableView.tableFooterView = [UIView new];
    
    UIBarButtonItem *refresh = [[UIBarButtonItem alloc]initWithTitle:@"⏳" style:UIBarButtonItemStylePlain target:self action:@selector(showAllPerson)];
    UIBarButtonItem *insert = [[UIBarButtonItem alloc]initWithTitle:@"➕" style:UIBarButtonItemStylePlain target:self action:@selector(insertPerson)];
    UIBarButtonItem *search = [[UIBarButtonItem alloc]initWithTitle:@"🔍" style:UIBarButtonItemStylePlain target:self action:@selector(searchPerson)];
    self.navigationItem.rightBarButtonItems  = @[refresh, insert, search];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _dataArray = [[DataBase shareDataBase] getAllObjects:NSStringFromClass([Person class])];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 增删查改

- (void)showAllPerson {
    _dataArray = [[DataBase shareDataBase] getAllObjects:NSStringFromClass([Person class])];
    [_tableView reloadData];
}

- (void)insertPerson {
    
    Person *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:[DataBase shareDataBase].managedContext];
    person.person_id = [NSString stringWithFormat:@"person_%ld",random()%999];
    person.age = [NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%ld",random()%100]];
    [[DataBase shareDataBase] insertObject:person];
    
    _dataArray = [[DataBase shareDataBase] getAllObjects:NSStringFromClass([Person class])];
    [_tableView reloadData];
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations" // 忽略警告
- (void)searchPerson {
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"按id查找某人" message:@"" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    alertView.tag = 101;
    [alertView show];
}

- (void)deletePerson {
    
    [[DataBase shareDataBase] deleteObject:_dataArray[_editingRow]];
    [_dataArray removeObjectAtIndex:_editingRow];
    [_tableView reloadData];
}

- (void)modifyPerson {
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"修改某人的年龄" message:@"" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    alertView.tag = 102;
    [alertView show];
}


#pragma mark - alertView 

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 1 && alertView.tag == 101) {
        NSString *text = [alertView textFieldAtIndex:0].text;
        NSPredicate *pre = [NSPredicate predicateWithFormat:@"person_id = %@",[NSString stringWithFormat:@"person_%@",text]];
        _dataArray = [[DataBase shareDataBase] searchObjcet:NSStringFromClass([Person class]) predicate:pre];
        [_tableView reloadData];
    }
    if (buttonIndex == 1 && alertView.tag == 102) {
        NSString *text = [alertView textFieldAtIndex:0].text;
        NSDecimalNumber *age = [NSDecimalNumber decimalNumberWithString:text];
        [[DataBase shareDataBase] modifyObject:_dataArray[_editingRow] changeContent:@{@"age":age}];
        [_tableView reloadData];
    }
}
#pragma clang diagnostic pop

#pragma mark - tableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc ] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    Person *obj = _dataArray[indexPath.row];
    cell.textLabel.text = obj.person_id;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"年龄%@",obj.age];
    return cell;
}

- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction *action1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        _editingRow = indexPath.row;
        [self deletePerson];
    }];
    UITableViewRowAction *action2 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"添加" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        _editingRow = indexPath.row;
        [self insertPerson];
    }];
    action2.backgroundColor = [UIColor blueColor];
    
    UITableViewRowAction *action3 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"修改" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        _editingRow = indexPath.row;
        [self modifyPerson];
    }];
    action3.backgroundColor = [UIColor orangeColor];
    return @[action1,action2,action3];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CarViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"CarViewController"];
    vc.person = _dataArray[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
