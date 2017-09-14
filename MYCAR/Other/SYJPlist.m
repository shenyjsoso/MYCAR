//
//  SYJPlist.m
//  MYCAR
//
//  Created by soso on 2017/9/14.
//  Copyright © 2017年 soso. All rights reserved.
//

#import "SYJPlist.h"

@implementation SYJPlist
+(void)initDataIcon:(NSString *)seriesIcon Name:(NSString *)seriesName Price:(NSString *)seriesPrice
{
    //沙盒路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    //plist路径
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"MYCAR.plist"];
    //文件管理器创建
    NSFileManager *fileManager=[[NSFileManager alloc]init];
    if (![fileManager fileExistsAtPath:plistPath]) {
        if (![fileManager createFileAtPath:plistPath contents:nil attributes:nil]) {
                NSLog(@"plist错误");
            }
        else{
            NSLog(@"没有plist，重新建立");
            NSMutableArray *rootary=[[NSMutableArray alloc]init];
            NSMutableDictionary *mydic=[[NSMutableDictionary alloc]init];
            [mydic setObject:seriesIcon forKey:@"seriesIcon"];
            [mydic setObject:seriesName forKey:@"seriesName"];
            [mydic setObject:seriesPrice forKey:@"seriesPrice"];
            [rootary addObject:mydic];
            [rootary writeToFile:plistPath atomically:YES];
            }
        }
    else{
        NSLog(@"有plist");
        NSMutableDictionary *mydic=[[NSMutableDictionary alloc]init];
        NSMutableArray *rootary=[[NSMutableArray alloc]initWithContentsOfFile:plistPath];
        [mydic setObject:seriesIcon forKey:@"seriesIcon"];
        [mydic setObject:seriesName forKey:@"seriesName"];
        [mydic setObject:seriesPrice forKey:@"seriesPrice"];
        [rootary addObject:mydic];
        [rootary writeToFile:plistPath atomically:YES];
    }
}
//读取数据
+(NSMutableArray *)readData
{
    NSFileManager *fileManager=[[NSFileManager alloc]init];
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    [fileManager changeCurrentDirectoryPath:[documentsPath stringByExpandingTildeInPath]];
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"MYCAR.plist"];
    NSMutableArray *myary=[[NSMutableArray alloc]initWithContentsOfFile:plistPath];
    return myary;
}
+(void)deleteData:(NSUInteger)indexPath
{
    //沙盒路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    //plist路径
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"MYCAR.plist"];
    NSMutableArray *ary=[[NSMutableArray alloc]initWithContentsOfFile:plistPath];
    [ary removeObjectAtIndex:indexPath];
    [ary writeToFile:plistPath atomically:YES];
}
@end
