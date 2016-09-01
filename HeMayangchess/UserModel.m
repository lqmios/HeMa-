//
//  UserModel.m
//  HeMayangchess
//
//  Created by lqm on 16/8/6.
//  Copyright © 2016年 LQM. All rights reserved.
//

#import "UserModel.h"

static UserModel * _userModel = nil;
@implementation UserModel
+ (instancetype)sharedUserModel{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _userModel = [[self alloc]init];
    });
    
    return _userModel;
}
@end
