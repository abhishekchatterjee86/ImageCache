//
//  DownloadImageCacheAppDelegate.h
//  DownloadImageCache
//
//  Created by abhishek chatterjee on 30/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


@protocol HOImageCacheDelegates
-(void)didLoadImage:(UIImage *)inImage contextInfo:(void *)inContext;
@end
