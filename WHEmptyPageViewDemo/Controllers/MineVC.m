//
//  MineVC.m
//  WHEmptyPageViewDemo
//
//  Created by 王红 on 2018/1/30.
//  Copyright © 2018年 王红. All rights reserved.
//

#import "MineVC.h"
#import "UIView+WHEmpty.h"

@interface MineVC ()

@end

@implementation MineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"无网络";

    
    [self showTipViewWithData:nil withFrame:self.view.frame];
//    [self.view hideBlankPageView];
//    [self.view hideNetErrorPageView];
    
    
    [self.view configReloadAction:^{
        
        NSLog(@"刷新");
    }];
    [self.view hideNetErrorPageView];
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
