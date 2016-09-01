//
//  Project_TableViewCell.h
//  HeMayangchess
//
//  Created by lqm on 16/8/18.
//  Copyright © 2016年 LQM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Project_TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentLabel;
@property (weak, nonatomic) IBOutlet UILabel *originalLabel;
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;
@property (weak, nonatomic) IBOutlet UILabel *areaLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;






@end
