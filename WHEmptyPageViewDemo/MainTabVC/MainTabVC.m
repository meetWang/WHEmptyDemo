//
//  MainTabVC.m
//  WHEmptyPageViewDemo
//
//  Created by 王红 on 2018/1/30.
//  Copyright © 2018年 王红. All rights reserved.
//

#define ScreenWidth ([UIScreen mainScreen].bounds.size.width)

#import "MainTabVC.h"

#import "HomeVC.h"
#import "MineVC.h"

@interface MainTabVC ()
@property (nonatomic, strong) HomeVC        *vcHome;
@property (nonatomic, strong) MineVC        *vcMine;
@end

@implementation MainTabVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpViewController];
}

- (void)setUpViewController {
    self.view.backgroundColor = [UIColor whiteColor];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13],
                                                        NSForegroundColorAttributeName:[UIColor grayColor]}
                                             forState:UIControlStateNormal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13],
                                                        NSForegroundColorAttributeName:[UIColor redColor]}
                                             forState:UIControlStateSelected];
    
    //the color for selected icon
//    [[UITabBar appearance] setTintColor:Color_Tabbar_Selected];
//    [[UITabBar appearance] setBarTintColor:Color_Tabbar_Bg];
    
    _vcHome = [[HomeVC alloc] init];
    UINavigationController *navigaitonvcHome = [[UINavigationController alloc] initWithRootViewController:_vcHome];
    navigaitonvcHome.tabBarItem.title = @"首页";
    [navigaitonvcHome.tabBarItem setImage:[[UIImage imageNamed:@"tabicon_01"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [navigaitonvcHome.tabBarItem setSelectedImage:[[UIImage imageNamed:@"tabicon_01_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
   
    
    _vcMine = [[MineVC alloc] init];
    UINavigationController *navigaitonVCMine = [[UINavigationController alloc] initWithRootViewController:_vcMine];
    navigaitonVCMine.tabBarItem.title = @"我的";
    [navigaitonVCMine.tabBarItem setImage:[[UIImage imageNamed:@"tabicon_02"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [navigaitonVCMine.tabBarItem setSelectedImage:[[UIImage imageNamed:@"tabicon_02_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    
    
    self.tabBar.translucent = NO;
    self.viewControllers = @[navigaitonvcHome,navigaitonVCMine];
    
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    UIView *vLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 0.5)];
    vLine.backgroundColor = [UIColor lightGrayColor];
    [self.tabBar addSubview:vLine];
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
