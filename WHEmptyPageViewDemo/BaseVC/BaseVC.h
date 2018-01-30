//
//  BaseVC.h
//  WHEmptyPageViewDemo
//
//  Created by 王红 on 2018/1/30.
//  Copyright © 2018年 王红. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum{
    PageGobackTypeNone,
    PageGobackTypeDismiss,
    PageGobackTypePop,
    PageGobackTypeRoot
}PageGobackType;

@interface BaseVC : UIViewController

@property (assign, nonatomic) BOOL isRequestProcessing;//请求是否在处理中


/**
 *  页面基本设置
 *
 *  @param gobackType 页面返回类型
 */
- (void)baseSetup:(PageGobackType)gobackType;

/**
 *  现实提示信息
 *
 *  @param msg 要显示的消息内容
 */
- (void)showMessage:(NSString *)msg;


//提示有对号的
- (void)showAlertMessage:(NSString *)strMessage;

/**
 *  显示加载框
 *
 *  @param msg 提示内容
 */
- (void)showLoading:(NSString *)msg;

/**
 *  隐藏加载框
 */
- (void)hideLoading;

/**
 *  用于push vc 隐藏tabbar
 *
 *  @param vc       要push的vc
 *  @param animated 动画效果
 */
- (void)dsPushViewController:(UIViewController*)vc animated:(BOOL)animated;

/**
 *  dimiss页面
 */
- (void)dismissVC;

/**
 *popToRoot页面
 */
- (void)popToRoot;

/**
 *返回任意一个页面
 */
- (void)popToViewControllerAtIndex:(NSInteger)index;

/**
 *  pop页面
 */
- (void)popVC;

//判断是否有网络
- (BOOL)checkIsHaveNet;

//添加提示 是否有网络 是否有数据 可添加在tableView 上 可以滑动
- (void)showTipViewWithData:(NSMutableArray *)arr superView:(UIView *)vSuper;

//添加提示 是否有网络 是否有数据 添加的是self.view 不可以滑动
- (void)showTipViewWithData:(NSMutableArray *)arr withFrame:(CGRect)frameRect;


@end
