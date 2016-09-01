//
//  LineLabel.m
//  HeMayangchess
//
//  Created by lqm on 16/8/18.
//  Copyright © 2016年 LQM. All rights reserved.
//

#import "LineLabel.h"

@implementation LineLabel

- (void)drawRect:(CGRect)rect {
    
    [super drawRect:rect];
    //拿到画板
    CGContextRef context = UIGraphicsGetCurrentContext();
    //设置画笔颜色
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    //画笔宽度
    CGContextSetLineWidth(context, 1.0f);
    
    CGPoint startPoint = CGPointMake(0, rect.size.height/2-3);
    CGPoint endPoint = CGPointMake(rect.size.width, rect.size.height/2-3);
    
    CGContextMoveToPoint(context, startPoint.x,startPoint.y );
    CGContextAddLineToPoint(context, endPoint.x, endPoint.y);
    CGContextStrokePath(context);
}



@end
