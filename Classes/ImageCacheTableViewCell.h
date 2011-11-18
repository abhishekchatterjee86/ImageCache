//
//  ImageCacheTableViewCell.h
//  DownloadImageCache
//
//  Created by abhishek chatterjee on 30/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ImageCacheTableViewCell : UITableViewCell {

	UIImageView *mIconImageView;
	UILabel		*mTitle;
	UILabel		*mSubTitle;
}

@property (nonatomic, retain) UIImageView *iconImageView;
@property (nonatomic, retain) UILabel	  *title;
@property (nonatomic, retain) UILabel	  *subTitle;

@end
