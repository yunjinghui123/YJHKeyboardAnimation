//
//  YJHKeyboardProtocol.h
//  YJHKeyboardAnimationDemo
//
//  Created by yunjinghui on 2019/9/24.
//  Copyright © 2019 yunjinghui. All rights reserved.
//

#ifndef YJHKeyboardProtocol_h
#define YJHKeyboardProtocol_h

#import <UIKit/UIKit.h>

@protocol YJHKeyboardProtocol <NSObject>

@optional

/**
 show keyboard, keyboard frame change

 @param keyboardH keyboard height
 */
- (void)keyboardDidFinishDisplay:(CGFloat)keyboardH;

/**
 hidden keyboard
 */
- (void)keyboardDidFinishHidden;

@end

#endif /* YJHKeyboardProtocol_h */
