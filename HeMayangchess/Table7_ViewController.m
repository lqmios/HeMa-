//
//  Table7_ViewController.m
//  HeMayangchess
//
//  Created by lqm on 16/8/12.
//  Copyright © 2016年 LQM. All rights reserved.
//

#import "Table7_ViewController.h"
#import "UserModel.h"
#import "Masonry.h"
#import "Maintain_Cell.h"
#import "UIImageView+WebCache.h"
#import "FineTireVC.h"


#define CellIdendifier @"CellIdendifier"

@interface Table7_ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,strong)NSMutableArray *floor2Array;
@property(nonatomic,strong)UICollectionView *MyCollectView;
@property(nonatomic,strong)UIView *myView;
@property(nonatomic,strong)UIImageView *imageView;

@end

@implementation Table7_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
     self.title = self.titleString;
    _floor2Array = [NSMutableArray array];
    _floor2Array = [UserModel sharedUserModel].Floor2;
    [_MyCollectView reloadData];
//    NSLog(@"_floor2Array = %@",_floor2Array);
    

    [self.view addSubview:self.myView];
    [self initWith];
    
    //隐藏导航栏返回字体
    [[UIBarButtonItem appearance]setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)forBarMetrics:UIBarMetricsDefault];
    //返回箭头颜色
    [[UINavigationBar appearance] setTintColor:COLOR(255, 66, 0.0, 1)];
    
    
    


    if ([[[UIDevice currentDevice] systemVersion] floatValue]>7.0?YES:NO)
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    UIScrollView *scr = [[UIScrollView alloc]init];
    scr.pagingEnabled = NO;

//    scr.backgroundColor = COLOR(255, 255, 255, 0.9);
    scr.backgroundColor = [UIColor lightGrayColor];

    [self.view addSubview:scr];
    [scr mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.top.mas_equalTo((Screen_height/5 + 0.5));
        make.left.equalTo(self.view.mas_left).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        // 让scrollview的contentSize随着内容的增多而变化
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(0);
        
    }];
     scr.contentSize = CGSizeMake(Screen_width, (Screen_height)*7/9);
    
//    [scr addSubview:self.MyCollectView];
    [self.view addSubview:self.MyCollectView];
    
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
    
//    self.navigationController.navigationBar.hidden = YES;
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

-(void)initWith
{
    UIImageView *headimagView = [[UIImageView alloc]init];
    headimagView.image = [UIImage imageNamed:@"luntai-1"];
    [self.view addSubview:headimagView];
    [headimagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 60));
        make.left.equalTo(self.myView.mas_left).offset(70);
        make.centerY.equalTo(self.myView.mas_centerY);
        
    }];
    UILabel *label1 = [[UILabel alloc]init];
    label1.text = @"汽车轮胎";
    label1.textAlignment = NSTextAlignmentLeft;
    label1.textColor = [UIColor blackColor];
    label1.font = [UIFont systemFontOfSize:18];
    [self.myView addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(headimagView.mas_right).offset(10);
        make.width.mas_equalTo(100);
        make.top.mas_equalTo(headimagView.mas_top).offset(15);
        
    }];
    UILabel *label2 = [[UILabel alloc]init];
    label2.text = @"一键智能选购";
    label2.textAlignment = NSTextAlignmentLeft;
    label2.textColor = [UIColor lightGrayColor];
    label2.font = [UIFont systemFontOfSize:13];
    [self.myView addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(headimagView.mas_right).offset(10);
        make.width.mas_equalTo(300);
        make.top.mas_equalTo(label1.mas_bottom).offset(1);
        
    }];
    //添加手势
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [self.myView addGestureRecognizer:tapGesture];
    
}

-(UIView *)myView
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue]>7.0?YES:NO)
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    if (_myView == nil) {
        
        _myView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Screen_width, Screen_height/5)];
        _myView.backgroundColor = [UIColor whiteColor];
    }
    return _myView;
}


-(UICollectionView *)MyCollectView
{
    if (_MyCollectView == nil) {
        
        if ([[[UIDevice currentDevice] systemVersion] floatValue]>7.0?YES:NO)
        {
            self.edgesForExtendedLayout = UIRectEdgeNone;
        }
        //Screen_height/2 + Screen_height/4 + 5 - 44
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumInteritemSpacing = 0;//列距
        flowLayout.minimumLineSpacing = 10;

//           _MyCollectView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0 ,Screen_width, (Screen_height)*7/9 ) collectionViewLayout:flowLayout];
        _MyCollectView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, (Screen_height/5 + 0.5) ,Screen_width, (Screen_height- (Screen_height/5 + 0.5)-64) ) collectionViewLayout:flowLayout];

        _MyCollectView.backgroundColor = COLOR(255, 255, 255, 0.9);
        [_MyCollectView registerClass:[Maintain_Cell class] forCellWithReuseIdentifier:CellIdendifier];
        _MyCollectView.showsVerticalScrollIndicator = NO;
        _MyCollectView.scrollEnabled = YES;
        _MyCollectView.delegate = self;
        _MyCollectView.dataSource = self;
        _MyCollectView.alwaysBounceVertical = YES;
    
        
    }
    return _MyCollectView;
}


#pragma mark --UICollectionViewDataSource,UICollectionViewDelegate----
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return _floor2Array.count ;
    
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    Maintain_Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdendifier forIndexPath:indexPath];
    
    for (int i  = 0; i < _floor2Array.count; i ++) {
        NSString *imageString = _floor2Array[indexPath.row][@"TowSortImg"];
        
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:imageString]];
        cell.titleLab.text = _floor2Array[indexPath.row][@"TowSort"];
    }
    
    cell.backgroundColor = [UIColor whiteColor];
    
    
    return cell;
}

//元素大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake((Screen_width - 3.5)/4,(Screen_height)/9);
    
    //    return CGSizeMake(SCREEN_WIDTH/9,ItemHeight);
}
//设置cell与边缘的间隔
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    UIEdgeInsets inset = UIEdgeInsetsMake(0, 0, 0, 0);
    return inset;
}

//最小行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 25;
}

//最小列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//     UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
//    FineTireVC *fineTireVC = [storyboard instantiateViewControllerWithIdentifier:@"FineTireVC"];
//    [self.navigationController pushViewController:fineTireVC animated:YES];
    
   
    
}
#pragma mark ----手势方法----
-(void)tapAction:(UITapGestureRecognizer *)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    FineTireVC *fineTireVC = [storyboard instantiateViewControllerWithIdentifier:@"FineTireVC"];
    [self.navigationController pushViewController:fineTireVC animated:YES];
    
    
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
