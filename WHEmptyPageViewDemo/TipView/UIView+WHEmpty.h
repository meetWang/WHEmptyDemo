//
//  UIView+WHEmpty.h
//  WHEmptyPageViewDemo
//
//  Created by 王红 on 2018/1/30.
//  Copyright © 2018年 王红. All rights reserved.
//

#import <UIKit/UIKit.h>


@class CDMNetErrorPageView , CDMBlankPageView;

@interface UIView (WHEmpty)

//CDMNetErrorPageView
@property (nonatomic,strong) CDMNetErrorPageView * netErrorPageView;
- (void)configReloadAction:(void(^)(void))block;
- (void)showNetErrorPageView;
- (void)hideNetErrorPageView;
- (void)showNetErrorPageViewWithFrame:(CGRect)rect;
//CDMBlankPageView
@property (nonatomic,strong) CDMBlankPageView* blankPageView;
- (void)showBlankPageView;
- (void)showBlankPageViewWithFrame:(CGRect)rect;
- (void)hideBlankPageView;

@end


#pragma mark --- CDMNetErrorPageView
@interface CDMNetErrorPageView : UIView
@property (nonatomic,copy) void(^didClickReloadBlock)(void);
@end

#pragma mark --- CDMBlankPageView
@interface CDMBlankPageView : UIView

@end
