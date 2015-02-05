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

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

    //通过uiview设置（2D效果）
    //    self.iconView.transform=CGAffineTransformMakeTranslation(0, -100);
    //通过layer来设置（3D效果,x，y，z三个方向）
    //    self.iconView.layer.transform=CATransform3DMakeTranslation(100, 20, 0);
  
    //通过KVC来设置
    NSValue *v=[NSValue valueWithCATransform3D:CATransform3DMakeTranslation(100, 20, 0)];
    [self.testView.layer setValue:v forKeyPath:@"transform"];
    
    //设置阴影的颜色
    self.testView.layer.shadowColor=[UIColor redColor].CGColor;
    //设置阴影的偏移量，如果为正数，则代表为往右边偏移
    self.testView.layer.shadowOffset=CGSizeMake(0, 15);
    //设置阴影的透明度(0~1之间，0表示完全透明)
    self.testView.layer.shadowOpacity=0.5;
    
    //如果是只需要设置在某一个方向上的移动，可以参考下面的代码
    //在x的方向上向左移动100
//    [self.testView.layer setValue:@(100) forKeyPath:@"transform.translation.x"];
}

- (void)setLayer
{
    //设置边框的宽度为20
    self.customView.layer.borderWidth=5;
    //设置边框的颜色
    self.customView.layer.borderColor=[UIColor blackColor].CGColor;
    //设置layer的圆角
    self.customView.layer.cornerRadius=20;
    //设置超过子图层的部分裁减掉
    //UI框架中使用的方法
    //    self.customView.clipsToBounds=YES;
    self.customView.layer.masksToBounds=YES;
  
    //在view的图层上添加一个image，contents表示接受内容
    self.customView.layer.contents=(id)[UIImage imageNamed:@"me"].CGImage;
    
    //设置阴影的颜色
    self.customView.layer.shadowColor=[UIColor blackColor].CGColor;
    //设置阴影的偏移量，如果为正数，则代表为往右边偏移
    self.customView.layer.shadowOffset=CGSizeMake(15, 5);
    //设置阴影的透明度(0~1之间，0表示完全透明)
    self.customView.layer.shadowOpacity=0.6;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
