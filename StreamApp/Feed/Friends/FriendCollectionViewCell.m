//
//  FriendCollectionViewCell.m
//  StreamApp
//
//  Created by Sergei Prikhodko on 05.05.19.
//  Copyright © 2019 Sergei Prikhodko. All rights reserved.
//

#import "FriendCollectionViewCell.h"
#import "ThemeManager.h"

@interface FriendCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *badgeLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@end

@implementation FriendCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupColors];
    [self setupBadgeView];
}

- (void)showStarAvatarImage:(NSString *)image name:(NSString *)name {
    self.avatarImageView.image = [UIImage imageNamed:image];
    
    self.nameLabel.text = name;
    self.nameLabel.textColor = [ThemeManager mainTextColor];
    self.nameLabel.font = [UIFont boldSystemFontOfSize:12.];
    
    self.badgeLabel.text = [NSString stringWithFormat:@"★"];
    self.badgeLabel.hidden = NO;
    self.badgeLabel.textColor = [ThemeManager backgroundColor];
    self.badgeLabel.backgroundColor = [UIColor whiteColor];

    [self addWhiteBorder];
}

- (void)showDisabledAvatarImage:(NSString *)image name:(NSString *)name {
    self.avatarImageView.image = [UIImage imageNamed:image];
    
    self.nameLabel.text = name;
    self.nameLabel.textColor = [ThemeManager disabledTextColor];
    self.nameLabel.font = [UIFont systemFontOfSize:12.];
    
    self.badgeLabel.hidden = YES;
    
    [self addBoderWithGradient:NO];
}

- (void)showGradientAvatarImage:(NSString *)image name:(NSString *)name badgeValue:(NSInteger)badgeValue {
    self.avatarImageView.image = [UIImage imageNamed:image];
    
    self.nameLabel.text = name;
    self.nameLabel.textColor = [ThemeManager metaTextColor];
    self.nameLabel.font = [UIFont systemFontOfSize:12.];
    
    self.badgeLabel.text = [NSString stringWithFormat:@"%ld", (long)badgeValue];
    self.badgeLabel.hidden = badgeValue == 0;
    self.badgeLabel.textColor = [ThemeManager mainTextColor];
    self.badgeLabel.backgroundColor = [UIColor colorWithRed:0.96f green:0.34f blue:0.28f alpha:1.0f];

    [self addBoderWithGradient:YES];
}

- (void)setupColors {
    self.backgroundColor = [UIColor clearColor];
    self.nameLabel.textColor = [ThemeManager disabledTextColor];
    self.avatarImageView.backgroundColor = [UIColor lightGrayColor];
    [self addBoderWithGradient:NO];
}

- (void)setupBadgeView {
    self.badgeLabel.layer.cornerRadius = self.badgeLabel.bounds.size.height / 2;
    self.badgeLabel.clipsToBounds = YES;
}

- (void)addBoderWithGradient:(BOOL)shouldUseGradient {
    // add gradient circle
    CAGradientLayer *gradientCircleLayer =  [[CAGradientLayer alloc] init];
    CGRect gradientFrame = self.avatarImageView.bounds;
    CGFloat gradientBorder = 3.0;
    gradientFrame.origin.x = -gradientBorder;
    gradientFrame.origin.y = -gradientBorder;
    gradientFrame.size.height += 2 * gradientBorder;
    gradientFrame.size.width += 2 * gradientBorder;
    
    gradientCircleLayer.frame = gradientFrame;
    
    gradientCircleLayer.startPoint = CGPointMake(0.0, 0.0);
    gradientCircleLayer.endPoint = CGPointMake(1.0, 1.0);
    
    if (shouldUseGradient) {
        gradientCircleLayer.colors = @[(id)[ThemeManager highlightTextColor].CGColor, (id)[UIColor colorWithRed:0.55f green:0.44f blue:0.93f alpha:1.0f].CGColor];
    } else {
        gradientCircleLayer.colors = @[(id)[ThemeManager disabledBorderColor].CGColor, (id)[ThemeManager disabledBorderColor].CGColor];
    }
    
    CAShapeLayer *gradientMaskLayer = [[CAShapeLayer alloc] init];
    CGRect gradientMaskFrame = self.avatarImageView.bounds;
    gradientMaskFrame.origin.x = 0;
    gradientMaskFrame.origin.y = 0;
    gradientMaskFrame.size.height +=  2 * gradientBorder;
    gradientMaskFrame.size.width +=  2 * gradientBorder;
    gradientMaskLayer.lineWidth = 2 * gradientBorder;
    gradientMaskLayer.path = [UIBezierPath bezierPathWithOvalInRect:gradientMaskFrame].CGPath;
    gradientMaskLayer.fillColor = nil;
    gradientMaskLayer.strokeColor = [UIColor whiteColor].CGColor;
    
    gradientCircleLayer.mask = gradientMaskLayer;
    
    [self.avatarImageView.layer addSublayer: gradientCircleLayer];
    
    // add dark circle
    [self addMiddleBorder];
    
    // clip to cicle
    [self applyRoundMaskOnRect:gradientFrame];
}

