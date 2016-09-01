//
//  FristImage_ViewController.m
//  HeMayangchess
//
//  Created by lqm on 16/8/8.
//  Copyright © 2016年 LQM. All rights reserved.
//

#import "FristImage_ViewController.h"
#import "UserModel.h"
#import "UIImageView+WebCache.h"

@interface FristImage_ViewController ()

@end

@implementation FristImage_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = self.titleString;
    
    
//    NSString *string = @"http://hd.hemayangche.com:8086/Home/List/index?token=";
//    NSRange range = [string rangeOfString:@"?"];
//    string = [string substringToIndex:range.location];
//    NSLog(@"string:%@",string);
    //
    
    
    NSString *string = self.ValueString;
    NSRange range = [string rangeOfString:@"?"];
    string = [string substringToIndex:range.location];
    NSLog(@"string:%@",string);
//    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:string]];
//    
//    NSString *result = [[NSString alloc] initWithData:data  encoding:NSUTF8StringEncoding];
//    
//    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, Screen_width, Screen_height)];
//    [self.view addSubview:imageview];
//    
//    [imageview sd_setImageWithURL:[NSURL URLWithString:result]];
//    
    
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, Screen_width, Screen_height)];
    webView.scrollView.bounces = NO;
    webView.scrollView.showsHorizontalScrollIndicator = NO;
    webView.scrollView.showsVerticalScrollIndicator = NO;
    NSString *urlString = self.ValueString;
//
    [webView loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:urlString]]];
    [self.view addSubview:webView];
    

    
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
