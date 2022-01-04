//
//  FriendsCollectionDataSource.m
//  StreamApp
//
//  Created by Sergei Prikhodko on 04.05.19.
//  Copyright © 2019 Sergei Prikhodko. All rights reserved.
//

#import "FriendsCollectionDataSource.h"
#import "FriendCollectionViewCell.h"

@implementation FriendsCollectionDataSource

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    FriendCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FriendCollectionViewCell" forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
     [cell showGradientAvatarImage:@"avatar_49" name:@"Feed" badgeValue:0];
    } else if (indexPath.row == 1) {
        [cell showStarAvatarImage:@"avatar_48" name:@"$1k Contest"];
    } else if (indexPath.row == 2) {
        [cell showGradientAvatarImage:@"avatar_30" name:@"Ninja" badgeValue:3];
    } else if (indexPath.row == 3) {
        [cell showGradientAvatarImage:@"avatar_10" name:@"pokimane" badgeValue:7];
    } else {
        NSString *avatarName = [NSString stringWithFormat:@"avatar_%d", 1 + arc4random_uniform(78)];
        [cell showDisabledAvatarImage:avatarName name:avatarName];
    }
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

@end
