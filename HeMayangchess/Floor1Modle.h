//
//  Floor1Modle.h
//  HeMaYangChe
//
//  Created by lqm on 16/8/3.
//  Copyright © 2016年 LQM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Floor1Modle : NSObject
@property(nonatomic,strong)NSNumber *IdenID;
@property(nonatomic,strong)NSString *IdenIDName;
@property(nonatomic,strong)NSString *ImgText;
@property(nonatomic,strong)NSNumber *PositionID;
@property(nonatomic,strong)NSString *PositionName;
@property(nonatomic,strong)NSString *Url;
@property(nonatomic,strong)NSString *Value;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;



@end



















