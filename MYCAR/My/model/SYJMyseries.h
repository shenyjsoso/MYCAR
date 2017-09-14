//
//  SYJMyseries.h
//  MYCAR
//
//  Created by soso on 2017/9/14.
//  Copyright © 2017年 soso. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SYJMyseries : NSObject
/** 子品牌车型系列图标 */
@property (nonatomic, copy) NSString *seriesIcon;

/** 子品牌车型系列名字 */
@property (nonatomic, copy) NSString *seriesName;

/** 子品牌车型系列价钱 */
@property (nonatomic, copy) NSString *seriesPrice;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(NSMutableArray *)dataArr;
@end
