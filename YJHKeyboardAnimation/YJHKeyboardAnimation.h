//
//  YJHKeyboardAnimation.h
//  YJHKeyboardAnimationDemo
//
//  Created by yunjinghui on 2019/9/24.
//  Copyright © 2019 yunjinghui. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^YJHKeyboardDidFinishDisplay)(CGFloat keyboardHeight);
typedef void(^YJHKeyboardHidden)(void);

@interface YJHKeyboardAnimation : NSObject

/// keyboard did show handler
@property (nonatomic, copy) YJHKeyboardDidFinishDisplay keyboardDidFinishDisplay;
/// keyboard hidden handler
@property (nonatomic, copy) YJHKeyboardHidden           keyboardDidFinishHidden;

/**
 keyboard will change frame func
 */
- (void)keyboardWillChangeFrameNoti:(NSNotification *)notification;

/*
 *  keyboard hidden
 */
- (void)keyboardWillHide;

@end

NS_ASSUME_NONNULL_END
