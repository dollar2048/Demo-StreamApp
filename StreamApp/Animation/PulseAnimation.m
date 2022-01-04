//
//  PulseAnimation.m
//  StreamApp
//
//  Created by Sergei Prikhodko on 05.05.19.
//  Copyright © 2019 Sergei Prikhodko. All rights reserved.
//

#import "PulseAnimation.h"
#import "ThemeManager.h"
@import UIKit;

const CGFloat PARadius = 150.0;
const CGFloat PADuration = 0.8;

@interface PulseAnimation() <CAAnimationDelegate>
@property (strong, nonatomic) CAAnimationGroup *animationGroup;
@end

@implementation PulseAnimation

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [ThemeManager highlightTextColor].CGColor;
        self.contentsScale = [UIScreen mainScreen].scale;

        self.opacity = 0;
        
        self.bounds = CGRectMake(0, 0, PARadius * 2, PARadius * 2);
        self.cornerRadius = PARadius;
    }
    return self;
}

- (instancetype)initWithPosition:(CGPoint)position {
    self = [self init];
    if (self) {
        self.position = position;
    }
    return self;
}

- (void)performAnimation {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self setupAnimationGroup];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self addAnimation:self.animationGroup forKey:@"pulse"];
        });
    });
}
    
- (void)setupAnimationGroup {
    self.animationGroup = [CAAnimationGroup new];
    self.animationGroup.duration = PADuration;
    CAMediaTimingFunction *defaultCurve = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionDefault];
    self.animationGroup.timingFunction = defaultCurve;
    self.animationGroup.delegate = self;
    self.animationGroup.animations = @[[self createScaleAnimation], [self createOpacityAnimation]];
}

- (CAKeyframeAnimation *)createScaleAnimation {
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.xy"];
    scaleAnimation.keyTimes = @[@(0), @(1)];
    scaleAnimation.values = @[@(0.18), @(1)];

    scaleAnimation.duration = PADuration;
    
    return scaleAnimation;
}

- (CAKeyframeAnimation *)createOpacityAnimation {
    CAKeyframeAnimation *opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.keyTimes = @[@(0)];
    opacityAnimation.values = @[@(0.15)];
    opacityAnimation.duration = PADuration;
    
    return opacityAnimation;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (flag == YES) {
        [self removeFromSuperlayer];
    }
}

@end
