//
//  FineTireVC.m
//  HeMayangchess
//
//  Created by lqm on 16/8/16.
//  Copyright © 2016年 LQM. All rights reserved.
//

#import "FineTireVC.h"
#import "Masonry.h"
#import "CustomLine.h"
#import "Sure_ViewController.h"
#import "Tread_ViewController.h"
#import "Flat_ViewController.h"
#import "R_ViewController.h"
#import "Brand_ViewController.h"
#import "UserModel.h"
#import "Table7_ViewController.h"


@interface FineTireVC ()<UITextFieldDelegate>
{
//    UITextField *treadField;
    UITextField *flatField;
    UITextField *rField;
}
@property (weak, nonatomic) IBOutlet UIView *brandView;
@property (weak, nonatomic) IBOutlet UIView *professionView;
@property (weak, nonatomic) IBOutlet UIView *serviceView;

@property (weak, nonatomic) IBOutlet UIImageView *trieImageView;
@property (weak, nonatomic) IBOutlet UIView *treadView;
@property (weak, nonatomic) IBOutlet UITextField *treadTextField;


@property (weak, nonatomic) IBOutlet UIView *flatView;
@property (weak, nonatomic) IBOutlet UITextField *flatTextField;

@property (weak, nonatomic) IBOutlet UIView *rView;
@property (weak, nonatomic) IBOutlet UITextField *rTextField;

@property (weak, nonatomic) IBOutlet UIView *brand_View;

@property (weak, nonatomic) IBOutlet UIView *otherView;
@property (weak, nonatomic) IBOutlet UITextField *otherTextField;


@property (weak, nonatomic) IBOutlet UITextField *brandTextField;



@end

@implementation FineTireVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"查找轮胎";
    self.view.backgroundColor = [UIColor whiteColor];
    self.trieImageView.image = [UIImage imageNamed:@"luntau-2"];
    
    [self initImageView];
    [self initView];
    [self addGesture];
#pragma mark --传值- -
    self.treadStr = [UserModel sharedUserModel].treadTextField;
    self.treadTextField.text = self.treadStr;
    
    self.flatStr = [UserModel sharedUserModel].flatTextField;
    self.flatTextField.text = self.flatStr;
    
    self.rStr = [UserModel sharedUserModel].rTextField;
    self.rTextField.text = self.rStr;

    self.brandStr = [UserModel sharedUserModel].brandTextField;
    self.brandTextField.text = self.brandStr;
#pragma mark ----
    //导航栏的左边存在BarButtonItm
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [leftButton setImage:[UIImage imageNamed:@"zuojiaobiao"] forState:UIControlStateNormal];
    
    leftButton.frame = CGRectMake(0, 0, 20, 30);
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = item;
    [leftButton addTarget:self action:@selector(leftbuttonAction:) forControlEvents:UIControlEventTouchUpInside];



    
    
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

