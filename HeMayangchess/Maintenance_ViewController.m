//
//  Maintenance_ViewController.m
//  HeMayangchess
//
//  Created by lqm on 16/8/6.
//  Copyright © 2016年 LQM. All rights reserved.
//

#import "Maintenance_ViewController.h"
#import "UserModel.h"
//#import "Floor2Model.h"
#import "Maintain_Cell.h"
#import "Masonry.h"
#import "Mainten_ChooseVC.h"

#import "UIImageView+WebCache.h"
#define CellIdendifier @"CellIdendifier"
@interface Maintenance_ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong)NSMutableArray *floor2Array;
@property(nonatomic,strong)UICollectionView *MyCollectView;
@property(nonatomic,strong)UIView *myView;
@property(nonatomic,strong)UIImageView *imageView;
@end

@implementation Maintenance_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.title = self.titleString;
    
    
    _floor2Array = [NSMutableArray array];
    
   
    //    self.collectionView.scrollEnabled =NO;
    _floor2Array = [UserModel sharedUserModel].Floor2;
    NSLog(@"_floor2Array = %@",_floor2Array);

  
    [self.view addSubview:self.MyCollectView];
    [self.view addSubview:self.myView];
    [self initWith];

    //隐藏导航栏返回字体
    [[UIBarButtonItem appearance]setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)forBarMetrics:UIBarMetricsDefault];
    //返回箭头颜色
    [[UINavigationBar appearance] setTintColor:COLOR(255, 66, 0.0, 1)];

   

}
-(void)initWith
{
    UIImageView *headimagView = [[UIImageView alloc]init];
    headimagView.image = [UIImage imageNamed:@"baoyang-1"];
    [self.view addSubview:headimagView];
    [headimagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 60));
        make.left.equalTo(self.myView.mas_left).offset(70);
        make.centerY.equalTo(self.myView.mas_centerY);
        
    }];
    UILabel *label1 = [[UILabel alloc]init];
    label1.text = @"做保养";
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
    label2.text = @"根据爱车信息 定制推荐";
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


-(UICollectionView *)MyCollectView
{
    if (_MyCollectView == nil) {
        
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            if ([[[UIDevice currentDevice] systemVersion] floatValue]>7.0?YES:NO)
            {
                self.edgesForExtendedLayout = UIRectEdgeNone;
            }
        });
        //Screen_height/2 + Screen_height/4 + 5 - 44
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumInteritemSpacing = 0;//列距
        flowLayout.minimumLineSpacing = 10;
        _MyCollectView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, (Screen_height/5 + 0.5) ,Screen_width, (Screen_height)) collectionViewLayout:flowLayout];
        //    _MyCollectView.backgroundColor = ColorRGB(0xf7f7f7);
        _MyCollectView.backgroundColor = COLOR(255, 255, 255, 0.9);
        [_MyCollectView registerClass:[Maintain_Cell class] forCellWithReuseIdentifier:CellIdendifier];
        _MyCollectView.showsVerticalScrollIndicator = NO;
        _MyCollectView.scrollEnabled = YES;
        _MyCollectView.delegate = self;
        _MyCollectView.dataSource = self;
        
    }
    return _MyCollectView;
}


#pragma mark --UICollectionViewDataSource,UICollectionViewDelegate----
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return _floor2Array.count;
    
    
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
 
    
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
//    
//            Mainten_ChooseVC *chooseVC = [storyboard instantiateViewControllerWithIdentifier:@"Mainten_ChooseVC"];
//            [self.navigationController pushViewController:chooseVC animated:YES];
//    
    
    
}
#pragma mark ----手势方法----
-(void)tapAction:(UITapGestureRecognizer *)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    Mainten_ChooseVC *chooseVC = [storyboard instantiateViewControllerWithIdentifier:@"Mainten_ChooseVC"];
    [self.navigationController pushViewController:chooseVC animated:YES];
    
    
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
