//
//  CABasicViewController.m
//  核心动画CoreAnimation
//
//  Created by 杨波 on 2018/12/27.
//  Copyright © 2018 杨波. All rights reserved.
//

#import "CABasicViewController.h"

@interface CABasicViewController ()<CAAnimationDelegate>
@property (nonatomic,strong) UIView *animationView;
@end

@implementation CABasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"CABasicAnimation";
    self.view.backgroundColor = [UIColor whiteColor];
    self.animationView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.animationView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.animationView];
}

//在点击屏幕时，触发动画：
-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent *)event{
    CGPoint positon = [touches.anyObject locationInView:self.view];
    [self basicAnimation_PositionTo:positon];
}
/* 动画 */
- (void)basicAnimation_PositionTo:(CGPoint)position{
    /* 初始化 */
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    /* 设置代理 */
    basicAnimation.delegate = self;
    /* 到达位置 */
    basicAnimation.toValue = [NSValue valueWithCGPoint:position];
    /* 存储结束位置 */
    [basicAnimation setValue:[NSValue valueWithCGPoint:position] forKey:@"positionToEnd"];
    /* 延迟执行 */
//    basicAnimation.beginTime = CACurrentMediaTime() + 1;
    /* 动画时间 */
    basicAnimation.duration = 1;
    /* 动画节奏 */
    basicAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    /* 动画速率 */
//    basicAnimation.speed = 0.1;
    //图层是否显示执行后的动画执行后的位置以及状态
//    basicAnimation.removedOnCompletion = YES;
//    basicAnimation.fillMode = kCAFillModeBoth;
    //动画完成后是否以动画形式回到初始值
//    basicAnimation.autoreverses = YES;
    /* 动画时间偏移  */
//    basicAnimation.timeOffset = 1;
    /* 添加动画 */
    [self.animationView.layer addAnimation:basicAnimation forKey:NSStringFromSelector(_cmd)];
    
}


- (void)animationDidStart:(CAAnimation *)anim{
    NSLog(@"动画开始");
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    NSLog(@"动画结束");
    CGPoint point = [[anim valueForKey:@"positionToEnd"] CGPointValue];
    self.animationView.frame = CGRectMake(point.x - self.animationView.frame.size.width/2, point.y - self.animationView.frame.size.height/2, self.animationView.frame.size.width, self.animationView.frame.size.height);
}
@end
