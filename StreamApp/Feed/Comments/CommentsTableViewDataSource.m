//
//  CommentsTableViewDataSource.m
//  StreamApp
//
//  Created by Sergei Prikhodko on 05.05.19.
//  Copyright © 2019 Sergei Prikhodko. All rights reserved.
//

#import "CommentsTableViewDataSource.h"
#import "CommentsTableViewCell.h"
#import "ThemeManager.h"

NSString *const CUserNameKey = @"CUserNameKey";
NSString *const CCommentKey = @"CCommentKey";

@interface CommentsTableViewDataSource ()
@property (strong, nonatomic) NSArray <NSDictionary*> *comments;
@end

@implementation CommentsTableViewDataSource

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self mockComments];
    }
    return self;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CommentsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommentTableViewCell" forIndexPath:indexPath];
    [cell showUserName:self.comments[indexPath.row][CUserNameKey] comment:self.comments[indexPath.row][CCommentKey]];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.comments.count;
}

#pragma mark - Private

- (void)mockComments {
    NSMutableAttributedString *comment1 = [NSMutableAttributedString new];
    [comment1 appendAttributedString:[[NSAttributedString alloc] initWithString:@"just liked this"]];
    [comment1 appendAttributedString:[[NSAttributedString alloc] initWithString:@" 100" attributes:@{NSForegroundColorAttributeName: [ThemeManager highlightTextColor], NSFontAttributeName: [UIFont boldSystemFontOfSize:14.0]}]];
    [comment1 appendAttributedString:[[NSAttributedString alloc] initWithString:@" times!"]];
    
    NSAttributedString *comment2 = [[NSAttributedString alloc] initWithString:@"🔥🔥🔥🔥"];
    NSAttributedString *comment3 = [[NSAttributedString alloc] initWithString:@"how do you even do that? 🍎⚔️🍎"];
    NSAttributedString *comment4 = [[NSAttributedString alloc] initWithString:@"im gon try that!! 🤩🤩🤩"];
    NSAttributedString *comment5 = [[NSAttributedString alloc] initWithString:@"one more awesome comment"];
    NSAttributedString *comment6 = [[NSAttributedString alloc] initWithString:@"I'm loving it 😘😘😘"];
    NSAttributedString *comment7= [[NSAttributedString alloc] initWithString:@"Wow! you see me 😎"];
    
    self.comments = @[@{CUserNameKey: @"drg5", CCommentKey: comment1},
                      @{CUserNameKey: @"ninja", CCommentKey: comment2},
                      @{CUserNameKey: @"yuierooo", CCommentKey: comment3},
                      @{CUserNameKey: @"picachU", CCommentKey: comment4},
                      @{CUserNameKey: @"superhero", CCommentKey: comment5},
                      @{CUserNameKey: @"telepuzik", CCommentKey: comment6},
                      @{CUserNameKey: @"dollar2048", CCommentKey: comment7}
                      ];
}

@end
