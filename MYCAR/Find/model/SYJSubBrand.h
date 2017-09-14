//
//  SYJSubBrand.h
//  MYCAR
//
//  Created by soso on 2017/9/11.
//  Copyright © 2017年 soso. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SYJSubBrand : NSObject
/** 子品牌数量 */
@property (nonatomic, copy) NSString *subBrandNum;

/** 子品牌名称 */
@property (nonatomic, copy) NSString *subBrandName;

/** 子品牌车型系列 */
@property (nonatomic, strong) NSMutableArray *series;

/** 子品牌车型系列数量 */
@property (nonatomic, copy) NSString *seriesNum;
@end
