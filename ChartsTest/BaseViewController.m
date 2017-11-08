//
//  BaseViewController.m
//  ChartsTest
//
//  Created by 方寸山 on 2017/11/3.
//  Copyright © 2017年 LINYUT. All rights reserved.
//

#import "BaseViewController.h"

#define         TEXT_FONTNAME                   @"Heiti SC"


@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGB(0xF4F4F4);
    [self setNaviBarBackImageForNavi:self.navigationController];
    [self createEmptyView];
    // Do any additional setup after loading the view.
}

- (void)setNaviBarBackImageForNavi:(UINavigationController *)navi
{
    UIImage *bgImage = [UIImage imageNamed:@"Img_Nav bar_old"];
    bgImage = [bgImage resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeStretch];
    [navi.navigationBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
}

-(void)createEmptyView
{
    self.emptyView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    self.emptyView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.emptyView];
    self.emptyView.hidden = YES;
    UIImageView *emptyImageView = [[UIImageView alloc] initWithFrame:CGRectMake((kScreenWidth-267)/2, 37, 267, 245)];
    emptyImageView.image = [UIImage imageNamed:@"bg_empty"];
    [self.emptyView addSubview:emptyImageView];
}

- (void)configTitle:(NSString *)title showLeftButton:(BOOL)isShow andrightBtnTitle:(NSString *)rightTitle
{
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 100, 40)];
    [titleLabel setText:title];
    [titleLabel setFont:[UIFont boldSystemFontOfSize:19]];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    [titleLabel setTextColor:[UIColor whiteColor]];
    [self.navigationItem setTitleView:titleLabel];
    
    if ([title isEqualToString:@"firstLogin"]) {
        UIImageView *bgView = [[UIImageView alloc] init];
        [bgView setFrame:self.navigationController.navigationBar.bounds];
        [bgView setImage:[UIImage imageNamed:@"First_navbar_image"]];
        [self.navigationItem setTitleView:bgView];
    }
    
    
    if (isShow) {
        [self configLeftItem];
    }
    if (rightTitle.length> 0) {
        [self configRightItemWithType:rightTitle];
    }
}

- (void)configLeftItem
{
    UIBarButtonItem *spaceItem =  [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -6;
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"BackDownImage"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(leftAction:)];
//    item.imageInsets = UIEdgeInsetsMake(0,-10,0,10);
    item.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItems = @[spaceItem,item];
}

- (void)leftAction:(UIButton *)sender
{
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else {
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
}

- (void)configRightItemWithType:(NSString *) buttonType
{
    UIButton *rightButton =[UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setFrame:CGRectMake(0.0, 0.0, 80, 40)];
    [rightButton setTitle:buttonType forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    rightButton.tag=521;
    [rightButton addTarget:self action:@selector(rightAction:) forControlEvents:UIControlEventTouchUpInside];
    [rightButton.titleLabel setFont:[UIFont fontWithName:TEXT_FONTNAME size:13]];
    rightButton.imageEdgeInsets = UIEdgeInsetsMake(10,0,-10,0);
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
}

- (void)rightAction:(UIButton *)sender
{
    
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
