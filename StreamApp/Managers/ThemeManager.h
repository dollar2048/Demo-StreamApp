//
//  ThemeManager.h
//  StreamApp
//
//  Created by Sergei Prikhodko on 04.05.19.
//  Copyright © 2019 Sergei Prikhodko. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

NS_ASSUME_NONNULL_BEGIN

@interface ThemeManager : NSObject

+ (void)setupAppearances;

+ (UIColor *)backgroundColor;
    
+ (UIColor *)mainTextColor;
        
+ (UIColor *)metaTextColor;

+ (UIColor *)disabledTextColor;

+ (UIColor *)disabledBorderColor;

+ (UIColor *)highlightTextColor;

+ (UIColor *)randomColor;

@end

NS_ASSUME_NONNULL_END
