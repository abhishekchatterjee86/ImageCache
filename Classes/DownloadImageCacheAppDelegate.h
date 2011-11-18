//
//  DownloadImageCacheAppDelegate.h
//  DownloadImageCache
//
//  Created by abhishek chatterjee on 30/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DownloadImageCacheAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UINavigationController *mNavController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navController;

@end

