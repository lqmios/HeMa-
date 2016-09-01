//
//  TableChooseCell.h
//  HeMayangchess
//
//  Created by lqm on 16/8/18.
//  Copyright © 2016年 LQM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableChooseCell : UITableViewCell
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic, strong)UIButton *SelectIconBtn;
@property (nonatomic,assign)BOOL isSelected;
-(void)UpdateCellWithState:(BOOL)select;
@end
