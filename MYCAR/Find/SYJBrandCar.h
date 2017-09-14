//
//  SYJBrandCar.h
//  MYCAR
//
//  Created by soso on 2017/9/10.
//  Copyright © 2017年 soso. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SYJBrandCar : NSObject
/** 汽车品牌 */
@property (nonatomic, strong) NSMutableArray *brands;

/** 所有品牌数目 */
@property (nonatomic, assign) NSInteger letterNum;

/** 品牌所有车型数目 */
@property (nonatomic, assign) NSInteger brandNum;

/** 品牌首字母 */
@property (nonatomic, copy) NSString *letter;
@end
