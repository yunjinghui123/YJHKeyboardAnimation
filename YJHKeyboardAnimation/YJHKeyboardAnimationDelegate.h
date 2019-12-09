//
//  YJHKeyboardAnimationDelegate.h
//  YJHKeyboardAnimationDemo
//
//  Created by yunjinghui on 2019/12/9.
//  Copyright © 2019 yunjinghui. All rights reserved.
//

#ifndef YJHKeyboardAnimationDelegate_h
#define YJHKeyboardAnimationDelegate_h


@protocol YJHKeyboardAnimationDelegate <NSObject>

@required
/**
 keyboard will change frame func
 */
- (void)keyboardWillChangeFrameNoti:(NSNotification * _Nullable)notification;

/*
 *  keyboard hidden
 */
- (void)keyboardWillHide:(UIView * _Nullable)keyBoardView;

@end



#endif /* YJHKeyboardAnimationDelegate_h */
