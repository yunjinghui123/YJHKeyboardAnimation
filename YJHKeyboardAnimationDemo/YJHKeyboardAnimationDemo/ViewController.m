//
//  ViewController.m
//  YJHKeyboardAnimationDemo
//
//  Created by yunjinghui on 2019/9/24.
//  Copyright © 2019 yunjinghui. All rights reserved.
//

#import "ViewController.h"
#import "YJHKeyboardConst.h"

@interface ViewController () <YJHKeyboardProtocol>
@property (weak, nonatomic) IBOutlet UITextField *te;

@end

@implementation ViewController {
    YJHKeyboardAnimation *_keyboard;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _keyboard = [[YJHKeyboardAnimation alloc] initWithEditViewController:self];
    _keyboard.delegate = self;
}


- (void)keyboardWillChangeFrameNoti:(NSNotification *)notification {
    [_keyboard keyboardWillChangeFrameNoti:notification];
}

- (void)keyboardWillHide {
    [_keyboard keyboardWillHide];
}

- (void)keyboardDidFinishDisplay:(CGFloat)keyboardH {
    NSLog(@"____________%f", keyboardH);
}

- (void)keyboardDidFinishHidden {
    NSLog(@"____________keyboardDidFinishHidden");
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}


- (void)dealloc {
    [_keyboard unregisterAllNotificationsViewController:self];
}


@end
