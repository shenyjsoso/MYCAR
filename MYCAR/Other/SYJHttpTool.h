//
//  SYJHttpTool.h
//  MYCAR
//
//  Created by soso on 2017/9/10.
//  Copyright © 2017年 soso. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface SYJHttpTool : NSObject
+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
@end
