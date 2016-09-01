//
//  Mainten_ChooseVC.m
//  HeMayangchess
//
//  Created by lqm on 16/8/12.
//  Copyright © 2016年 LQM. All rights reserved.
//

#import "Mainten_ChooseVC.h"
#import "Masonry.h"
#import "Mainten_ProjectVC.h"
#import "CustomLine.h"

#import "PaiLiang_ViewController.h"
#import "EngineOil_ViewController.h"
#import "Price_ViewController.h"
#import "UserModel.h"
#import "Maintenance_ViewController.h"
//去除复用机制，滑动时容易错误
static NSString *CellIdendifier = @"CellIdendifier";

@interface Mainten_ChooseVC ()<UITextFieldDelegate>
{
    NSString *textField1;
    NSString *textField3;
}

@property(nonatomic,strong)  UITextField *textField;
@property (weak, nonatomic) IBOutlet UIView *brandView;

@property (weak, nonatomic) IBOutlet UIView *professionView;

@property (weak, nonatomic) IBOutlet UIView *serviceView;

@property (weak, nonatomic) IBOutlet UIScrollView *mContentScrollView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *label_1;
@property (weak, nonatomic) IBOutlet UILabel *label_2;
@property (weak, nonatomic) IBOutlet UILabel *label_3;
@property (weak, nonatomic) IBOutlet UILabel *label_4;

@property (weak, nonatomic) IBOutlet UILabel *label_5;
@property (weak, nonatomic) IBOutlet UITextField *textField_1;
@property (weak, nonatomic) IBOutlet UITextField *textField_2;
@property (weak, nonatomic) IBOutlet UITextField *textField_3;
@property (weak, nonatomic) IBOutlet UITextField *textField_4;
@property (weak, nonatomic) IBOutlet UITextField *textField_5;
@property (weak, nonatomic) IBOutlet UIView *view_1;
@property (weak, nonatomic) IBOutlet UIView *view_2;
@property (weak, nonatomic) IBOutlet UIView *view_3;
@property (weak, nonatomic) IBOutlet UIView *view_4;
@property (weak, nonatomic) IBOutlet UIView *view_5;


@property(nonatomic,strong)NSMutableArray *dataSorce;
@property(nonatomic,strong)NSMutableArray *mArray;

@end

@implementation Mainten_ChooseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = COLOR(255, 255, 255, 1);
    self.title = @"选择";
    [self initImageView];
    [self initScrollView];
    self.contentView.backgroundColor = [UIColor whiteColor];


    _dataSorce = [NSMutableArray arrayWithObjects:@"爱车价位",@"排量",@"当前行驶里程",@"机油品牌",@"保养价格", nil];
    _mArray = [NSMutableArray arrayWithObjects:@"点击输入车辆价格",@"请选择排量",@"点击输入里程",@"请选择机油品牌",@"此次保养的心理价位",nil];
    //注册通知 监听键盘的高度
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(kyeboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
#pragma mark ------传值----
    
    //从磁盘中读取数据
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        self.textField_1.text = [defaults objectForKey:@"textField1"];
    //从磁盘中读取数据
    NSUserDefaults *text3Defaults = [NSUserDefaults standardUserDefaults];
    self.textField_3.text = [text3Defaults objectForKey:@"textField3"];

  
    
    self.string_2 = [UserModel sharedUserModel].textFieldStr_2;
    self.textField_2.text = self.string_2;
    
    self.string_4 = [UserModel sharedUserModel].textFieldStr_4;
    self.textField_4.text = self.string_4;
    
    self.string_5 = [UserModel sharedUserModel].textFieldStr_5;
    self.textField_5.text = self.string_5;
#pragma mark ----
    //导航栏的左边存在BarButtonItm
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [leftButton setImage:[UIImage imageNamed:@"zuojiaobiao"] forState:UIControlStateNormal];
    
    leftButton.frame = CGRectMake(0, 0, 20, 30);
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = item;
    [leftButton addTarget:self action:@selector(leftbuttonAction:) forControlEvents:UIControlEventTouchUpInside];
    

}

-(NSMutableArray *)dataSorce
{
    if (_dataSorce == nil) {
        _dataSorce = [NSMutableArray array];
    }
    return _dataSorce;
}
-(NSMutableArray *)mArray
{
    if (_mArray == nil) {
        _mArray = [NSMutableArray array];
    }
    return _mArray;
}

