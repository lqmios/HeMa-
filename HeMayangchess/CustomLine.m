//
//  CustomLine.m
//  HeMayangchess
//
//  Created by lqm on 16/8/16.
//  Copyright © 2016年 LQM. All rights reserved.
//

#import "CustomLine.h"

@implementation CustomLine

- (void)drawRect:(CGRect)rect {
    
    
//    CGContextRef context = UIGraphicsGetCurrentContext();
////
//    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
//    CGContextFillRect(context, rect);
//
//    
//    CGContextSetStrokeColorWithColor(context, COLOR(238, 238, 238, 1).CGColor);
//    CGContextStrokeRect(context, CGRectMake(rect.size.width - 1, (rect.size.height )/2-(rect.size.height - 20)/2, 1, 20));
//    
    
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, 3);  //线宽
    CGContextSetAllowsAntialiasing(context, true);
    CGContextSetRGBStrokeColor(context, 255.0 / 255.0, 255.0 / 255.0, 255.0 / 255.0, 0.9);  //线的颜色
//    CGContextSetRGBStrokeColor(context, 226.0 / 255.0, 0.0 / 0.0, 255.0 / 255.0, 0.9);  //线的颜色

   CGContextBeginPath(context);
    
    CGContextMoveToPoint(context, 0, 0);  //起点坐标
    CGContextAddLineToPoint(context, self.frame.size.width, self.frame.size.height);   //终点坐标
    
    CGContextStrokePath(context);
    
    
}

@end
