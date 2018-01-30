//
//  BaseVC.m
//  WHEmptyPageViewDemo
//
//  Created by 王红 on 2018/1/30.
//  Copyright © 2018年 王红. All rights reserved.
//

#import "BaseVC.h"
#import "MBProgressHUD.h"
#import "DSReachability.h"
#import "UIView+WHEmpty.h"

#define kBtnChoosePictureHeight         50

#define Font_Choose_PictureItem         FontSystem(17.0f)
#define Color_Moments_ChooseBg          UIColorFromRGB(0xe5e5e5)

@interface BaseVC () {
    BOOL isNotShowStatusBar;
    UIImageView *navBarHairlineImageView;
}

@property (strong, nonatomic) MBProgressHUD             *progressHud;
@property (assign, nonatomic) BOOL                      isHeadQuarter;

@end

@implementation BaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configUI];
}

- (void)configUI{
    
    //设置UINavigationbar
    if([self respondsToSelector:@selector(edgesForExtendedLayout)])
        [self setEdgesForExtendedLayout:UIRectEdgeBottom];
    self.navigationController.navigationBar.translucent = NO;
    _progressHud = [[MBProgressHUD alloc] initWithView:self.view];
    self.progressHud.bezelView.alpha = 0.5;
    
    self.isRequestProcessing = NO;
}

//找到UINavigationBar下面的线
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
  
   
    
}

- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
}

- (void)showLogin{
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)showMessage:(NSString *)msg{
    if ([msg isEqualToString:@""] || !msg) {
        return;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.animationType = MBProgressHUDAnimationZoomOut;
    hud.mode = MBProgressHUDModeText;
    //    hud.label.text = [TipMessage shared].tipMessage.tipTitle;
    hud.detailsLabel.text = msg;
    hud.detailsLabel.font = [UIFont systemFontOfSize:18];
    hud.margin = 15;
    hud.backgroundView.alpha = 0.8;
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:2.0];
}

- (void)showLoading:(NSString *)msg{
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.animationType = MBProgressHUDAnimationZoomOut;
    hud.mode = MBProgressHUDModeIndeterminate;
    //        hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    
    //    hud.label.text = [TipMessage shared].tipMessage.tipTitle;
    hud.detailsLabel.text = msg;
    hud.detailsLabel.font = [UIFont systemFontOfSize:18];
    hud.margin = 15;
    hud.backgroundView.alpha = 0.8;
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:1.0];
}

//提示有对号的
- (void)showAlertMessage:(NSString *)strMessage{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    
    // Set the custom view mode to show any view.
    hud.mode = MBProgressHUDModeCustomView;
    // Set an image view with a checkmark.
    UIImage *image = [[UIImage imageNamed:@"checkmark"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    hud.customView = [[UIImageView alloc] initWithImage:image];
    // Looks a bit nicer if we make it square.
    hud.square = YES;
    // Optional label text.
    hud.label.text = strMessage;
    hud.label.font = [UIFont systemFontOfSize:13];
    hud.label.textAlignment = NSTextAlignmentCenter;
    hud.label.numberOfLines = 0;
    hud.label.textColor = [UIColor whiteColor];
    hud.label.lineBreakMode = NSLineBreakByWordWrapping;
    
    hud.bezelView.backgroundColor = [UIColor lightGrayColor];
    [hud hideAnimated:YES afterDelay:2.f];
}

- (void)hideLoading{
    
    [self.progressHud hideAnimated:YES];
    
}

#pragma --mark 页面基本设置
/**
 *  页面基本设置,页面背景颜色、页面是否包含返回按钮、对返回按钮做相应的处理
 *
 *  @param gobackType 页面返回类型
 */
- (void)baseSetup:(PageGobackType)gobackType{
    
    //设置页面背景
    self.view.backgroundColor = [UIColor whiteColor];
    
    //设置返回按钮
    if (gobackType != PageGobackTypeNone) {
        UIButton *btnLeft = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 44)];
        [btnLeft setTitle:@"" forState:UIControlStateNormal];
        //        [btnLeft setBackgroundImage:ImageNamed(@"navigationBar_popBack") forState:UIControlStateNormal];
        
        
        [btnLeft setImage:[UIImage imageNamed:@"arrow-back"] forState:UIControlStateNormal];
        btnLeft.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        if (gobackType == PageGobackTypePop) {
            [btnLeft addTarget:self action:@selector(popVC) forControlEvents:UIControlEventTouchUpInside];
        }else if (gobackType == PageGobackTypeDismiss){
            [btnLeft addTarget:self action:@selector(dismissVC) forControlEvents:UIControlEventTouchUpInside];
        }else if (gobackType == PageGobackTypeRoot){
            [btnLeft addTarget:self action:@selector(popToRoot) forControlEvents:UIControlEventTouchUpInside];
        }
        
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:btnLeft];
        
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                           initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                           target:nil action:nil];
        negativeSpacer.width = 0;
        [self.navigationItem setLeftBarButtonItems:@[negativeSpacer,leftItem]];
    }else{
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:[UIView new]];
        [self.navigationItem setLeftBarButtonItem:leftItem];
    }
}

