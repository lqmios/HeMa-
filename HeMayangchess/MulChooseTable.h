//
//  MulChooseTable.h
//  HeMayangchess
//
//  Created by lqm on 16/8/18.
//  Copyright © 2016年 LQM. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^ChooseBlock) (NSString *chooseContent,NSMutableArray *chooseArr);
@interface MulChooseTable : UIView<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView * MyTable;
@property(nonatomic,strong)NSMutableArray * dataArr;
@property(nonatomic,strong)NSMutableArray * choosedArr;
@property(nonatomic,copy)ChooseBlock block;
@property (nonatomic,assign)BOOL ifAllSelected;
@property (nonatomic,assign)BOOL ifAllSelecteSwitch;

+(MulChooseTable *)ShareTableWithFrame:(CGRect)frame HeaderTitle:(NSString *)title;//有Header
+(instancetype)ShareTableWithFrame:(CGRect)frame;//无Header
-(void)ReloadData;

@end
