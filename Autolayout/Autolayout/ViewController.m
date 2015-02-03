//
//  ViewController.m
//  Autolayout
//
//  Created by chen on 15-2-3.
//  Copyright (c) 2015年 chen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIButton *firstButton;
    UIButton *secondButton;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    firstButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [firstButton setTitle:@"First"forState:UIControlStateNormal];
    [firstButton sizeToFit];
    firstButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:firstButton];
    
/***例子一***/
    
//    Auto Layout用一个公式来计算界面之间的关系：
//    A = B * m + c
//    或者
//    viewA.attribute = viewB.attributs*multiplier + constant
    
//    按钮左边的位置等于父视图左边距减掉20
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:firstButton attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0f constant:20.f];
    [self.view addConstraint:constraint];
    
    
//    该约束将会使按钮距离父视图上面30个点
    constraint = [NSLayoutConstraint constraintWithItem:firstButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:30.f];
    [self.view addConstraint:constraint];
    
/****例子二****/
    
    secondButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [secondButton setTitle:@"Second" forState:UIControlStateNormal];
    [secondButton sizeToFit];
    secondButton.backgroundColor = [UIColor redColor];
    secondButton.translatesAutoresizingMaskIntoConstraints =NO;
    [self.view addSubview:secondButton];
    
//    距离底部40个点
    constraint = [NSLayoutConstraint constraintWithItem:secondButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0f constant:-40.f];
    [self.view addConstraint:constraint];
    
//    父视图的X轴方向居中
    constraint = [NSLayoutConstraint constraintWithItem:secondButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual  toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f];
    [self.view addConstraint:constraint];
    
//    按钮宽度固定为200个点
    constraint = [NSLayoutConstraint constraintWithItem:secondButton  attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:200.0f];
    [self.view addConstraint:constraint];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