/**
 *  dimiss页面
 */
- (void)dismissVC{
    [self dismissViewControllerAnimated:YES completion:nil];
    self.tabBarController.tabBar.hidden = NO;
}

/**
 *返回任意一个页面
 */
- (void)popToViewControllerAtIndex:(NSInteger)index{
    if (self.navigationController.viewControllers.count > index) {
        [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:index] animated:YES];
    }
}

/**
 *popToRoot页面
 */
- (void)popToRoot{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

/**
 *  pop页面
 */
- (void)popVC{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dsPushViewController:(UIViewController*)vc animated:(BOOL)animated{
    if (self.navigationController.viewControllers.count == 1) {
        vc.hidesBottomBarWhenPushed = YES;
    }
    [self.navigationController pushViewController:vc animated:animated];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.view endEditing:YES];
}
#pragma mark - 判断是否有网络
- (BOOL)checkIsHaveNet{
    
    
    BOOL isExistenceNetwork = YES;
    
    DSReachability   *reach = [DSReachability reachabilityWithHostName:@"www.apple.com"];
    
    NSParameterAssert([reach isKindOfClass:[DSReachability class]]);
    
    NetworkStatus stats = [reach currentReachabilityStatus];
    
    if (stats == NotReachable)
        //没有网络
        isExistenceNetwork = NO;
    else if (stats == ReachableViaWiFi)
        isExistenceNetwork = YES;
    else if (stats == ReachableViaWWAN)
        isExistenceNetwork = YES;
    else if (stats == ReachableViaWiFi)
        isExistenceNetwork = YES;
    
    if (!isExistenceNetwork) {
        
        return NO;
    }
    
    return isExistenceNetwork;
    
}

//添加提示 是否有网络 是否有数据 可添加在tableView 上 可以滑动
- (void)showTipViewWithData:(NSMutableArray *)arr superView:(UIView *)vSuper{
    if (![self checkIsHaveNet]) {
        [vSuper showNetErrorPageViewWithFrame:vSuper.frame];
    }else {
        [vSuper hideNetErrorPageView];
        if (arr.count > 0) {
            [vSuper hideBlankPageView];
            
        }else {
            [vSuper showBlankPageViewWithFrame:vSuper.frame];
            
        }
    }
}


//添加提示 是否有网络 是否有数据 添加的是self.view 不可以滑动
- (void)showTipViewWithData:(NSMutableArray *)arr withFrame:(CGRect)frameRect{
    if (![self checkIsHaveNet]) {
        [self.view showNetErrorPageViewWithFrame:frameRect];
    }else {
        [self.view hideNetErrorPageView];
        if (arr.count > 0) {
            [self.view hideBlankPageView];
            
        }else {
            [self.view showBlankPageViewWithFrame:frameRect];
            
        }
    }
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
