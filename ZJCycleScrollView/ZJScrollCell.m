//
//  ZJScrollCell.m
//  ZJScrollView
//
//  Created by ZJ on 16/3/16.
//  Copyright © 2016年 ZJ. All rights reserved.
//

#import "ZJScrollCell.h"

@implementation ZJScrollCell
-(UIImageView*)imageView
{
    if(_imageView==nil)
    {
       _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:_imageView];
    }
    return _imageView;
}
@end
