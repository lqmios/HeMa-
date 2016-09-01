//
//  ShouyeViewController.h
//  HeMayangchess
//
//  Created by lqm on 16/8/4.
//  Copyright © 2016年 LQM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShouyeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIView *contentiew;


@property(nonatomic,strong)NSString *dateStr;
-(void)currentTime;

@end
