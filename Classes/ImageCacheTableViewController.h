//
//  ImageCacheTableViewController.h
//  DownloadImageCache
//
//  Created by abhishek chatterjee on 30/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HOImageCacheDelegates.h"

@interface ImageCacheTableViewController : UITableViewController <HOImageCacheDelegates>{

	NSMutableArray *mDataSourceArr;
}

@property (nonatomic, retain) NSMutableArray *dataSourceArr;

@end
