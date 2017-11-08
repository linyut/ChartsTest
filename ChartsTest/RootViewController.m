//
//  RootViewController.m
//  ChartsTest
//
//  Created by 方寸山 on 2017/11/3.
//  Copyright © 2017年 LINYUT. All rights reserved.
//

#import "RootViewController.h"
#import "PieChartViewController.h"
#import "PiePolylineChartViewController.h"

#import "LineChart1ViewController.h"
#import "LineChart2ViewController.h"
#import "BarChartViewController.h"
#import "PieChartViewController.h"
#import "PiePolylineChartViewController.h"
#import "MultipleLinesChartViewController.h"
#import "MultipleBarChartViewController.h"
#import "CubicLineChartViewController.h"
#import "RadarChartViewController.h"
#import "SinusBarChartViewController.h"
#import "LineChartTimeViewController.h"


#define kCellID   @"CHARTSCELLID"


@interface RootViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *titleArray;
@property (strong, nonatomic) NSArray *VCArray;
@property (assign, nonatomic) NSInteger selectedIndex;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configTitle:@"Charts" showLeftButton:NO andrightBtnTitle:nil];
    [self prepareData];
    [self createUI];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}
-(void)prepareData
{
    self.selectedIndex = -1;
    self.titleArray = @[@"柱状图", @"柱状图-多重", @"线状图-二维", @"线状图", @"线状图-多重", @"正弦波", @"时间波状图", @"音波图", @"饼状图", @"饼状图-数字标识", @"雷达图"];
    self.VCArray = @[@"BarChartViewController", @"MultipleBarChartViewController", @"LineChart1ViewController", @"LineChart2ViewController", @"MultipleLinesChartViewController", @"SinusBarChartViewController", @"LineChartTimeViewController", @"CubicLineChartViewController", @"PieChartViewController", @"PiePolylineChartViewController", @"RadarChartViewController"];
}

-(void)createUI
{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellID];
    }
    cell.textLabel.text = self.titleArray[indexPath.row];
    if (indexPath.row == self.selectedIndex) {
        cell.textLabel.font = [UIFont boldSystemFontOfSize:20];
        cell.textLabel.textColor = [UIColor redColor];
    }else{
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.textLabel.textColor = [UIColor blackColor];
    }
    cell.contentView.backgroundColor = UIColorFromRGB(0xF4F4F4);
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedIndex = indexPath.row;
    NSString *VCName = self.VCArray[indexPath.row];
    Class class = NSClassFromString(VCName);
    DemoBaseViewController *VC = [[class alloc] init];
    VC.VCTitle = self.titleArray[indexPath.row];
    [self.navigationController pushViewController:VC animated:YES];
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
