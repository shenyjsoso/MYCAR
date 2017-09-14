//
//  SYJTabBarController.m
//  MYCAR
//
//  Created by soso on 2017/9/7.
//  Copyright © 2017年 soso. All rights reserved.
//

#import "SYJTabBarController.h"
#import "SYJNavigationController.h"

@interface SYJTabBarController ()

@end

@implementation SYJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    //加载所有视图控制器
    [self configViewControllers];
    
    self.tabBar.translucent=NO;
    // 改变UITabBarItem字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:SYJColor(99, 208, 208, 1),NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];


}
//加载所有视图控制器
- (void)configViewControllers {
    // 1 弱化连接，因此并不会把没有的Framework也link到程序中。
    //2 不需要使用import，因为类是动态加载的，只要存在就可以加载。因此如果你的toolchain中没有某个类的头文件定义，而你确信这个类是可以用的，那么也可以用这种方法。
    UIViewController * findcarvc = [[NSClassFromString(@"SYJFindCarViewController") alloc] init];
    UIViewController * mycarvc = [[NSClassFromString(@"SYJMyCarViewController") alloc] init];
    
    SYJNavigationController * findnav = [[SYJNavigationController alloc] initWithRootViewController:findcarvc];
    SYJNavigationController * mynav = [[SYJNavigationController alloc] initWithRootViewController:mycarvc];
    
    NSArray *viewCtrs = @[findnav, mynav];
    [self setViewControllers:viewCtrs animated:YES];
    
    [self setupChildViewController:findcarvc title:@"找车" imageName:@"findcar.png" selectedImageName:@"findcar_p.png" tabBar:self.tabBar index:0];
    [self setupChildViewController:mycarvc title:@"我的" imageName:@"my.png" selectedImageName:@"my_p.png" tabBar:self.tabBar index:1];


}


- (void)setupChildViewController:(UIViewController *)childVC
                           title:(NSString *)title
                       imageName:(NSString *)imageName
               selectedImageName:(NSString *)selectedImageName
                          tabBar:(UITabBar *)tabBar
                           index:(NSUInteger)index {
    //标题
    childVC.title = title;
    //获取各index的item
    UITabBarItem *item = [tabBar.items objectAtIndex:index];
    //item.title=title;
    UIImage *image = [UIImage imageNamed:imageName];
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    
    [item setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [item setSelectedImage:[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
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
