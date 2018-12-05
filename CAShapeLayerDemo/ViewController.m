//
//  ViewController.m
//  CAShapeLayerDemo
//
//  Created by 55it on 2018/12/5.
//  Copyright © 2018年 55it. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//麦克风的layer
@property (nonatomic,strong)CAShapeLayer * indicateLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//  https://www.jianshu.com/p/6c9aa9c5dd68
    
    //画麦克风
    UIView *voiceView = [[UIView alloc]initWithFrame:CGRectMake(10, 20,80, 80)];
    voiceView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:voiceView];
    
    //cornerRadius圆角半径
    UIBezierPath *path1 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 10, 60, 70) cornerRadius:30];
    self.indicateLayer = [CAShapeLayer layer];
    self.indicateLayer.path = [path1 CGPath];
    self.indicateLayer.lineWidth = 1;
    self.indicateLayer.fillColor = [[UIColor lightGrayColor]CGColor];
    self.indicateLayer.strokeColor = [UIColor redColor].CGColor;
    self.indicateLayer.path = [path1 CGPath];
    [voiceView.layer addSublayer:self.indicateLayer];
    
    
    
    //圆形进度条的实现
    UIView *circleView = [[UIView alloc]initWithFrame:CGRectMake(10, 110, 100, 100)];
    [self.view addSubview:circleView];
   
    //背景环
    CAShapeLayer *shape = [CAShapeLayer layer];
    shape.frame = circleView.bounds;
    shape.strokeEnd = 1;
    shape.lineWidth = 3;
    shape.lineCap = kCALineCapRound;
    shape.fillColor = [UIColor clearColor].CGColor;
    shape.strokeColor = [UIColor lightGrayColor].CGColor;
    UIBezierPath *path2 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(50, 50) radius:49 startAngle:-0.5*M_PI endAngle:1.5*M_PI clockwise:YES];
    shape.path = path2.CGPath;
      [circleView.layer addSublayer:shape];
    
    //进度环
    CAShapeLayer *shape1 = [CAShapeLayer layer];
    shape1.frame = circleView.bounds;
    shape1.lineWidth = 3;
    shape1.lineCap = kCALineCapRound;
    shape1.fillColor = [UIColor clearColor].CGColor;
    shape1.strokeColor = [UIColor blueColor].CGColor;
    shape1.path = path2.CGPath;
    //圆环的度数，0-1
    shape1.strokeEnd = 0.5;
    
    
    //渐变色
    CAGradientLayer *gradientlayer = [CAGradientLayer layer];
    gradientlayer.frame = circleView.bounds;
    gradientlayer.locations = @[@0.3,@0.1,@0.8];
    gradientlayer.colors = @[(id)[UIColor greenColor].CGColor,(id)[UIColor redColor].CGColor,(id)[UIColor yellowColor].CGColor];
    gradientlayer.startPoint = CGPointMake(0, 0);
    gradientlayer.endPoint = CGPointMake(0,1);
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 3.0f;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    pathAnimation.fromValue = @(0);
    pathAnimation.toValue = @(1);
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
   [shape addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
    

    [gradientlayer setMask:shape1];
    [circleView.layer addSublayer:gradientlayer];

// 扇形
    
    UIBezierPath *path3 = [UIBezierPath bezierPath];
    [path3 moveToPoint:CGPointMake(200, 100)];
    [path3 addArcWithCenter:CGPointMake(300, 100) radius:75 startAngle:0 endAngle:M_PI_4 clockwise:YES];
    [path3 closePath];//封闭
    CAShapeLayer *arc = [CAShapeLayer layer];
    arc.lineWidth = 3;
    arc.fillColor = [UIColor clearColor].CGColor;
    arc.strokeColor = [UIColor blueColor].CGColor;
    arc.lineCap = kCALineJoinBevel;
    arc.path = path3.CGPath;
    [self.view.layer addSublayer:arc];
    
    
    
    
    
    
    
}


@end
