//
//  SYJBrandCar.m
//  MYCAR
//
//  Created by soso on 2017/9/10.
//  Copyright © 2017年 soso. All rights reserved.
//

#import "SYJBrandCar.h"
@implementation SYJBrandCar
// 字典中包含字典
// 将返回的json的字典的key作为key，字典中的字典的数据类作为值
+ (NSDictionary *)mj_objectClassInArray {
    return @{@"brands" : @"SYJBrand"};
}

- (void)setLetter:(NSString *)letter {
    _letter = letter.uppercaseString;
}

@end
