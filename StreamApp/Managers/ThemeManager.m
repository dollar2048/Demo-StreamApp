//
//  ThemeManager.m
//  StreamApp
//
//  Created by Sergei Prikhodko on 04.05.19.
//  Copyright © 2019 Sergei Prikhodko. All rights reserved.
//

#import "ThemeManager.h"

@implementation ThemeManager

+ (void)setupAppearances {
    [UITabBar appearance].barTintColor = [ThemeManager backgroundColor];
    [UITabBar appearance].unselectedItemTintColor = [ThemeManager metaTextColor];
    [UITabBar appearance].tintColor = [ThemeManager mainTextColor];
    [UITabBar appearance].backgroundColor = [ThemeManager backgroundColor];
}

+ (UIColor *)backgroundColor {
    return [UIColor colorWithRed:0.09f green:0.14f blue:0.18f alpha:1.0f];
}

+ (UIColor *)mainTextColor {
    return [UIColor colorWithRed:1.00f green:1.00f blue:1.00f alpha:1.0f];
}

+ (UIColor *)metaTextColor {
    return [UIColor colorWithRed:0.74f green:0.76f blue:0.77f alpha:1.0f];
}

+ (UIColor *)disabledTextColor {
    return [UIColor colorWithRed:0.31f green:0.37f blue:0.39f alpha:1.0f];
}

+ (UIColor *)disabledBorderColor {
    return [UIColor colorWithRed:0.17f green:0.22f blue:0.25f alpha:1.0f];
}

+ (UIColor *)highlightTextColor {
    return [UIColor colorWithRed:0.99f green:0.69f blue:0.36f alpha:1.0f];
}

+ (UIColor *)randomColor {
    switch (arc4random_uniform(5)) {
        case 0:
            return [UIColor orangeColor];
        case 1:
            return [UIColor yellowColor];
        case 2:
            return [UIColor cyanColor];
        case 3:
            return [UIColor redColor];
        case 4:
            return [UIColor greenColor];
        default:
            return [UIColor lightGrayColor];
    }
}

@end
