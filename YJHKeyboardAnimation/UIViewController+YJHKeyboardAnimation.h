//
//  UIViewController+YJHKeyboardAnimation.h
//  YJHKeyboardAnimationDemo
//
//  Created by yunjinghui on 2019/11/26.
//  Copyright © 2019 yunjinghui. All rights reserved.
//
#import <UIKit/UIKit.h>
@class YJHKeyboardAnimation;

NS_ASSUME_NONNULL_BEGIN

typedef void(^keyboardShow)(CGFloat height);
typedef void(^keyboardHidden)(void);

@interface UIViewController (YJHKeyboardAnimation)

/// keyboardAnimation Provided keyboard hide display properties
@property (nonatomic, strong) YJHKeyboardAnimation *keyboardAnimation;
@property (nonatomic, strong, nullable) UIView *keyboardView;

/// add observer
/// @param keyboardView inputview
/// @param show keyboard show handler
/// @param hidden keyboard hidden handler
- (void)addKeyObserverWithKeyView:(UIView * _Nullable)keyboardView keyboardShow:(keyboardShow)show keyboardHidden:(keyboardHidden)hidden;

@end

NS_ASSUME_NONNULL_END