-(void)initImageView
{
    self.brandView.backgroundColor = COLOR(248, 248, 248, 1);
    
    
    self.professionView.backgroundColor = COLOR(248, 248, 248, 1);
    self.serviceView.backgroundColor = COLOR(248, 248, 248, 1);
    UIImageView *brandImageView = [[UIImageView alloc]init];
    brandImageView.image = [UIImage imageNamed:@"zheng-1"];
    [self.brandView addSubview:brandImageView];
    [brandImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(35, 35));
        make.centerY.equalTo(self.brandView.mas_centerY);
        make.left.equalTo(self.brandView.mas_left).offset(15);
        
    }];
    UILabel *label1 = [[UILabel alloc]init];
    label1.text = @"正牌保障";
    label1.textColor = COLOR(255, 122, 37, 1);
    label1.textAlignment = NSTextAlignmentLeft;
    label1.font = [UIFont systemFontOfSize:12];
    [self.brandView addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(100, 20));
        make.right.equalTo(self.brandView.mas_right).offset(0);
        make.left.equalTo(brandImageView.mas_right).offset(0);
        make.centerY.equalTo(self.brandView.mas_centerY);
        
    }];
    
    //---------------
    UIImageView *professionalImageView = [[UIImageView alloc]init];
    professionalImageView.image = [UIImage imageNamed:@"zhuan-1"];
    [self.professionView addSubview:professionalImageView];
    [professionalImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(35, 35));
        make.centerY.equalTo(self.professionView.mas_centerY);
        make.left.equalTo(self.professionView.mas_left).offset(15);

        
    }];
    UILabel *label2 = [[UILabel alloc]init];
    label2.text = @"专业服务";
    label2.textColor = COLOR(255, 122, 37, 1);
    label2.textAlignment = NSTextAlignmentLeft;
    label2.font = [UIFont systemFontOfSize:12];
    [self.professionView addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.professionView.mas_right).offset(0);
        make.left.equalTo(professionalImageView.mas_right).offset(0);
        make.centerY.equalTo(self.professionView.mas_centerY);
        
    }];
//---------------
    UIImageView *serviceImageView = [[UIImageView alloc]init];
    serviceImageView.image = [UIImage imageNamed:@"zhuan-1"];
    [self.serviceView addSubview:serviceImageView];
    [serviceImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(35, 35));
        make.centerY.equalTo(self.serviceView.mas_centerY);
        make.left.equalTo(self.serviceView.mas_left).offset(15);
        
    }];
    UILabel *label3 = [[UILabel alloc]init];
    label3.text = @"售后无忧";
    label3.textColor = COLOR(255, 122, 37, 1);
    label3.textAlignment = NSTextAlignmentLeft;
    label3.font = [UIFont systemFontOfSize:12];
    [self.serviceView addSubview:label3];
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.serviceView.mas_right).offset(0);
        make.left.equalTo(serviceImageView.mas_right).offset(0);
        make.centerY.equalTo(self.serviceView.mas_centerY);
        
    }];
#pragma mark ---画线---

    CustomLine *line = [[CustomLine alloc] init];
    line.frame = CGRectMake(0, 15, 1, 20);
    [self.professionView addSubview:line];
    
    CustomLine *line1 = [[CustomLine alloc] init];
    line1.frame = CGRectMake(0, 15, 1, 20);
    [self.serviceView addSubview:line1];

    
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

-(void)initScrollView
{
    //去掉自带圆角
    self.textField_1.borderStyle =  UITextBorderStyleNone;
    self.textField_1.delegate = self;
    self.textField_1.keyboardType = UIKeyboardTypeNumberPad;

    self.textField_2.borderStyle =  UITextBorderStyleNone;
    self.textField_2.delegate = self;
    
    
    self.textField_3.borderStyle =  UITextBorderStyleNone;
    self.textField_3.delegate = self;
    self.textField_3.keyboardType = UIKeyboardTypeNumberPad;
    
    self.textField_4.borderStyle =  UITextBorderStyleNone;
    self.textField_4.delegate = self;
    
    self.textField_5.borderStyle =  UITextBorderStyleNone;
    self.textField_5.delegate = self;
#pragma mark ---画线---
    
    CustomLine *line_1 = [[CustomLine alloc] init];
    line_1.frame = CGRectMake(0, 70, Screen_width, 1);
    [self.contentView addSubview:line_1];
    
    CustomLine *label_2 = [[CustomLine alloc] init];
    label_2.frame = CGRectMake(0, 140, Screen_width, 1);
    [self.contentView addSubview:label_2];
    CustomLine *label_3 = [[CustomLine alloc] init];
    label_3.frame = CGRectMake(0, 210, Screen_width, 1);
    [self.contentView addSubview:label_3];
    CustomLine *label_4 = [[CustomLine alloc] init];
    label_4.frame = CGRectMake(0, 280, Screen_width, 1);
    [self.contentView addSubview:label_4];
    CustomLine *label_5 = [[CustomLine alloc] init];
    label_5.frame = CGRectMake(0, 350, Screen_width, 1);
    [self.contentView addSubview:label_5];
    
#pragma mark --添加手势-
    UITapGestureRecognizer *view2Tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(view2TapAction:)];
    [self.view_2 addGestureRecognizer:view2Tap];
    //
    UIView *pailangView = [[UIView alloc]init];
    pailangView.backgroundColor = [UIColor clearColor];
    [self.textField_2 addSubview:pailangView];
    [pailangView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.textField_2);
    }];
    UITapGestureRecognizer *pailangViewGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pailangViewGestureAction:)];
    [pailangView addGestureRecognizer:pailangViewGesture];
