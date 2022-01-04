//
//  FloatingTextAnimation.h
//  StreamApp
//
//  Created by Sergei Prikhodko on 05.05.19.
//  Copyright © 2019 Sergei Prikhodko. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface FloatingTextAnimation : CALayer

- (instancetype)initWithPosition:(CGPoint)position text:(NSString *)text scaleFactor:(CGFloat)scaleFactor;

- (void)performAnimation;

@end

NS_ASSUME_NONNULL_END
