//
//  SYJMyseries.m
//  MYCAR
//
//  Created by soso on 2017/9/14.
//  Copyright © 2017年 soso. All rights reserved.
//

#import "SYJMyseries.h"
#import "SYJPlist.h"
@implementation SYJMyseries
-(instancetype)initWithDict:(NSDictionary *)dict
{
    self=[super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(NSMutableArray *)dataArr
{
    NSMutableArray *arr=[SYJPlist readData];
    NSMutableArray *mycars=[NSMutableArray array];
    for (NSDictionary *p in arr) {
        SYJMyseries *s=[[SYJMyseries alloc]initWithDict:p];
        [mycars addObject:s];
    }
    return mycars;
}
@end
