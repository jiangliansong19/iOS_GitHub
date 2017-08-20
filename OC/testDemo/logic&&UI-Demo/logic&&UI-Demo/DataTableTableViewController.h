//
//  DataTableTableViewController.h
//  logic&&UI-Demo
//
//  Created by 江连松 on 2017/7/7.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataTableTableViewController : UITableViewController

@end


@interface DataTableCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *first;
@property (nonatomic, weak) IBOutlet UILabel *second;
@property (nonatomic, weak) IBOutlet UILabel *third;
@end
