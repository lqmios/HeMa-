//
//  ZJImageDownloadManager.h
//  ZJScrollView
//
//  Created by ZJ on 16/3/16.
//  Copyright © 2016年 ZJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ZJImageDownloadManager : NSObject
+(void)loadImageWithUrlstringArray:(NSString *)urlString completionBlock:(void(^)(UIImage *image))block;
+(void)clearData;
@end
