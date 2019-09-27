//
//  YJHKeyboardAnimation.h
//  YJHKeyboardAnimationDemo
//
//  Created by yunjinghui on 2019/9/24.
//  Copyright © 2019 yunjinghui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YJHKeyboardProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface YJHKeyboardAnimation : NSObject <YJHKeyboardProtocol>

/**
 - create instances of this class
 */
- (instancetype)initWithEditViewController:(UIViewController *)viewController;

/**
 keyboard will change frame func
 */
- (void)keyboardWillChangeFrameNoti:(NSNotification *)notification;

/*
 *  keyboard hidden
 */
- (void)keyboardWillHide;

/**
 unregiseter all notification
 */
-(void)unregisterAllNotificationsViewController:(UIViewController *)viewController;

/**
 Unavailable. Please use sharedManager method
 */
-(nonnull instancetype)init NS_UNAVAILABLE;

/**
 Unavailable. Please use sharedManager method
 */
+ (nonnull instancetype)new NS_UNAVAILABLE;

/**
 keyboard delegate
 */
@property (nonatomic, weak) id<YJHKeyboardProtocol> delegate;

@end

NS_ASSUME_NONNULL_END
