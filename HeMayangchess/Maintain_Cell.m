//
//  Maintain_Cell.m
//  HeMayangchess
//
//  Created by lqm on 16/8/12.
//  Copyright © 2016年 LQM. All rights reserved.
//

#import "Maintain_Cell.h"
#import "Masonry.h"
@implementation Maintain_Cell

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self initView];
    }
    return self;
}

-(void)initView
{
    
    
    _imageView = [[UIImageView alloc]init];
    _imageView.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:_imageView];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentView.mas_left).offset(23);
        make.right.equalTo(self.contentView.mas_right).offset(-23);
        make.top.equalTo(self.contentView.mas_top).offset(25);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
        
    }];
    
    
    _titleLab = [[UILabel alloc]init];
    _titleLab.textColor = [UIColor lightGrayColor];
    _titleLab.backgroundColor = [UIColor whiteColor];
    _titleLab.font = [UIFont systemFontOfSize:12];
    _titleLab.textAlignment = NSTextAlignmentLeft;
    _titleLab.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_titleLab];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
//        make.top.equalTo(self.mas_top);
        make.top.equalTo(self.imageView.mas_bottom).offset(0);
        make.height.mas_equalTo(28);
    }];
    

}



@end























