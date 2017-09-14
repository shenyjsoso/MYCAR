//
//  SYJMyCarViewController.m
//  MYCAR
//
//  Created by soso on 2017/9/7.
//  Copyright © 2017年 soso. All rights reserved.
//

#import "SYJMyCarViewController.h"
#import "SYJSubFindCarCell.h"
#import <UIImageView+WebCache.h>
#import "SYJSeries.h"
#import "SYJPlist.h"
#import "SYJMyseries.h"
static NSString * identifier = @"SYJSubFindCarCell";
@interface SYJMyCarViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *series;
@end

@implementation SYJMyCarViewController

-(NSMutableArray *)series
{
    if (!_series) {
        _series=[SYJMyseries dataArr];
    }
    return _series;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    
}
-(void)setupTableView
{
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-20-44-48) style:UITableViewStylePlain];
    [self.tableView registerNib:[UINib nibWithNibName:@"SYJSubFindCarCell" bundle:nil] forCellReuseIdentifier:identifier];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];

}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.series count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    SYJSubFindCarCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.selectionStyle =UITableViewCellSelectionStyleNone;
    
    SYJMyseries *myseries=self.series[indexPath.row];
    [cell.carImageView sd_setImageWithURL:[NSURL URLWithString:myseries.seriesIcon] placeholderImage:[UIImage imageNamed:@"zhanwei_1.jpeg"]];
    [cell.carNameLabel setText:myseries.seriesName];
    [cell.carPriceLabel setText:myseries.seriesPrice];
    return cell;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.tableView beginUpdates];
    //删除plist中对应数据
    [SYJPlist deleteData:indexPath.row];
    //series数据重新获取
    self.series=[SYJMyseries dataArr];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView endUpdates];
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPat{
    return YES;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"我的收藏";
}
#pragma mark - Table view delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0;
}
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}

-(void)viewDidAppear:(BOOL)animated
{
    self.series=[SYJMyseries dataArr];
    [self.tableView reloadData];
    NSLog(@"数据更新了");
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
