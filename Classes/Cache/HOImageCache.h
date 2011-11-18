//
//  DownloadImageCacheAppDelegate.h
//  DownloadImageCache
//
//  Created by abhishek chatterjee on 30/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HOImageCacheDelegates.h"
#import "IconDownloader.h"

@interface HOImageCache : NSObject<HOImageCacheDelegates,IconDownloaderDelegate> {
	
	NSMutableArray *mDownloaderQueue;
}

+ (HOImageCache*)sharedInstance;
- (void)loadImageFromURL:(NSURL *)inFileURL sender:(id<HOImageCacheDelegates>)inSender  context:(void *)inContext;
- (UIImage *)imageForURL:(NSString *)urlString;

@end
