//
//  CarViewController.m
//  CoreData使用
//
//  Created by 江连松 on 2017/5/6.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import "CarViewController.h"

@interface CarViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *brandsArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation CarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = self.person.person_id;
    _dataArray = [NSMutableArray arrayWithCapacity:0];
    _tableView.tableFooterView = [UIView new];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"➕" style:UIBarButtonItemStylePlain target:self action:@selector(insertCar)];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _dataArray = [[DataBase shareDataBase] getAllObjects:NSStringFromClass([Car class])];
    [_tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
- (void)insertCar {
    
    Car *entity = [NSEntityDescription insertNewObjectForEntityForName:@"Car" inManagedObjectContext:[DataBase shareDataBase].managedContext];
    entity.car_id = [NSString stringWithFormat:@"car_%u",arc4random()%100];
    entity.brand = self.brandsArray[arc4random()%6];
    entity.price = @(arc4random()%1000000+300000);
    entity.owner = self.person;
    [[DataBase shareDataBase] insertObject:entity];
    
    _dataArray = [[DataBase shareDataBase] getAllObjects:NSStringFromClass([Car class])];
    [_tableView reloadData];
    
//    NSPredicate *pre = [NSPredicate predicateWithBlock:^BOOL(id  _Nullable evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
//        
//        
//    }];
}

- (void)deleteCar:(Car *)car {
    [[DataBase shareDataBase] deleteObject:car];
    _dataArray = [[DataBase shareDataBase] getAllObjects:NSStringFromClass([Car class])];
    [_tableView reloadData];
}

#pragma mark - UITableView

- (NSInteger)tableView:(__unused UITableView *)tableView
 numberOfRowsInSection:(__unused NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    Car *car = _dataArray[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",car.car_id,car.brand];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"售价:%@",car.price];
    return cell;
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewRowAction *delete = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [self deleteCar:_dataArray[indexPath.row]];
    }];
    return @[delete];
}


#pragma mark - getter && setter

- (NSArray *)brandsArray {
    if (_brandsArray == nil) {
        _brandsArray = @[@"宝马",@"奔驰",@"捷豹",@"宾利",@"保时捷",@"悍马"];
    }
    return _brandsArray;
}

@end
