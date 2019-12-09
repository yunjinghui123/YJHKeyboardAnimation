//
//  YJHKeyboardAnimation.m
//  YJHKeyboardAnimationDemo
//
//  Created by yunjinghui on 2019/9/24.
//  Copyright © 2019 yunjinghui. All rights reserved.
//

#import "YJHKeyboardAnimation.h"

@interface YJHKeyboardAnimation ()
@property (nonatomic, assign) NSUInteger curve;
@property (nonatomic, assign) NSTimeInterval time;
@property (nonatomic, assign) CGFloat keyboardHeight;
@end

@implementation YJHKeyboardAnimation

#pragma mark - YJHKeyboardAnimationDelegate
/**
 keyboard show notification

 @param notification keyboard info
 */
- (void)keyboardWillChangeFrameNoti:(NSNotification *)notification {
    NSDictionary *dict = notification.userInfo;
    // query animation
    [UIView animateWithDuration:[self getDuration:dict] animations:^{
        [UIView setAnimationCurve:[self getCurve:dict]];
        if (self.keyboardDidFinishDisplay) {
            self.keyboardDidFinishDisplay([self getKeyboardHeight:dict]);
        }
    }];
}

/*
 *  keyboard hidden
 */
- (void)keyboardWillHide:(UIView *)keyBoardView {
    // query animation
    [UIView animateWithDuration:_time animations:^{
        // animation
        [UIView setAnimationCurve:self->_curve];
        if (keyBoardView != nil) {
            [keyBoardView.inputView endEditing:YES];
            [keyBoardView resignFirstResponder];
        }
        if (self.keyboardDidFinishHidden) {
            self.keyboardDidFinishHidden();
        }
    }];
}

#pragma mark - YJHKeyboardInfo Get
- (CGFloat)getDuration:(NSDictionary *)dict {
    if (_time == 0) {
         _time = [dict[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    }
    return _time;
}

- (NSUInteger)getCurve:(NSDictionary *)dict {
    if (_curve == 0) {
        _curve = [dict[UIKeyboardAnimationCurveUserInfoKey] integerValue];
    }
    return _curve;
}

- (CGFloat)getKeyboardHeight:(NSDictionary *)dict {
    _keyboardHeight = [dict[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    return _keyboardHeight;
}

#pragma mark - YJHKeyboardInfo
- (NSUInteger)keyboardCurve {
    return _curve;
}

- (NSTimeInterval)keyboardDuration {
    return _time;
}

- (CGFloat)keyboardHeight {
    return _keyboardHeight;
}

@end
