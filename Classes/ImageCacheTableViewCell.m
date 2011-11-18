//
//  ImageCacheTableViewCell.m
//  DownloadImageCache
//
//  Created by abhishek chatterjee on 30/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ImageCacheTableViewCell.h"

@implementation ImageCacheTableViewCell

@synthesize iconImageView = mIconImageView;
@synthesize title = mTitle;
@synthesize subTitle = mSubTitle;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code.
		
		UIImageView *iconImage = [[UIImageView alloc]initWithFrame:CGRectMake(13.0, 4.0, 56.0, 56.0)];
		self.iconImageView = iconImage;
		[self.contentView addSubview:self.iconImageView];
		[iconImage release];
		
		UILabel *titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(69.0, 15.0, 250.0, 22.0)];
		titleLbl.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18];
		titleLbl.textColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0];
		titleLbl.backgroundColor = [UIColor clearColor];
		self.title = titleLbl;
		[self.contentView addSubview:self.title];
		[titleLbl release];
		
		UILabel *subTitleLbl = [[UILabel alloc]initWithFrame:CGRectMake(69.0, 38.0, 240.0, 16.0)];
		subTitleLbl.font = [UIFont fontWithName:@"HelveticaNeue" size:12];
		subTitleLbl.textColor = [UIColor colorWithRed:191.0/255.0 green:191.0/255.0 blue:191.0/255.0 alpha:1.0];
		subTitleLbl.backgroundColor = [UIColor clearColor];
		self.subTitle = subTitleLbl;
		[self.contentView addSubview:self.subTitle];
		[subTitleLbl release];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state.
}


- (void)dealloc {
	self.iconImageView = nil;
	self.title = nil;
	self.subTitle = nil;
    [super dealloc];
}


@end
