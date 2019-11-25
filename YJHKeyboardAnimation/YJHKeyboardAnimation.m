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
@end

@implementation YJHKeyboardAnimation

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
        if (self.keyboardDidFinishDisplay) {
            self.keyboardDidFinishDisplay(keyboardH);
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


@end
