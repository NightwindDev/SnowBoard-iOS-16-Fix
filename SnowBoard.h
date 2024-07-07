#pragma once

/**
 * Copyright (c) 2024 Nightwind. All rights reserved.
 */

@class NSObject;

@interface SnowBoardIconHolder : NSObject
- (UIImage *)imageWithScale:(CGFloat)scale;
@end

@interface SparkSpringBoardThemeHolder : NSObject
@property (nonatomic, strong, readwrite) SnowBoardIconHolder *badgeBackground;
@end

@interface SnowBoardThemeLoader : NSObject
@property (nonatomic, strong, readwrite) SparkSpringBoardThemeHolder *springboardTheme;
+ (instancetype)sharedInstance;
@end
