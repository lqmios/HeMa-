//
//  ZJImageDownloadManager.m
//  ZJScrollView
//
//  Created by ZJ on 16/3/16.
//  Copyright © 2016年 ZJ. All rights reserved.
//

#import "ZJImageDownloadManager.h"
#import <CommonCrypto/CommonDigest.h>
@implementation ZJImageDownloadManager
+(void)loadImageWithUrlstringArray:(NSString *)urlString completionBlock:(void(^)(UIImage *image))block
{
    
    NSData *data = [self getDataCacheWithUrlString:urlString];
    if(data)
    {
        //如果沙河下有此url对应的图片，则不必下载
        UIImage *image = [UIImage imageWithData:data];
        block(image);
    }
    else
    {
        
        
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            //下载后存到沙河下
            NSString *cachesPath = [self getFilePath];
            NSString *file = [cachesPath stringByAppendingPathComponent:[self creatMD5StringWithString:response.URL.absoluteString]];
            [[NSFileManager defaultManager] moveItemAtPath:location.path toPath:file error:nil];
            NSData *data = [NSData dataWithContentsOfFile:file];
            UIImage *image = [UIImage imageWithData:data];
            dispatch_async(dispatch_get_main_queue(), ^{
                block(image);
            });
            
        }];
        [downloadTask resume];
      }
        
}
+(void)clearData
{
    NSString *path = [self getFilePath];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        [fileManager removeItemAtPath:path
                                error:nil];
    }
}
+(NSString * )getFilePath
{
    
    NSString *path = [NSString stringWithFormat:@"%@/Library/Caches/ZJCycleScrollDataSaver",NSHomeDirectory()];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL fileExits = [fileManager fileExistsAtPath:path];
    if(!fileExits)
    {
        [fileManager createDirectoryAtPath:path withIntermediateDirectories:NO attributes:nil error:nil];
    }
    return path;
}
+(NSData *)getDataCacheWithUrlString:(NSString *)urlString
{
    NSString *cachesPath = [self getFilePath];
    NSString *file = [cachesPath stringByAppendingPathComponent:[self creatMD5StringWithString:urlString]];
    NSData *data = [NSData dataWithContentsOfFile:file];
    return data;
}
+(NSString *)creatMD5StringWithString:(NSString *)string
{
    const char *original_str = [string UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, (CC_LONG)strlen(original_str), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++)
        [hash appendFormat:@"%02X", result[i]];
    [hash lowercaseString];
    return hash;
}
@end
