//
//  Repair_ViewController.m
//  HeMayangchess
//
//  Created by lqm on 16/8/6.
//  Copyright © 2016年 LQM. All rights reserved.
//

#import "Repair_ViewController.h"
#import "Repair_TableViewCell.h"
#define CellIdendifier @"CellIdendifier"
@interface Repair_ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *repairTablewiew;

@end

@implementation Repair_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self.repairTablewiew registerNib:[UINib nibWithNibName:@"Repair_TableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:CellIdendifier];
    self.repairTablewiew.delegate = self;
    self.repairTablewiew.dataSource = self;
    

    
}

#pragma mark --UITableViewDataSource,UITableViewDelegate--
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Repair_TableViewCell *cell;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
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