#pragma mark ----view样式设定---
-(void)initView
{
    self.treadView.layer.cornerRadius = 5;
    self.treadView.layer.borderWidth = 1;
    self.treadView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.treadView.backgroundColor = [UIColor clearColor];
//    self.treadField.backgroundColor = [UIColor clearColor];
//
//    
    
    //
    self.flatView.layer.cornerRadius = 5;
    self.flatView.layer.borderWidth = 1;
    self.flatView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.flatView.backgroundColor = [UIColor clearColor];
    //
    self.rView.layer.cornerRadius = 5;
    self.rView.layer.borderWidth = 1;
    self.rView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.rView.backgroundColor = [UIColor clearColor];
    //
    self.brand_View.layer.cornerRadius = 5;
    self.brand_View.layer.borderWidth = 1;
    self.brand_View.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.brand_View.backgroundColor = [UIColor clearColor];

    
    //
    self.otherView.layer.cornerRadius = 5;
    self.otherView.layer.borderWidth = 1;
    self.otherView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.otherView.backgroundColor = [UIColor clearColor];
    //去掉自带圆角
    self.treadTextField.delegate = self;
    self.treadTextField.borderStyle =  UITextBorderStyleNone;
    //去掉自带圆角
    self.flatTextField.borderStyle =  UITextBorderStyleNone;
    self.flatTextField.delegate = self;
  
    self.rTextField.delegate = self;
    self.rTextField.borderStyle =  UITextBorderStyleNone;
    //
    self.brandTextField.delegate = self;
    self.brandTextField.borderStyle =  UITextBorderStyleNone;
    //
    self.otherTextField.delegate = self;
    self.otherTextField.borderStyle =  UITextBorderStyleNone;

    
    
}
#pragma mark ----添加手势---
-(void)addGesture
{
    UIView *treadView = [[UIView alloc]init];
    treadView.backgroundColor = [UIColor clearColor];
    [self.treadView addSubview:treadView];
    [treadView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.treadView);
    }];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(treadGesAction:)];
    [self.treadView addGestureRecognizer:tapGesture];
    //-------//
    UIView *flatView = [[UIView alloc]init];
    flatView.backgroundColor = [UIColor clearColor];
    [self.flatView addSubview:flatView];
    [flatView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.flatView);
    }];
    UITapGestureRecognizer *flatGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(flatGestureAction:)];
    [self.flatView addGestureRecognizer:flatGesture];
    //-------//
    UIView *rView = [[UIView alloc]init];
    rView.backgroundColor = [UIColor clearColor];
    [self.rView addSubview:rView];
    [rView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.rView);
    }];
    UITapGestureRecognizer *rGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(rGestureAction:)];
    [self.rView addGestureRecognizer:rGesture];
    //-------//
    UIView *brand_View = [[UIView alloc]init];
    brand_View.backgroundColor = [UIColor clearColor];
    [self.brand_View addSubview:brand_View];
    [brand_View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.brand_View);
    }];
    UITapGestureRecognizer *brandViewGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(brandViewGestureAction:)];
    [self.brand_View addGestureRecognizer:brandViewGesture];
    //-------//
    UIView *otherView = [[UIView alloc]init];
    otherView.backgroundColor = [UIColor clearColor];
    [self.otherView addSubview:otherView];
    [otherView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.otherView);
    }];
    UITapGestureRecognizer *otherViewGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(otherViewGestureAction:)];
    [self.otherView addGestureRecognizer:otherViewGesture];
    
    
    
}


#pragma mark ----buttonAction---
- (IBAction)sureButtonAction:(id)sender
{
    
    Sure_ViewController *sureVC = [[Sure_ViewController alloc]init];
    [self.navigationController pushViewController:sureVC animated:YES];
    
}


#pragma mark ----手势动作－－---
-(void)treadGesAction:(UIGestureRecognizer *)sender
{
    Tread_ViewController *treadVC = [[Tread_ViewController alloc]init];
    [self.navigationController pushViewController:treadVC animated:YES];
}
-(void)flatGestureAction:(UIGestureRecognizer *)sender
{
    Flat_ViewController *flatVC = [[Flat_ViewController alloc]init];
    [self.navigationController pushViewController:flatVC animated:YES];
}
-(void)rGestureAction:(UIGestureRecognizer *)sender
{
    R_ViewController *rVC = [[R_ViewController alloc]init];
    [self.navigationController pushViewController:rVC animated:YES];
}
-(void)brandViewGestureAction:(UIGestureRecognizer *)sender
{
    Brand_ViewController *brandVC = [[Brand_ViewController alloc]init];
    [self.navigationController pushViewController:brandVC animated:YES];
}
-(void)otherViewGestureAction:(UIGestureRecognizer *)sender
{
     [self _showAlertWithMessage:@""];
}
#pragma mark - 警告弹出框
- (void)_showAlertWithMessage:(NSString *)message
{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"敬请期待" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}


-(void)leftbuttonAction:(UIButton *)sender
{
    //拿到栈里面的所有视图
    NSArray *allViewArray = self.navigationController.viewControllers;
    
    for (UIViewController *viewController in allViewArray)
    {
        //isKindOfClass检测该对象是否是该类或派生类的成员
        if ([viewController isKindOfClass:[Table7_ViewController class]])
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

-(BOOL)textFieldShouldBeginEditing:(UITextField*)textField{
    
    return NO;
}


@end
