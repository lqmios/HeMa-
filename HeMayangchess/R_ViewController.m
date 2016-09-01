//
//  R_ViewController.m
//  HeMayangchess
//
//  Created by lqm on 16/8/18.
//  Copyright © 2016年 LQM. All rights reserved.
//

#import "R_ViewController.h"
#import "FineTireVC.h"
#import "Masonry.h"
#import "TableChooseCell.h"
#import "UserModel.h"

@interface R_ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSString *str;
@property(nonatomic,strong)NSMutableArray *dataSource;
@property(nonatomic,strong)UITableView *myTabelView;
@property(nonatomic,strong)NSIndexPath * currentSelectIndex;


@end

@implementation R_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"选择半径";
    
    //取出文件中的数组
    NSString *plistPath = [[NSBundle mainBundle]pathForResource:@"zhijin_R" ofType:@"plist"];
    _dataSource = [NSMutableArray arrayWithContentsOfFile:plistPath];
    NSLog(@"_dataSource = %@",_dataSource);
    _str = nil;
    
    //
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sureBtn.backgroundColor = COLOR(255, 67, 0, 1);
    sureBtn.layer.cornerRadius = 5;
    [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [sureBtn addTarget:self action:@selector(sureBtnAcion:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sureBtn];
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(20);
        make.right.equalTo(self.view.mas_right).offset(-20);
        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
        make.height.mas_equalTo(45);
    }];
    
    
    //去掉多余的cell
    self.myTabelView.tableFooterView=[[UIView alloc]init];
    [self.view addSubview:self.myTabelView];
    

    
    
    
}
-(void)viewWillAppear:(BOOL)animated
{
    
    if (self.tabBarController.tabBar.hidden == YES) {
        return;
    }
    UIView *contentView;
    if ( [[self.tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]] )
        contentView = [self.tabBarController.view.subviews objectAtIndex:1];
    else
    {
        contentView = [self.tabBarController.view.subviews objectAtIndex:0];
        contentView.frame = CGRectMake(contentView.bounds.origin.x,  contentView.bounds.origin.y,  contentView.bounds.size.width, contentView.bounds.size.height + self.tabBarController.tabBar.frame.size.height);
        self.tabBarController.tabBar.hidden = YES;
    }
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    if (self.tabBarController.tabBar.hidden == NO)
    {
        return;
    }
    UIView *contentView;
    if ([[self.tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]])
        
        contentView = [self.tabBarController.view.subviews objectAtIndex:1];
    
    else{
        
        contentView = [self.tabBarController.view.subviews objectAtIndex:0];
        contentView.frame = CGRectMake(contentView.bounds.origin.x, contentView.bounds.origin.y,  contentView.bounds.size.width, contentView.bounds.size.height - self.tabBarController.tabBar.frame.size.height);
        self.tabBarController.tabBar.hidden = NO;
    }
}



-(NSMutableArray *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
-(UITableView *)myTabelView
{
    if (_myTabelView == nil) {
        _myTabelView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Screen_width, Screen_height - 80 - 64) style:UITableViewStylePlain];
        _myTabelView.dataSource = self;
        _myTabelView.delegate = self;
    }
    return _myTabelView;
}



#pragma UITableViewDelegate - UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * identifier = [NSString stringWithFormat:@"cellId%ld",(long)indexPath.row];
    TableChooseCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell)
    {
        cell = [[TableChooseCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.titleLabel.text = _dataSource[indexPath.row];
    //取消cell点击闪一下的状态
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_currentSelectIndex!=nil&&_currentSelectIndex != indexPath) {
        TableChooseCell * cell = [tableView cellForRowAtIndexPath:_currentSelectIndex];
        [cell UpdateCellWithState:NO];
    }
    TableChooseCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell UpdateCellWithState:!cell.isSelected];
    _currentSelectIndex = indexPath;
    
    _str = _dataSource[indexPath.row];
    
    NSLog(@"_str = %@",_str);
    
    // 取消选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}

-(void)sureBtnAcion:(UIButton *)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    FineTireVC *fineVC = [storyboard instantiateViewControllerWithIdentifier:@"FineTireVC"];
    [self.navigationController pushViewController:fineVC animated:YES];
    
    [UserModel sharedUserModel].rTextField = _str;
}


-(void)ReloadData{
    [self.myTabelView reloadData];
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
