//
//  FriendCollectionViewCell.h
//  StreamApp
//
//  Created by Sergei Prikhodko on 05.05.19.
//  Copyright © 2019 Sergei Prikhodko. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FriendCollectionViewCell : UICollectionViewCell

- (void)showStarAvatarImage:(NSString *)image name:(NSString *)name;

- (void)showDisabledAvatarImage:(NSString *)image name:(NSString *)name;

- (void)showGradientAvatarImage:(NSString *)image name:(NSString *)name badgeValue:(NSInteger)badgeValue;

@end

NS_ASSUME_NONNULL_END
