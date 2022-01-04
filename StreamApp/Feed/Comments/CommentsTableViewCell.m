//
//  CommentsTableViewCell.m
//  StreamApp
//
//  Created by Sergei Prikhodko on 05.05.19.
//  Copyright © 2019 Sergei Prikhodko. All rights reserved.
//

#import "CommentsTableViewCell.h"
#import "ThemeManager.h"

@interface CommentsTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;

@end

@implementation CommentsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupColors];
}

- (void)showUserName:(NSString *)userName comment:(NSAttributedString *)comment {
    self.nameLabel.text = userName;
    
    NSDictionary *strokeTextAttributes = @{NSStrokeColorAttributeName: [UIColor blackColor],
                                           NSStrokeWidthAttributeName : @(-1)};
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithAttributedString:comment];
    [attrStr addAttributes:strokeTextAttributes range:NSMakeRange(0, attrStr.length)];
    
    self.commentLabel.attributedText = attrStr;
}

- (void)setupColors {
    self.backgroundColor = [UIColor clearColor];
    self.nameLabel.textColor = [ThemeManager mainTextColor];
    self.commentLabel.textColor = [ThemeManager metaTextColor];
}

@end
