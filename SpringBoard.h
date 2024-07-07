#pragma once

/**
 * Copyright (c) 2024 Nightwind. All rights reserved.
 */

@class NSObject, UIImageView;

@interface SBLibraryViewController : UIViewController
@end

@interface SBIconController : NSObject
- (SBLibraryViewController *)libraryViewController __attribute__((availability(ios, introduced=14.0, obsoleted=16.0)));
- (SBLibraryViewController *)overlayLibraryViewController API_AVAILABLE(ios(16));
@end

@interface SBIconBadgeView : UIView
@property (nonatomic, strong) UIImageView *_sb16fix_badgeBackgroundView; // NEW
@end
