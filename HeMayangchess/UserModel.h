//
//  UserModel.h
//  HeMayangchess
//
//  Created by lqm on 16/8/6.
//  Copyright © 2016年 LQM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject
@property (nonatomic,strong) id Floor1;
@property (nonatomic,strong) id Floor2;
@property (nonatomic,strong) id Floor3;
@property (nonatomic,strong) id Floor4;
@property (nonatomic,strong) id Floor5;
@property (nonatomic,strong) id Floor6;
@property (nonatomic,strong) id Floor7;
@property (nonatomic,strong) id Floor8;
@property (nonatomic,strong) NSString *textFieldStr_2;
@property (nonatomic,strong) NSString *textFieldStr_4;
@property (nonatomic,strong) NSString *textFieldStr_5;
//treadTextField
@property (nonatomic,strong) NSString *treadTextField;
@property (nonatomic,strong) NSString *flatTextField;
@property (nonatomic,strong) NSString *rTextField;
@property (nonatomic,strong) NSString *brandTextField;

+ (instancetype)sharedUserModel;
@end
