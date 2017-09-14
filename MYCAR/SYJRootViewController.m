//
//  SYJRootViewController.m
//  MYCAR
//
//  Created by soso on 2017/9/7.
//  Copyright © 2017年 soso. All rights reserved.
//

#import "SYJRootViewController.h"

@interface SYJRootViewController ()

@end

@implementation SYJRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
        UIColor * radomcolor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    
        self.view.backgroundColor = radomcolor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
