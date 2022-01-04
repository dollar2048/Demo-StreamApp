//
//  SenderFooterView.m
//  StreamApp
//
//  Created by Sergei Prikhodko on 04.05.19.
//  Copyright © 2019 Sergei Prikhodko. All rights reserved.
//

#import "SenderFooterView.h"
#import "ThemeManager.h"
#import "PulseAnimation.h"
#import "FloatingTextAnimation.h"

const CGFloat StarButtonAnimationDuration = 0.8;

@interface SenderFooterView ()
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UIImageView *verifiedImageView;
@property (weak, nonatomic) IBOutlet UILabel *senderLabel;
@property (weak, nonatomic) IBOutlet UILabel *followersLabel;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
@property (weak, nonatomic) IBOutlet UIButton *starButton;
@property (weak, nonatomic) IBOutlet UILabel *shareLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentsLabel;
@property (weak, nonatomic) IBOutlet UILabel *starsLabel;

@property (assign, nonatomic) NSUInteger numberOrStars;
@end

@implementation SenderFooterView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.numberOrStars = 1;
    self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.size.height / 2;
    [self setupColors];
    [self.starButton addTarget:self action:@selector(starButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setupData {
    self.avatarImageView.image = [UIImage imageNamed:@"avatar_64"];
    self.verifiedImageView.image = [UIImage imageNamed:@"verified-account-50"];
}

- (void)setupColors {
    self.backgroundColor = [ThemeManager backgroundColor];
    self.senderLabel.textColor = [ThemeManager mainTextColor];
    self.avatarImageView.backgroundColor = [ThemeManager mainTextColor];
    self.verifiedImageView.tintColor = [ThemeManager mainTextColor];
    
    self.followersLabel.textColor = [ThemeManager metaTextColor];
    
    self.shareButton.tintColor = [ThemeManager metaTextColor];
    self.shareLabel.textColor = [ThemeManager metaTextColor];
    
    self.commentButton.tintColor = [ThemeManager metaTextColor];
    self.commentsLabel.textColor = [ThemeManager metaTextColor];
    
    self.starButton.tintColor = [ThemeManager highlightTextColor];
    self.starsLabel.textColor = [ThemeManager highlightTextColor];
}

- (void)starButtonTapped:(UIButton *)sender {
    [self performButtonScaleAnimationIfNeeded];
    
    PulseAnimation *pulseCALayer = [[PulseAnimation alloc] initWithPosition:self.starButton.center];
    [self.layer insertSublayer:pulseCALayer below:self.starButton.layer];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, StarButtonAnimationDuration / 2.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [pulseCALayer performAnimation];
    });
    
    FloatingTextAnimation *floatingCALayer = [[FloatingTextAnimation alloc] initWithPosition:self.starButton.center text:[self starsToShowInAnimation] scaleFactor:self.numberOrStars / 10.0];
    [self.layer insertSublayer:floatingCALayer below:self.starButton.layer];
    [floatingCALayer performAnimation];
    
    self.starsLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)self.numberOrStars];
    
    self.numberOrStars ++;
    if (self.numberOrStars == 11) {
        self.numberOrStars = 1;
    }
}

- (NSString *)starsToShowInAnimation {
    return [NSString stringWithFormat:@"+%lu", (unsigned long)self.numberOrStars];
}

- (void)performButtonScaleAnimationIfNeeded {
    BOOL pulseAnimationExist = NO;
    for (CALayer *layer in self.layer.sublayers) {
        if ([layer isKindOfClass:[PulseAnimation class]]) {
            pulseAnimationExist = YES;
        }
    }
    
    if (!pulseAnimationExist) {
        self.numberOrStars = 1;
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.xy"];
            scaleAnimation.keyTimes = @[@(0), @(0.25), @(0.5), @(0.75), @(1)];
            scaleAnimation.values = @[@(1), @(1.25), @(1), @(0.9), @(1)];
            scaleAnimation.duration = StarButtonAnimationDuration;

            dispatch_async(dispatch_get_main_queue(), ^{
                [self.starButton.layer addAnimation:scaleAnimation forKey:@"buttonJump"];
            });
        });

    }
}

@end
