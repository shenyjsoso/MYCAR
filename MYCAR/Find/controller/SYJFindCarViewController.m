//
//  SYJFindCarViewController.m
//  MYCAR
//
//  Created by soso on 2017/9/7.
//  Copyright © 2017年 soso. All rights reserved.
//

#import "SYJFindCarViewController.h"
#import <MJExtension.h>
#import <UIImageView+WebCache.h>
#import "SYJHttpTool.h"
#import "SYJBrandCar.h"
#import "SYJBrand.h"
#import "SYJFindCarCell.h"
#import "SYJSubFindCarViewController.h"
static NSString * identifier = @"SYJFindCarCell";
@interface SYJFindCarViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *brands;
@end

@implementation SYJFindCarViewController
//先 1.set get 2.viewdidload 3.delegate 4.event response,button,gesture 5.private method
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    [self requestBrandCarDate];

}
-(void)setupTableView
{
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-20-44-48) style:UITableViewStylePlain];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SYJFindCarCell" bundle:nil] forCellReuseIdentifier:identifier];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}
- (void)requestBrandCarDate {
    
    [SYJHttpTool get:@"http://mi.xcar.com.cn/interface/xcarapp/getBrands.php" params:nil success:^(id json) {
        //NSLog(@"%@", json);
        self.brands = [SYJBrandCar mj_objectArrayWithKeyValuesArray:json[@"letters"]];
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"failed失败------%@",error);
    }];
}



#pragma mark - Table view datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.brands count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    SYJBrandCar *car = self.brands[section];
    return car.brandNum;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    SYJFindCarCell * cell=[tableView dequeueReusableCellWithIdentifier:identifier];
//    if (!cell) {
//        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//    }
    
    SYJBrandCar *car = self.brands[indexPath.section];
    SYJBrand *brand = car.brands[indexPath.row];
    
   // [cell setBackgroundColor:[UIColor whiteColor]];
    //取消选中状态
    cell.selectionStyle =UITableViewCellSelectionStyleNone;
    cell.brandLabel.text=brand.name;
    [cell.iconView sd_setImageWithURL:[NSURL URLWithString:brand.icon] placeholderImage:[UIImage imageNamed:@"zhanwei_1.jpeg"]];
    
    return cell;
}
-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return [self.brands valueForKeyPath:@"letter"];
}
#pragma mark - Table view delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    //导航栏动画添加
//    CATransition *amin=[CATransition animation];
//    amin.duration=1;
//    amin.type=@"fade";//amin.type=@"rippleEffect";
//    //amin.subtype=kCATransitionFromBottom;
//    //amin.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    [self.navigationController.view.layer addAnimation:amin forKey:nil];

    SYJSubFindCarViewController *subvc=[[SYJSubFindCarViewController alloc]initWithIndexPath:indexPath brands:self.brands];
    [self.navigationController pushViewController:subvc animated:YES];
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    SYJBrandCar *car=self.brands[section];
    return car.letter;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 23.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0;
}

//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
//    NSMutableArray *indexTitles = [NSMutableArray array];
//    for (SYJBrandCar *car in self.brands) {
//        [indexTitles addObject:car.letter];
//    }
//    return indexTitles;
//}


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
