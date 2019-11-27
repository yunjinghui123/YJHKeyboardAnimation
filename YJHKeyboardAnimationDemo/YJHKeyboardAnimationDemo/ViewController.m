//
//  ViewController.m
//  YJHKeyboardAnimationDemo
//
//  Created by yunjinghui on 2019/9/24.
//  Copyright © 2019 yunjinghui. All rights reserved.
//

#import "ViewController.h"
#import "UIResponder+YJHKeyboardAnimation.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *te;

@end

@implementation ViewController {
    YJHKeyboardAnimation *_keyboard;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addKeyObserverWithKeyView:nil keyboardShow:^(CGFloat height) {
        NSLog(@"%f", height);
    } keyboardHidden:^{
        NSLog(@"隐藏");
    }];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}


- (void)dealloc {
}


@end
