//
//  VideoOverView.m
//  StreamApp
//
//  Created by Sergei Prikhodko on 04.05.19.
//  Copyright © 2019 Sergei Prikhodko. All rights reserved.
//

#import "VideoOverView.h"
#import "ThemeManager.h"

@interface VideoOverView ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitle2Label;
@property (weak, nonatomic) IBOutlet UIImageView *chevronImageView;
@end

@implementation VideoOverView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupColors];
}

- (void)setupData {
    self.titleLabel.text = @"#12 in Today's Top Clip Contest";
    self.subtitleLabel.text = @"$1k Prize Pool";
    self.subtitle2Label.text = @"3h 45m 32s  1,029 Entries";
}

- (void)setupColors {
    self.backgroundColor = [[ThemeManager disabledBorderColor] colorWithAlphaComponent:0.9];
    self.titleLabel.textColor = [ThemeManager mainTextColor];
    self.subtitleLabel.textColor = [ThemeManager highlightTextColor];
    self.subtitle2Label.textColor = [ThemeManager mainTextColor];
    self.chevronImageView.tintColor = [ThemeManager metaTextColor];
}

@end
