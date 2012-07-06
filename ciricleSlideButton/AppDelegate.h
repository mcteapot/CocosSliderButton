//
//  AppDelegate.h
//  ciricleSlideButton
//
//  Created by arjun prakash on 7/5/12.
//  Copyright CyborgDino 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
