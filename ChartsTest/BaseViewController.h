//
//  BaseViewController.h
//  ChartsTest
//
//  Created by 方寸山 on 2017/11/3.
//  Copyright © 2017年 LINYUT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property (nonatomic, strong)NSString *_Nullable VCTitle;

@property (strong, nonatomic) UIView *_Nullable emptyView;

- (void)configTitle:(NSString *_Nullable)title showLeftButton:(BOOL)isShow andrightBtnTitle:(NSString *_Nullable)rightTitle;

- (void)setNaviBarBackImageForNavi:(UINavigationController *_Nullable)navi;


@end
