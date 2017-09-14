//
//  SYJBrand.h
//  MYCAR
//
//  Created by soso on 2017/9/10.
//  Copyright © 2017年 soso. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SYJBrand : NSObject
/** 车型图标 */
@property (nonatomic, copy) NSString *icon;

/** 车型名字 */
@property (nonatomic, copy) NSString *name;

/** 子品牌id */
@property (nonatomic, copy) NSString *ID;
@end
