//
//  Floor4Model.m
//  HeMaYangChe
//
//  Created by lqm on 16/8/3.
//  Copyright © 2016年 LQM. All rights reserved.
//

#import "Floor4Model.h"

@implementation Floor4Model
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init])
    {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}
@end
