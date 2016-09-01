//
//  Floor2Model.h
//  HeMaYangChe
//
//  Created by lqm on 16/8/3.
//  Copyright © 2016年 LQM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Floor2Model : NSObject
@property(nonatomic,strong)NSNumber *ID;
@property(nonatomic,strong)NSNumber *SortID;
@property(nonatomic,strong)NSString *Sort;
@property(nonatomic,strong)NSString *SortImg;
@property(nonatomic,strong)NSArray *TowSort;
@property(nonatomic,strong)NSArray *TowSortImg;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end


























