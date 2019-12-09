//
//  YJHKeyboardAnimationDelegate.h
//  YJHKeyboardAnimationDemo
//
//  Created by yunjinghui on 2019/12/9.
//  Copyright © 2019 yunjinghui. All rights reserved.
//

#ifndef YJHKeyboardAnimationDelegate_h
#define YJHKeyboardAnimationDelegate_h

@protocol YJHKeyboardInfo <NSObject>
@required
@property (nonatomic, assign, readonly) NSUInteger     keyboardCurve;
@property (nonatomic, assign, readonly) NSTimeInterval keyboardDuration;
@property (nonatomic, assign, readonly) CGFloat        keyboardHeight;
@end

@protocol YJHKeyboardAnimationDelegate <YJHKeyboardInfo>
@required
/** keyboard will change frame func */
- (void)keyboardWillChangeFrameNoti:(NSNotification * _Nullable)notification;

/**  keyboard hidden */
- (void)keyboardWillHide:(UIView * _Nullable)keyBoardView;
@end



#endif /* YJHKeyboardAnimationDelegate_h */
