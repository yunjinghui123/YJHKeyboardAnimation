//
//  UIViewController+YJHKeyboardAnimation.m
//  YJHKeyboardAnimationDemo
//
//  Created by yunjinghui on 2019/11/26.
//  Copyright © 2019 yunjinghui. All rights reserved.
//

#import "UIViewController+YJHKeyboardAnimation.h"
#import "YJHKeyboardAnimation.h"
#import <objc/runtime.h>

static void * const keyboardKey;
static void * const keyboardViewKey;

@implementation UIViewController (YJHKeyboardAnimation)

- (void)addKeyObserverWithKeyView:(UIView *)keyboardView keyboardShow:(keyboardShow)show keyboardHidden:(keyboardHidden)hidden {
    objc_setAssociatedObject(self, &keyboardViewKey, keyboardView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrameNoti:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide) name:UIKeyboardWillHideNotification object:nil];
    self.keyboardAnimation.keyboardDidFinishDisplay = ^(CGFloat keyboardHeight) {
        if (show) {
            show(keyboardHeight);
        }
    };
    self.keyboardAnimation.keyboardDidFinishHidden = ^{
        if (hidden) {
            hidden();
        }
    };
}

#pragma mark - keyboard show & hidden observer
/** keyboard show */
- (void)keyboardWillChangeFrameNoti:(NSNotification *)noti {
    [self.keyboardAnimation keyboardWillChangeFrameNoti:noti];
}

/** keyboard hidden */
- (void)keyboardWillHide {
    [self.keyboardAnimation keyboardWillHide:self.keyboardView];
}

#pragma mark - getter & setter
/// animation view
- (void)setKeyboardView:(UIView *)keyboardView {
    objc_setAssociatedObject(self, &keyboardViewKey, keyboardView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)keyboardView {
    return objc_getAssociatedObject(self, &keyboardViewKey);
}

/// keyboard animation
- (void)setKeyboardAnimation:(YJHKeyboardAnimation *)keyboardAnimation {
    objc_setAssociatedObject(self, &keyboardKey, keyboardAnimation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (YJHKeyboardAnimation *)keyboardAnimation {
    YJHKeyboardAnimation *keyboard = objc_getAssociatedObject(self, &keyboardKey);
    if (keyboard == nil) {
        keyboard = [[YJHKeyboardAnimation alloc] init];
    }
    [self setKeyboardAnimation:keyboard];
    return keyboard;
}

@end