///
    UITapGestureRecognizer *view4Tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(view4TapAction:)];
    [self.view_4 addGestureRecognizer:view4Tap];
    
    //
    UIView *brandView = [[UIView alloc]init];
    brandView.backgroundColor = [UIColor clearColor];
    [self.textField_4 addSubview:brandView];
    [brandView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.textField_4);
    }];
    UITapGestureRecognizer *brandViewGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(brandViewGestureAction:)];
    [brandView addGestureRecognizer:brandViewGesture];
///////
    UITapGestureRecognizer *view5Tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(view5TapAction:)];
    [self.view_5 addGestureRecognizer:view5Tap];
    //
    UIView *priceView = [[UIView alloc]init];
    priceView.backgroundColor = [UIColor clearColor];
    [self.textField_5 addSubview:priceView];
    [priceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.textField_5);
    }];
    UITapGestureRecognizer *priceViewGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(priceViewGestureAction:)];
    [priceView addGestureRecognizer:priceViewGesture];

}


#pragma mark --buttonAction---
- (IBAction)buttonAction:(id)sender
{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    Mainten_ProjectVC *chooseVC = [storyboard instantiateViewControllerWithIdentifier:@"Mainten_ProjectVC"];
    [self.navigationController pushViewController:chooseVC animated:YES];
    
}

-(void)view2TapAction:(UITapGestureRecognizer *)sender
{
    PaiLiang_ViewController *paiLianeVC = [[PaiLiang_ViewController alloc]init];
    [self.navigationController pushViewController:paiLianeVC animated:YES];
    
}
-(void)pailangViewGestureAction:(UIGestureRecognizer *)sender
{
    PaiLiang_ViewController *paiLianeVC = [[PaiLiang_ViewController alloc]init];
    [self.navigationController pushViewController:paiLianeVC animated:YES];
}
-(void)view4TapAction:(UITapGestureRecognizer *)sender
{
    EngineOil_ViewController *engineVC = [[EngineOil_ViewController alloc]init];
    [self.navigationController pushViewController:engineVC animated:YES];
    
}
-(void)brandViewGestureAction:(UITapGestureRecognizer *)sender
{
    EngineOil_ViewController *engineVC = [[EngineOil_ViewController alloc]init];
    [self.navigationController pushViewController:engineVC animated:YES];
}

-(void)view5TapAction:(UITapGestureRecognizer *)sender
{
    
    Price_ViewController *PriceVC = [[Price_ViewController alloc]init];
    [self.navigationController pushViewController:PriceVC animated:YES];
}
-(void)priceViewGestureAction:(UITapGestureRecognizer *)sender
{
    
    Price_ViewController *PriceVC = [[Price_ViewController alloc]init];
    [self.navigationController pushViewController:PriceVC animated:YES];
}
-(void)leftbuttonAction:(UIButton *)sender
{
    //拿到栈里面的所有视图
    NSArray *allViewArray = self.navigationController.viewControllers;
    
    for (UIViewController *viewController in allViewArray)
    {
        //isKindOfClass检测该对象是否是该类或派生类的成员
        if ([viewController isKindOfClass:[Maintenance_ViewController class]])
        {
            //返回到指定页面
            [self.navigationController popToViewController:viewController animated:YES];
        }
    }
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//通知的实现
- (void)keyboardWillShow:(NSNotification *)notification
{
    //键盘弹出后的frame
    NSValue *keyboardBoundsValue = [[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardBounds;
    [keyboardBoundsValue getValue:&keyboardBounds];
    
    UIEdgeInsets e = UIEdgeInsetsMake(0, 0, keyboardBounds.size.height-70, 0);
    [_mContentScrollView setContentInset:e];
    
    //调整滑动条距离窗口底边的距离
    [_mContentScrollView setScrollIndicatorInsets:e];
    
}

- (void)kyeboardWillHide:(NSNotification *)notification
{
    
    //键盘缩回后，恢复正常设置
    UIEdgeInsets e = UIEdgeInsetsMake(0, 0, 0, 0);
    [_mContentScrollView setScrollIndicatorInsets:e];
    [_mContentScrollView setContentInset:e];
}
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark --UITextFieldDelegate-

-(BOOL)textFieldShouldBeginEditing:(UITextField*)textField{
    if (textField == self.textField_2)
    {
        return NO;
    }
    else if (textField == self.textField_4)
    {
        return NO;
    }
    else if (textField == self.textField_5)
    {
        return NO;
    }
    else
    {
        return YES;
    }
    
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    // 使用 NSUserDefaults 保存数据到磁盘
    textField1 = self.textField_1.text;
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    //save
    [defaults setObject:textField1 forKey:@"textField1"];
    //写入磁盘
    [defaults synchronize];
//    NSLog(@"textFieldstr%@",textFieldstr);
    
    textField3 = self.textField_3.text;
    NSUserDefaults *text3Defaults = [NSUserDefaults standardUserDefaults];
    [text3Defaults setObject:textField3 forKey:@"textField3"];
    [text3Defaults synchronize];
    
}

@end








