//
//  ViewController.m
//  StreamApp
//
//  Created by Sergei Prikhodko on 04.05.19.
//  Copyright © 2019 Sergei Prikhodko. All rights reserved.
//

#import "FeedViewController.h"
#import "ThemeManager.h"
#import "FriendsCollectionDataSource.h"
#import "CommentsTableViewDataSource.h"
#import "PostHeaderView.h"
#import "VideoOverView.h"
#import "SenderFooterView.h"

@interface FeedViewController ()
@property (weak, nonatomic) IBOutlet PostHeaderView *postHeaderView;
@property (weak, nonatomic) IBOutlet VideoOverView *videoOverView;
@property (weak, nonatomic) IBOutlet SenderFooterView *senderFooterView;
@property (weak, nonatomic) IBOutlet UICollectionView *friendsCollectionView;
@property (strong, nonatomic) FriendsCollectionDataSource *friendsCollectionDataSource;
@property (weak, nonatomic) IBOutlet UITableView *commentsTableView;
@property (strong, nonatomic) CommentsTableViewDataSource *commentsTableViewDataSource;
@property (weak, nonatomic) IBOutlet UIView *gradientView;

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [ThemeManager backgroundColor];
    
    self.friendsCollectionView.backgroundColor = [ThemeManager backgroundColor];
    self.friendsCollectionDataSource = [FriendsCollectionDataSource new];
    self.friendsCollectionView.dataSource = self.friendsCollectionDataSource;
    
    self.commentsTableView.backgroundColor = [ThemeManager backgroundColor];
    self.commentsTableViewDataSource = [CommentsTableViewDataSource new];
    self.commentsTableView.dataSource = self.commentsTableViewDataSource;
    self.commentsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.commentsTableView.allowsSelection = NO;
    self.commentsTableView.contentInset = UIEdgeInsetsMake(12, 0, 12, 0);
    
    [self addBadgeToSecondTab];
    
    [self addShadow];

    [self setupData];
}

- (void)setupData {
    [self.postHeaderView setupData];
    [self.videoOverView setupData];
    [self.senderFooterView setupData];
    [self.commentsTableView reloadData];
    [self.friendsCollectionView reloadData];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)addBadgeToSecondTab {
    // shold be done in tabBarViewController class
    UITabBarItem *tabBarItem = self.tabBarController.tabBar.items[2];
    tabBarItem.badgeValue = @"●"; // should be smaller
    tabBarItem.badgeColor = [UIColor clearColor];
    [tabBarItem setBadgeTextAttributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:0.96f green:0.34f blue:0.28f alpha:1.0f]} forState:UIControlStateNormal];
}

- (void)addShadow {
    CAGradientLayer *gradientCircleLayer =  [[CAGradientLayer alloc] init];
    CGRect gradientFrame = self.gradientView.bounds;
    gradientCircleLayer.frame = gradientFrame;
    
    gradientCircleLayer.startPoint = CGPointMake(0.0, 0.0);
    gradientCircleLayer.endPoint = CGPointMake(0.0, 1.0);
    gradientCircleLayer.colors = @[(id)[UIColor clearColor].CGColor, (id)[UIColor whiteColor].CGColor];
    self.gradientView.backgroundColor = [UIColor clearColor];
    self.gradientView.layer.mask = gradientCircleLayer;
    
    self.gradientView.backgroundColor = [ThemeManager backgroundColor];
}

@end