- (void)addWhiteBorder {
    // add gradient circle
    CAGradientLayer *gradientCircleLayer =  [[CAGradientLayer alloc] init];
    CGRect gradientFrame = self.avatarImageView.bounds;
    CGFloat gradientBorder = 3.0;
    gradientFrame.origin.x = -gradientBorder;
    gradientFrame.origin.y = -gradientBorder;
    gradientFrame.size.height += 2 * gradientBorder;
    gradientFrame.size.width += 2 * gradientBorder;
    
    gradientCircleLayer.frame = gradientFrame;
    
    gradientCircleLayer.startPoint = CGPointMake(0.0, 0.0);
    gradientCircleLayer.endPoint = CGPointMake(1.0, 1.0);
    
    gradientCircleLayer.colors = @[(id)[ThemeManager mainTextColor].CGColor, (id)[ThemeManager mainTextColor].CGColor];
    
    CAShapeLayer *gradientMaskLayer = [[CAShapeLayer alloc] init];
    CGRect gradientMaskFrame = self.avatarImageView.bounds;
    gradientMaskFrame.origin.x = 0;
    gradientMaskFrame.origin.y = 0;
    gradientMaskFrame.size.height +=  2 * gradientBorder;
    gradientMaskFrame.size.width +=  2 * gradientBorder;
    gradientMaskLayer.lineWidth = 2 * gradientBorder;
    gradientMaskLayer.path = [UIBezierPath bezierPathWithOvalInRect:gradientMaskFrame].CGPath;
    gradientMaskLayer.fillColor = nil;
    gradientMaskLayer.strokeColor = [UIColor whiteColor].CGColor;
    
    gradientCircleLayer.mask = gradientMaskLayer;
    
    [self.avatarImageView.layer addSublayer: gradientCircleLayer];
    
    // add dark circle
    [self addMiddleBorder];
    
    // clip to cicle
    [self applyRoundMaskOnRect:gradientFrame];
}

- (void)addMiddleBorder {
    CAShapeLayer *darkCircleLayer = [[CAShapeLayer alloc] init];
    CGRect darkCicleFrame = self.avatarImageView.bounds;
    darkCircleLayer.lineWidth = 2.0;
    darkCircleLayer.path = [UIBezierPath bezierPathWithOvalInRect:darkCicleFrame].CGPath;
    darkCircleLayer.fillColor = nil;
    darkCircleLayer.strokeColor = [ThemeManager backgroundColor].CGColor;
    [self.avatarImageView.layer addSublayer: darkCircleLayer];
}

- (void)applyRoundMaskOnRect:(CGRect)gradientFrame {
    self.clipsToBounds = NO;
    self.avatarImageView.clipsToBounds = NO;
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:gradientFrame];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = path.CGPath;
    self.avatarImageView.layer.mask = maskLayer;
    
    self.avatarImageView.layer.shouldRasterize = YES;
    self.avatarImageView.layer.rasterizationScale = [UIScreen mainScreen].scale;
}

@end
