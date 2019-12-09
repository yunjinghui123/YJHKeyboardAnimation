//
//  UIResponder+YJHKeyboardAnimation.h
//  YJHKeyboardAnimationDemo
//
//  Created by yunjinghui on 2019/11/27.
//  Copyright © 2019 yunjinghui. All rights reserved.
//
/**
 A UIResponder category for observer keyboard, you can call it in your UIView or UIViewController.
 you will get the keyboard to show the hidden callbacks and thus do something.
 
 Important:
 if you add this category, you must to remove keyboard observer.
 example:
 [[NSNotificationCenter defaultCenter] removeObserver:self];
 or
 [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
 [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
*/

#import <UIKit/UIKit.h>
@class YJHKeyboardAnimation;

NS_ASSUME_NONNULL_BEGIN

typedef void(^keyboardShow)(CGFloat height);
typedef void(^keyboardHidden)(void);

@interface UIResponder (YJHKeyboardAnimation)

/// keyboardAnimation Provided keyboard hide display properties
@property (nonatomic, strong) YJHKeyboardAnimation *keyboardAnimation;
@property (nonatomic, strong, nullable) UIView *keyboardView;

/// add keyboard observer
/// @param keyboardView inputview
/// @param show keyboard show handler
/// @param hidden keyboard hidden handler
- (void)addKeyObserverWithKeyView:(UIView * _Nullable)keyboardView keyboardShow:(keyboardShow)show keyboardHidden:(keyboardHidden)hidden;

@end

NS_ASSUME_NONNULL_END
