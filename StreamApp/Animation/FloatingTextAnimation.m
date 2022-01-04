//
//  FloatingTextAnimation.m
//  StreamApp
//
//  Created by Sergei Prikhodko on 05.05.19.
//  Copyright © 2019 Sergei Prikhodko. All rights reserved.
//

#import "FloatingTextAnimation.h"
#import "ThemeManager.h"
@import UIKit;

const CGFloat FTADuration = 1.0;
const CGFloat FTAMinFontSize = 20.0;

const CGFloat FTAWidth = 60.0;
const CGFloat FTAHeigh = 58.0;

@interface FloatingTextAnimation() <CAAnimationDelegate>
@property (strong, nonatomic) CAAnimationGroup *animationGroup;
@end

@implementation FloatingTextAnimation

- (instancetype)init {
    self = [super init];
    if (self) {
        self.contentsScale = [UIScreen mainScreen].scale;

        self.opacity = 0;
        
        self.bounds = CGRectMake(0, 0, FTAWidth, FTAHeigh);
    }
    return self;
}

- (instancetype)initWithPosition:(CGPoint)position text:(NSString *)text scaleFactor:(CGFloat)scaleFactor {
    self = [self init];
    if (self) {
        position.y -= FTAHeigh / 2.0;
        self.position = position;
        
        [self addLayerWithText:text scaleFactor:scaleFactor];

    }
    return self;
}

- (void)performAnimation {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self setupAnimationGroup];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self addAnimation:self.animationGroup forKey:@"position"];
        });
    });
}

- (void)addLayerWithText:(NSString *)text scaleFactor:(CGFloat)scaleFactor {
    CATextLayer *label = [CATextLayer new];
    scaleFactor = (scaleFactor > 1.0 || scaleFactor < 0.0) ? 1.0 : scaleFactor;
    label.fontSize = FTAMinFontSize + 16.0 * scaleFactor;
    label.font = (__bridge CFTypeRef _Nullable)([UIFont boldSystemFontOfSize:2]);
    label.frame = self.bounds;
    label.string = text;
    label.alignmentMode = kCAAlignmentCenter;
    label.foregroundColor = [ThemeManager randomColor].CGColor;
    [self addSublayer:label];
}

- (void)setupAnimationGroup {
    self.animationGroup = [CAAnimationGroup new];
    self.animationGroup.duration = FTADuration;
    CAMediaTimingFunction *defaultCurve = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseIn];
    self.animationGroup.timingFunction = defaultCurve;
    self.animationGroup.delegate = self;
    self.animationGroup.animations = @[[self createPositionAnimation], [self createOpacityAnimation]];
}

- (CABasicAnimation *)createPositionAnimation {
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    CGPoint fromPoint = self.position;
    fromPoint.x += arc4random_uniform(FTAWidth*2.0/3.0) - 2.0 * FTAWidth/3.0;
    scaleAnimation.fromValue = [NSValue valueWithCGPoint:fromPoint];

    scaleAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(self.position.x, -350)];
    scaleAnimation.duration = FTADuration;
    
    return scaleAnimation;
}

- (CAKeyframeAnimation *)createOpacityAnimation {
        
    CAKeyframeAnimation *opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.duration = FTADuration;
    opacityAnimation.values = @[@(1), @(0.8), @(0)];
    opacityAnimation.keyTimes = @[@(0), @(0.5), @(1)];
        
        
    return opacityAnimation;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (flag == YES) {
        [self removeFromSuperlayer];
    }
}
    
@end
