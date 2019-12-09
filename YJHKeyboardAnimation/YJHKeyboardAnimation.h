//
//  YJHKeyboardAnimation.h
//  YJHKeyboardAnimationDemo
//
//  Created by yunjinghui on 2019/9/24.
//  Copyright © 2019 yunjinghui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YJHKeyboardAnimationDelegate.h"

/**
 A simple class, Provide show and hide animations for 'UIResponder+YJHKeyboardAnimation' to call.
 Of course, you can call it separatelly in your class, but it's so troublesome.
 So it is recommended to call 'UIViewController+YJHKeyboardAnimation'
 */
NS_ASSUME_NONNULL_BEGIN

typedef void(^YJHKeyboardDidFinishDisplay)(CGFloat keyboardHeight);
typedef void(^YJHKeyboardHidden)(void);

@interface YJHKeyboardAnimation : NSObject <YJHKeyboardAnimationDelegate>

/// keyboard did show handler
@property (nonatomic, copy) YJHKeyboardDidFinishDisplay keyboardDidFinishDisplay;
/// keyboard hidden handler
@property (nonatomic, copy) YJHKeyboardHidden           keyboardDidFinishHidden;

@end

NS_ASSUME_NONNULL_END
