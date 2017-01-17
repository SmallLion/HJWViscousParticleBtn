//
//  HJWViscousParticleBtn.m
//  HJWViscousParticleBtn
//
//  Created by Lemon_Mr.H on 2017/1/11.
//  Copyright © 2017年 Lemon_Mr.H. All rights reserved.
//

#import "HJWViscousParticleBtn.h"

@interface HJWViscousParticleBtn ()
@property (nonatomic,strong) CADisplayLink *displayLink;
@property  NSInteger animationCount; // 动画的数量

@property (nonatomic, assign) BOOL animating;
@property (nonatomic, strong) NSTimer *swappingTimer;

@end

@implementation HJWViscousParticleBtn

- (NSTimer *)swappingTimer {
    if (!_swappingTimer) {
        _swappingTimer =
        [NSTimer scheduledTimerWithTimeInterval:4.0f
                                         target:self
                                       selector:@selector(swappingAction)
                                       userInfo:nil
                                        repeats:YES];
    }
    return _swappingTimer;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setNeedsDisplay];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* shadow2Color = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    
    //// Shadow Declarations
    NSShadow* shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor.blackColor colorWithAlphaComponent: 0.2];
    shadow.shadowOffset = CGSizeMake(0, 2);
    shadow.shadowBlurRadius = 20;
    NSShadow* shadow2 = [[NSShadow alloc] init];
    shadow2.shadowColor = [shadow2Color colorWithAlphaComponent: CGColorGetAlpha(shadow2Color.CGColor) * 0.3];
    shadow2.shadowOffset = CGSizeMake(4, -4);
    shadow2.shadowBlurRadius = 15;
    
    //// Group
    {
        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(100, 75)];
        [bezier2Path addCurveToPoint: CGPointMake(90.06, 77.05) controlPoint1: CGPointMake(96.47, 75) controlPoint2: CGPointMake(93.11, 75.73)];
        [bezier2Path addCurveToPoint: CGPointMake(75, 100) controlPoint1: CGPointMake(81.2, 80.9) controlPoint2: CGPointMake(75, 89.73)];
        [bezier2Path addCurveToPoint: CGPointMake(100, 125) controlPoint1: CGPointMake(75, 113.81) controlPoint2: CGPointMake(86.19, 125)];
        [bezier2Path addCurveToPoint: CGPointMake(125, 100) controlPoint1: CGPointMake(113.81, 125) controlPoint2: CGPointMake(125, 113.81)];
        [bezier2Path addCurveToPoint: CGPointMake(100, 75) controlPoint1: CGPointMake(125, 86.19) controlPoint2: CGPointMake(113.81, 75)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(150, 100)];
        [bezier2Path addCurveToPoint: CGPointMake(100, 150) controlPoint1: CGPointMake(150, 127.61) controlPoint2: CGPointMake(127.61, 150)];
        [bezier2Path addCurveToPoint: CGPointMake(50, 100) controlPoint1: CGPointMake(72.39, 150) controlPoint2: CGPointMake(50, 127.61)];
        [bezier2Path addCurveToPoint: CGPointMake(69.89, 60.08) controlPoint1: CGPointMake(50, 83.69) controlPoint2: CGPointMake(57.81, 69.2)];
        [bezier2Path addCurveToPoint: CGPointMake(100, 50) controlPoint1: CGPointMake(78.27, 53.75) controlPoint2: CGPointMake(88.7, 50)];
        [bezier2Path addCurveToPoint: CGPointMake(150, 100) controlPoint1: CGPointMake(127.61, 50) controlPoint2: CGPointMake(150, 72.39)];
        [bezier2Path closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadow.shadowOffset, shadow.shadowBlurRadius, [shadow.shadowColor CGColor]);
        [UIColor.whiteColor setFill];
        [bezier2Path fill];
        CGContextRestoreGState(context);
        
        
        
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(100, 76)];
        [bezierPath addCurveToPoint: CGPointMake(90.06, 78.05) controlPoint1: CGPointMake(96.47, 76) controlPoint2: CGPointMake(93.11, 76.73)];
        [bezierPath addCurveToPoint: CGPointMake(75, 101) controlPoint1: CGPointMake(81.2, 81.9) controlPoint2: CGPointMake(75, 90.73)];
        [bezierPath addCurveToPoint: CGPointMake(100, 126) controlPoint1: CGPointMake(75, 114.81) controlPoint2: CGPointMake(86.19, 126)];
        [bezierPath addCurveToPoint: CGPointMake(125, 101) controlPoint1: CGPointMake(113.81, 126) controlPoint2: CGPointMake(125, 114.81)];
        [bezierPath addCurveToPoint: CGPointMake(100, 76) controlPoint1: CGPointMake(125, 87.19) controlPoint2: CGPointMake(113.81, 76)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(150, 101)];
        [bezierPath addCurveToPoint: CGPointMake(100, 151) controlPoint1: CGPointMake(150, 128.61) controlPoint2: CGPointMake(127.61, 151)];
        [bezierPath addCurveToPoint: CGPointMake(50, 101) controlPoint1: CGPointMake(72.39, 151) controlPoint2: CGPointMake(50, 128.61)];
        [bezierPath addCurveToPoint: CGPointMake(69.89, 61.08) controlPoint1: CGPointMake(50, 84.69) controlPoint2: CGPointMake(57.81, 70.2)];
        [bezierPath addCurveToPoint: CGPointMake(100, 51) controlPoint1: CGPointMake(78.27, 54.75) controlPoint2: CGPointMake(88.7, 51)];
        [bezierPath addCurveToPoint: CGPointMake(150, 101) controlPoint1: CGPointMake(127.61, 51) controlPoint2: CGPointMake(150, 73.39)];
        [bezierPath closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadow2.shadowOffset, shadow2.shadowBlurRadius, [shadow2.shadowColor CGColor]);
        [UIColor.whiteColor setFill];
        [bezierPath fill];
        CGContextRestoreGState(context);
    }
}

- (void)startAnimation {
    [self trigger];
}

- (void)stopAnimation {
    [self unTrigger];
}

- (void)trigger {
    [self beforeAnimation];
    if (!_animating) {
        _animating = YES;
        [self.swappingTimer fire];
    }
    
    // 果冻粒子 1.0s周期、 延迟1.0s
}

- (void)unTrigger {
    [self finishAnimation];
    if (_animating) {
        _animating = NO;
        [self.swappingTimer invalidate];
    }
}

- (void)swappingAction {
    // 上下浮动
    [UIView animateWithDuration:2.0
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         self.center = CGPointMake(self.center.x, self.center.y + 10);
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:2.0
                                          animations:^{
                                              self.center = CGPointMake(self.center.x, self.center.y - 10);
                                          }];
                     }];
}

//动画之前调用
- (void)beforeAnimation {
    if (self.displayLink == nil) {
        self.displayLink = [CADisplayLink displayLinkWithTarget: self
                                                       selector: @selector(displayLinkAction:)];
        [self.displayLink addToRunLoop: [NSRunLoop mainRunLoop]
                               forMode: NSDefaultRunLoopMode];
    }
    self.animationCount++;
}

//动画完成之后调用
- (void)finishAnimation {
    self.animationCount --;
    if (self.animationCount == 0) {
        [self.displayLink invalidate];
        self.displayLink = nil;
    }
}

- (void)displayLinkAction: (CADisplayLink *)dis {
    // 重新布局方法
    // 在receiver标上一个需要被重新绘图的标记，在下一个draw周期自动重绘
    // 默认runloop周期 60Hz
    [self setNeedsDisplay];
}


@end
