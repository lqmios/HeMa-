//
//  Mainten_ProjectVC.m
//  HeMayangchess
//
//  Created by lqm on 16/8/15.
//  Copyright © 2016年 LQM. All rights reserved.
//

#import "Mainten_ProjectVC.h"
#import "Masonry.h"
#import "Project_TableViewCell.h"
//去除复用机制，滑动时容易错误
static NSString *CellIdendifier = @"CellIdendifier";

@interface Mainten_ProjectVC ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view3;
@property(nonatomic,strong)UITableView *myTabelView;
@property(nonatomic,strong)NSMutableArray *dataSource;

@end

@implementation Mainten_ProjectVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"保养项目";
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.view1.backgroundColor = COLOR(248, 248, 248, 1);
    self.view2.backgroundColor = COLOR(248, 248, 248, 1);
    self.view3.backgroundColor = COLOR(248, 248, 248, 1);
  
    
    [self.view addSubview:self.view1];
    [self.view addSubview:self.view2];
    [self.view addSubview:self.view3];
    
    //取出文件中的数组
    NSString *plistPath = [[NSBundle mainBundle]pathForResource:@"engineOil" ofType:@"plist"];
    _dataSource = [NSMutableArray arrayWithContentsOfFile:plistPath];

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
        contentView = [self.tabBarController.view.subviews objectAtIndex:0];
    contentView.frame = CGRectMake(contentView.bounds.origin.x,  contentView.bounds.origin.y,  contentView.bounds.size.width, contentView.bounds.size.height + self.tabBarController.tabBar.frame.size.height);
    self.tabBarController.tabBar.hidden = YES;
    
    
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
    
    else
        
        contentView = [self.tabBarController.view.subviews objectAtIndex:0];
    contentView.frame = CGRectMake(contentView.bounds.origin.x, contentView.bounds.origin.y,  contentView.bounds.size.width, contentView.bounds.size.height - self.tabBarController.tabBar.frame.size.height);
    self.tabBarController.tabBar.hidden = NO;
}

#pragma mark ---------
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
        
        if ([[[UIDevice currentDevice] systemVersion] floatValue]>7.0?YES:NO)
        {
            self.edgesForExtendedLayout = UIRectEdgeNone;
        }
        
        _myTabelView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Screen_width, Screen_height - 64 - 60) style:UITableViewStylePlain];
        _myTabelView.dataSource = self;
        _myTabelView.delegate = self;
        [_myTabelView registerNib:[UINib nibWithNibName:@"Project_TableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:CellIdendifier];
        //去掉多余的cell
        self.myTabelView.tableFooterView=[[UIView alloc]init];
    }
    return _myTabelView;
}

#pragma mark --UITableViewDataSource,UITableViewDelegate--
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Project_TableViewCell *proCell = [tableView dequeueReusableCellWithIdentifier:CellIdendifier forIndexPath:indexPath];
    
    proCell.titleLabel.text = _dataSource[indexPath.row];
    
    NSString *string = @"120";
    proCell.currentLabel.text = string;
    
    //取消cell点击闪一下的状态
    proCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return proCell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取消选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
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


























