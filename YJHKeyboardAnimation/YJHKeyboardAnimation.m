//
//  YJHKeyboardAnimation.m
//  YJHKeyboardAnimationDemo
//
//  Created by yunjinghui on 2019/9/24.
//  Copyright © 2019 yunjinghui. All rights reserved.
//

#import "YJHKeyboardAnimation.h"
#import <UIKit/UIKit.h>

@interface YJHKeyboardAnimation ()

@property (nonatomic, assign) NSUInteger curve;
@property (nonatomic, assign) NSTimeInterval time;
@end

@implementation YJHKeyboardAnimation

- (instancetype)initWithEditViewController:(UIViewController *)viewController {
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter] addObserver:viewController selector:@selector(keyboardWillChangeFrameNoti:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:viewController selector:@selector(keyboardWillHide) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}

/**
 keyboard show notification

 @param notification keyboard info
 */
- (void)keyboardWillChangeFrameNoti:(NSNotification *)notification {
    NSDictionary *dict = notification.userInfo;
    
    // get keyboard show time
    if (_time == 0) {
        NSTimeInterval time = [dict[UIKeyboardAnimationDurationUserInfoKey] floatValue];
        _time = time;
    }
    
    // keyboard animation
    if (_curve == 0) {
        NSUInteger curve = [dict[UIKeyboardAnimationCurveUserInfoKey] integerValue];
        _curve = curve;
    }
    
    // keyboard height
    CGFloat keyboardH = [dict[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    
    // query animation
    [UIView animateWithDuration:_time animations:^{
        [UIView setAnimationCurve:self->_curve];
        if ([self.delegate respondsToSelector:@selector(keyboardDidFinishDisplay:)]) {
            [self.delegate keyboardDidFinishDisplay:keyboardH];
        }
    }];
}

/*
 *  keyboard hidden
 */
- (void)keyboardWillHide {
    // query animation
    [UIView animateWithDuration:_time animations:^{
        // animation
        [UIView setAnimationCurve:self->_curve];
        if ([self.delegate respondsToSelector:@selector(keyboardDidFinishHidden)]) {
            [self.delegate keyboardDidFinishHidden];
        }
    }];
}

/**
 unregister all notification
 */
- (void)unregisterAllNotificationsViewController:(UIViewController *)viewController {
    [[NSNotificationCenter defaultCenter] removeObserver:viewController name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:viewController name:UIKeyboardWillHideNotification object:nil];
}

@end
