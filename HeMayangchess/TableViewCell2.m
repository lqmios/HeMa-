//
//  TableViewCell2.m
//  HeMaYangChe
//
//  Created by lqm on 16/8/4.
//  Copyright © 2016年 LQM. All rights reserved.
//

#import "TableViewCell2.h"

@implementation TableViewCell2
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextFillRect(context, rect);
    
    //上分割线，
    CGContextSetStrokeColorWithColor(context, COLOR(238, 238, 238, 1).CGColor);
    
    CGContextStrokeRect(context, CGRectMake(0, -1, rect.size.width , 1));
    
    //下分割线
        CGContextSetStrokeColorWithColor(context, COLOR(238, 238, 238, 1).CGColor);
        CGContextStrokeRect(context, CGRectMake(0, rect.size.height-1, rect.size.width , 1));
    //
    CGContextSetStrokeColorWithColor(context, COLOR(238, 238, 238, 1).CGColor);
    CGContextStrokeRect(context, CGRectMake(rect.size.width - 1, (rect.size.height )/2-(rect.size.height - 20)/2, 1, 20));
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
