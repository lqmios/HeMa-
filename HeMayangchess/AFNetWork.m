//
//  AFNetWork.m
//  HeMaYangChe
//
//  Created by lqm on 16/8/3.
//  Copyright © 2016年 LQM. All rights reserved.
//

#import "AFNetWork.h"
#import "AFHTTPSessionManager.h"
@implementation AFNetWork
-(void)reach
{
    /*
     AFNetworkReachabilityStatusUnknown          = -1, :未知
     AFNetworkReachabilityStatusNotReachable     = 0, :未连接
     AFNetworkReachabilityStatusReachableViaWWAN = 1, :3G
     AFNetworkReachabilityStatusReachableViaWiFi = 2, :WiFi
     */
    //如果要检测网络状态的变化,必须检测管理器的单例
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    //检测网络状态
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"status = %ld",(long)status);
        
    }];
    
}
-(void)getDataRequesetWithUrl:(NSString *)urlString WithParmeters:(NSDictionary *)dictionary
{
    //将传过来的urlString进行编码
    
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    //转成url
    NSURL *url= [NSURL URLWithString:urlString];
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    
    
    //设置一下接收的类型
    //    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
    //返回类型
    //    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    
    
    //设置manager 接收请求
    [manager GET:url.absoluteString parameters:dictionary progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //        NSData *data = [NSData dataWithData:responseObject];
        //        NSJSONSerialization *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        
        _block(responseObject);
        //        _block(json);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error = %@",error.debugDescription);
    }];
}
@end
