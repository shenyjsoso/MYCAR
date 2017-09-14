//
//  SYJHttpTool.m
//  MYCAR
//
//  Created by soso on 2017/9/10.
//  Copyright © 2017年 soso. All rights reserved.
//

#import "SYJHttpTool.h"
#import <AFNetworking.h>

@implementation SYJHttpTool

//- (AFHTTPSessionManager *)mgr
//{
//    if (_mgr == nil) {
//        _mgr = [AFHTTPSessionManager manager];    
//        // 告诉AFN，支持接受 text/xml 的数据
//        _mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
//    }
//    return _mgr;
//}

+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure
{

    // 1.创建请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    // 2.发送请求 GET一般用于获取/查询资源信息
     mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
     [mgr GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         success(responseObject);
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         failure(error);
     }];
}

+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure
{
    // 1.创建请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    // 2.发送请求 POST一般用于更新资源信息
    [mgr POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}
@end
