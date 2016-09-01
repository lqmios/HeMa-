//
//  SingleChooseTable.h
//  HeMayangchess
//
//  Created by lqm on 16/8/18.
//  Copyright © 2016年 LQM. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^ChooseBlock) (NSString *chooseContent,NSIndexPath *indexPath);

@interface SingleChooseTable : UIView<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView * MyTable;
@property(nonatomic,strong)NSMutableArray * dataArr;
@property(nonatomic,strong)NSIndexPath * currentSelectIndex;
@property(nonatomic,copy)ChooseBlock block;
+(SingleChooseTable *)ShareTableWithFrame:(CGRect)frame;
-(void)ReloadData;
@end
