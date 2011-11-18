//
//  DownloadImageCacheAppDelegate.h
//  DownloadImageCache
//
//  Created by abhishek chatterjee on 30/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HOImageCache.h"
#import  "HOImageCacheDelegates.h"

@implementation HOImageCache

static HOImageCache *sharedInstance = nil;

+ (HOImageCache*)sharedInstance
{
    @synchronized(self) {
        if (sharedInstance == nil) {
			sharedInstance= [[self alloc] init]; // assignment not done here
        }
    }
    return sharedInstance;
}

+ (id)allocWithZone:(NSZone *)zone
{
    @synchronized(self) {
        if (sharedInstance == nil) {
            sharedInstance = [super allocWithZone:zone];
            return sharedInstance;  // assignment and return on first allocation
        }
    }
    return nil; //on subsequent allocation attempts return nil
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (id)retain
{
    return self;
}

- (unsigned)retainCount
{
    return UINT_MAX;  //denotes an object that cannot be released
}

- (void)release
{
    //do nothing
}

- (id)autorelease
{
    return self;
}

-(id)init
{
	self = [super init];
	if( self)
	{
		
	}
	return self;	
}

- (void)dealloc {
    [super dealloc];
}

-(void)loadImageFromURL:(NSURL *)inFileURL sender:(id<HOImageCacheDelegates>)inSender  context:(void *)inContext
{
	if( inFileURL)
	{
		if( !mDownloaderQueue)
		{
			mDownloaderQueue = [[NSMutableArray alloc] init];	
		}
		
		IconDownloader *downloader  = [[IconDownloader alloc] init];
		NSURLRequest *request = [NSURLRequest requestWithURL:inFileURL];
		downloader.URLRequest = request;
		downloader.sender=inSender;
		downloader.contextinfo=inContext;
		downloader.delegate =self;
		[downloader startDownload];
		[mDownloaderQueue addObject:downloader];
		[downloader release];
	}
}

#pragma mark IconDownloader Delegate Methods
#pragma mark -

-(void)downloader:(IconDownloader*)sender downloadedImage:(UIImage*)inImage
{
	if( inImage)
	{
		[sender.sender didLoadImage:inImage contextInfo:sender.contextinfo];
		
	}
	
	[mDownloaderQueue removeObject:sender];
}

-(UIImage *)imageForURL:(NSString *)urlString
{
	return [IconDownloader cachedImageForURL:[NSURL URLWithString:urlString]];
}

-(void)didLoadImage:(UIImage *)inImage contextInfo:(void *)inContext{
}

@end
