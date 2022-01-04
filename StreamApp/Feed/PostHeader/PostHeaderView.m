//
//  PostHeaderView.m
//  StreamApp
//
//  Created by Sergei Prikhodko on 04.05.19.
//  Copyright © 2019 Sergei Prikhodko. All rights reserved.
//

#import "PostHeaderView.h"
#import "ThemeManager.h"

@interface PostHeaderView ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *viewsLabel;
@property (weak, nonatomic) IBOutlet UIButton *starButton;
@property (weak, nonatomic) IBOutlet UIButton *menuButton;

@end

@implementation PostHeaderView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.starButton.layer.cornerRadius = 5.0;
    [self setupColors];
}

- (void)setupData {
    self.titleLabel.text = @"NYC was fun but I'm back!";
    
    NSMutableAttributedString *attributedString = [NSMutableAttributedString new];
    
    [attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:@"32.1k views" attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12.0]}]];
    
    [attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:@"  Jinjuh" attributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:12.0]}]];
    
    [attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:@" clipped 5h ago" attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12.0]}]];

    self.viewsLabel.attributedText = attributedString;
}

- (void)setupColors {
    self.backgroundColor = [ThemeManager backgroundColor];
    self.titleLabel.textColor = [ThemeManager mainTextColor];
    self.viewsLabel.textColor = [ThemeManager metaTextColor];
    
    [self.starButton setTitleColor:[ThemeManager highlightTextColor] forState:UIControlStateNormal];
    self.menuButton.tintColor = [ThemeManager metaTextColor];
}


@end
