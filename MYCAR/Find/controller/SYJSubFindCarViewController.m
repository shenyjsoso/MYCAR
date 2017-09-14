//
//  SYJSubFindCarViewController.m
//  MYCAR
//
//  Created by soso on 2017/9/12.
//  Copyright © 2017年 soso. All rights reserved.
//

#import "SYJSubFindCarViewController.h"
#import <MJExtension.h>
#import <UIImageView+WebCache.h>
#import "SYJSubBrand.h"
#import "SYJBrandCar.h"
#import "SYJBrand.h"
#import "SYJSeries.h"
#import "SYJHttpTool.h"
#import "SYJSubFindCarCell.h"
#import "SYJPlist.h"
static NSString * identifier = @"SYJSubFindCarCell";
@interface SYJSubFindCarViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSArray *series;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, strong) NSArray *brands;
@property (nonatomic, strong) UITableView *tableView;
//@property(nonatomic,copy)NSString *plistPath;
@end

@implementation SYJSubFindCarViewController

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath brands:(NSArray *)brands {
    self = [super init];
    if (self) {
        
        _indexPath = indexPath;
        _brands = brands;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    [self requestDateWithIndex:self.indexPath brands:self.brands];
}

//创建tableview
-(void)setupTableView
{
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-20-44-48) style:UITableViewStylePlain];
    [self.tableView registerNib:[UINib nibWithNibName:@"SYJSubFindCarCell" bundle:nil] forCellReuseIdentifier:identifier];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}
//加载数据
- (void)requestDateWithIndex:(NSIndexPath *)indexPath brands:(NSArray *)brands{
    // 获取当前品牌的id号
    NSMutableDictionary *paras = [NSMutableDictionary dictionary];
    SYJBrandCar *car = brands[indexPath.section];
    SYJBrand *brand = car.brands[indexPath.row];
    paras[@"brandId"] = brand.ID;
    [SYJHttpTool get:@"http://mi.xcar.com.cn/interface/xcarapp/getSeriesByBrandId.php" params:paras success:^(id json) {
        // NSLog(@"%@",json);
        self.series=[SYJSubBrand mj_objectArrayWithKeyValuesArray:json[@"subBrands"]];
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"error错误-----%@",error);
    }];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Incomplete implementation, return the number of sections
    return [self.series count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    SYJSubBrand *subBrand = self.series[section];
    return [subBrand.seriesNum integerValue];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 依照section取出subBrand
    SYJSubBrand *subBrand = self.series[indexPath.section];
    // 依照当前section的当前row，取出serie
    SYJSeries *serie = subBrand.series[indexPath.row];
    
    SYJSubFindCarCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.selectionStyle =UITableViewCellSelectionStyleNone;
    [cell.carImageView sd_setImageWithURL:[NSURL URLWithString:serie.seriesIcon] placeholderImage:[UIImage imageNamed:@"zhanwei_1.jpeg"]];
    [cell.carNameLabel setText:serie.seriesName];
    [cell.carPriceLabel setText:serie.seriesPrice];
    return cell;
}
#pragma mark - Table view delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    SYJSubBrand *subBrand = self.series[section];
    return subBrand.subBrandName;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //取消选择.不加这句话，双击cell才显示alter
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    SYJSubBrand *subBrand = self.series[indexPath.section];
    SYJSeries *serie = subBrand.series[indexPath.row];
    UIAlertController *alterController=[UIAlertController alertControllerWithTitle:@"提示" message:[NSString stringWithFormat:@"是否将‘%@’加入‘我的收藏’",serie.seriesName] preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
     
    UIAlertAction *agreeAction=[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //创建plist文件，并插入数据
        [SYJPlist initDataIcon:serie.seriesIcon Name:serie.seriesName Price:serie.seriesPrice];
    }];
    
    [alterController addAction:agreeAction];
    [alterController addAction:cancelAction];
    [self presentViewController:alterController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

