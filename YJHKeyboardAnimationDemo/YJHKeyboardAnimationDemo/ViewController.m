//
//  ViewController.m
//  YJHKeyboardAnimationDemo
//
//  Created by yunjinghui on 2019/9/24.
//  Copyright © 2019 yunjinghui. All rights reserved.
//

#import "ViewController.h"
#import "YJHKeyboardConst.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *te;

@end

@implementation ViewController {
    YJHKeyboardAnimation *_keyboard;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrameNoti:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHide) name:UIKeyboardWillHideNotification object:nil];

    _keyboard = [[YJHKeyboardAnimation alloc] init];
    _keyboard.keyboardDidFinishDisplay = ^(CGFloat keyboardHeight) {
        NSLog(@"%f", keyboardHeight);
    };
    _keyboard.keyboardDidFinishHidden = ^{
        NSLog(@"隐藏");
    };
}

- (void)keyboardWillChangeFrameNoti:(NSNotification *)notification {
    [_keyboard keyboardWillChangeFrameNoti:notification];
}

- (void)keyboardWillHide {
    [_keyboard keyboardWillHide];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}


- (void)dealloc {
}


@end
