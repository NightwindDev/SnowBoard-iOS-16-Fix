/**
 * Copyright (c) 2024 Nightwind. All rights reserved.
 */

#import <UIKit/UIKit.h>
#import "SpringBoard.h"
#import "SnowBoard.h"

/* Fix Badges */

%hook SBIconBadgeView
%property (nonatomic, strong) UIImageView *_sb16fix_badgeBackgroundView;

- (void)didMoveToSuperview {
	%orig;

	// Get image which contains background and text
	UIImageView *const backgroundView = [self safeValueForKey:@"_backgroundView"];
	if (!backgroundView) return;

	// SnowBoard badge image
	UIImage *const image = [[[[%c(SnowBoardThemeLoader) sharedInstance] springboardTheme] badgeBackground] imageWithScale:[[UIScreen mainScreen] scale]];
	if (!image) return;

	// Only add image once
	if ([backgroundView.subviews containsObject:self._sb16fix_badgeBackgroundView]) return;

	// Make image view
	self._sb16fix_badgeBackgroundView = [[UIImageView alloc] initWithImage:image];
	self._sb16fix_badgeBackgroundView.translatesAutoresizingMaskIntoConstraints = NO;
	// self._sb16fix_badgeBackgroundView.frame = CGRectMake(0, 0, 40, 40);
	[backgroundView insertSubview:self._sb16fix_badgeBackgroundView atIndex:0];

	// Activate constraints
	[NSLayoutConstraint activateConstraints:@[
		[self._sb16fix_badgeBackgroundView.widthAnchor constraintEqualToAnchor:backgroundView.widthAnchor],
		[self._sb16fix_badgeBackgroundView.heightAnchor constraintEqualToAnchor:backgroundView.heightAnchor],
		[self._sb16fix_badgeBackgroundView.centerXAnchor constraintEqualToAnchor:backgroundView.centerXAnchor],
		[self._sb16fix_badgeBackgroundView.centerYAnchor constraintEqualToAnchor:backgroundView.centerYAnchor]
	]];
}

+ (UIColor *)badgeBackgroundColor {
	return [UIColor clearColor];
}

%end

/* Crash Fix */

%hook SBIconController

%new
- (SBLibraryViewController *)libraryViewController {
	return [self overlayLibraryViewController];
}

%end