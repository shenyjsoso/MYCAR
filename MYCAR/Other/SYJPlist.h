//
//  SYJPlist.h
//  MYCAR
//
//  Created by soso on 2017/9/14.
//  Copyright © 2017年 soso. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SYJPlist : NSObject
+(void)initDataIcon:(NSString *)seriesicon Name:(NSString *)seriesName Price:(NSString*)seriesPrice;
+(NSMutableArray *)readData;
+(void)deleteData:(NSUInteger)indexPath;
@end
