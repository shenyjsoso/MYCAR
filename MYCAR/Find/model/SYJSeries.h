//
//  SYJSeries.h
//  MYCAR
//
//  Created by soso on 2017/9/11.
//  Copyright © 2017年 soso. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SYJSeries : NSObject
/** 子品牌车型系列图标 */
@property (nonatomic, copy) NSString *seriesIcon;

/** 子品牌车型系列名字 */
@property (nonatomic, copy) NSString *seriesName;

/** 子品牌车型系列价钱 */
@property (nonatomic, copy) NSString *seriesPrice;

/** 子品牌车型id */
@property (nonatomic, copy) NSString *seriesId;

@end
