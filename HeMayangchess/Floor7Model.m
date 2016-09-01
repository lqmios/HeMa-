//
//  Floor7Model.m
//  HeMayangchess
//
//  Created by lqm on 16/8/5.
//  Copyright © 2016年 LQM. All rights reserved.
//

#import "Floor7Model.h"

@implementation Floor7Model
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
