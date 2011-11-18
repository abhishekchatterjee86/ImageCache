/*
     File: IconDownloader.m 
 Abstract: Helper object for managing the downloading of a particular app's icon.
 As a delegate "NSURLConnectionDelegate" is downloads the app icon in the background if it does not
 yet exist and works in conjunction with the RootViewController to manage which apps need their icon.
 
 A simple BOOL tracks whether or not a download is already in progress to avoid redundant requests.
  
  
 Copyright (C) 2009 Apple Inc. All Rights Reserved. 
  
 */

#import "IconDownloader.h"
#import "CachedImageLoader.h"

#define kAppIconHeight 120

@interface IconDownloader (private)

-(UIImage *)resizeImage:(UIImage *)image width:(int)width height:(int)height;

@end


@implementation IconDownloader(private)

-(UIImage *)resizeImage:(UIImage *)image width:(int)width height:(int)height {
	
	CGImageRef imageRef = [image CGImage];
	CGImageAlphaInfo alphaInfo = CGImageGetAlphaInfo(imageRef);
	
	if (alphaInfo == kCGImageAlphaNone)
		alphaInfo = kCGImageAlphaNoneSkipLast;
	
	CGContextRef bitmap = CGBitmapContextCreate(NULL, width, height, CGImageGetBitsPerComponent(imageRef), 4 * width, CGImageGetColorSpace(imageRef), alphaInfo);
	CGContextDrawImage(bitmap, CGRectMake(0, 0, width, height), imageRef);
	CGImageRef ref = CGBitmapContextCreateImage(bitmap);
	UIImage *result = [UIImage imageWithCGImage:ref];
	
	CGContextRelease(bitmap);
	CGImageRelease(ref);
	
	return result;	
}

@end

@implementation IconDownloader


@synthesize indexPathInTableView;
@synthesize delegate;
@synthesize URLRequest = mURLRequest;
@synthesize sender = mSender;
@synthesize contextinfo = mContextInfo;
#pragma mark

- (void)dealloc
{
	self. contextinfo=nil;
	self.sender=nil;
	self.URLRequest = nil;
    [super dealloc];
}

- (void)startDownload
{
	[[CachedImageLoader sharedImageLoader]addClientToDownloadQueue:self];
}

-(NSURLRequest*)request
{
	NSURLRequest *request = self.URLRequest;
	return request;
}
#pragma mark -
#pragma mark Download support (NSURLConnectionDelegate)
-(void)renderImage:(UIImage *)image
{

	[self.delegate downloader:self downloadedImage:image];
	
}


+(UIImage*)cachedImageForURL:(NSURL*)inURL
{
  	return [[CachedImageLoader sharedImageLoader]cachedImageForURL:inURL];
}
@end

