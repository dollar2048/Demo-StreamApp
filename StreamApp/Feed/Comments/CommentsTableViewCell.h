//
//  CommentsTableViewCell.h
//  StreamApp
//
//  Created by Sergei Prikhodko on 05.05.19.
//  Copyright © 2019 Sergei Prikhodko. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CommentsTableViewCell : UITableViewCell

- (void)showUserName:(NSString *)userName comment:(NSAttributedString *)comment;

@end

NS_ASSUME_NONNULL_END
