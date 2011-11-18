//
//  ImageCacheTableViewController.m
//  DownloadImageCache
//
//  Created by abhishek chatterjee on 30/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ImageCacheTableViewController.h"
#import "HOImageCache.h"
#import "ImageCacheTableViewCell.h"

@implementation ImageCacheTableViewController
@synthesize dataSourceArr = mDataSourceArr;

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
	
	NSMutableArray *the_datasource = [[NSMutableArray alloc]init];
	self.dataSourceArr = the_datasource;
	[the_datasource release];
	
	//64x64
	/*[self.dataSourceArr addObject:@"http://aux.iconpedia.net/uploads/2033095315.png"];
	[self.dataSourceArr addObject:@"http://upload.wikimedia.org/wikipedia/commons/5/5d/KLatin_icon.png"];
	[self.dataSourceArr addObject:@"http://aux4.iconpedia.net/uploads/726749517316942783.png"];
	[self.dataSourceArr addObject:@"http://files.softicons.com/download/business-icons/e-commerce-icon-set-by-webiconset.com/png/64x64/checkout.png"];
	[self.dataSourceArr addObject:@"http://icons.iconarchive.com/icons/jankoatwarpspeed/handycons-2/64/flickr-icon.png"];
	[self.dataSourceArr addObject:@"http://files.softicons.com/download/system-icons/sinem-icons-by-robsonbillponte/png/64/Picture Icon.png"];
	[self.dataSourceArr addObject:@"http://icons.iconarchive.com/icons/adrian-melsha/morpho-butterfly/64/Morpho-Zephyritis-Male-icon.png"];
	[self.dataSourceArr addObject:@"http://icons-search.com/img/icons-land/IconsLandVistaHardwareDevicesIconsDemo.zip/IconsLandVistaHardwareDevicesIconsDemo-PNG-64x64-PDA2.png-64x64.png"];
	[self.dataSourceArr addObject:@"http://icons.iconarchive.com/icons/jankoatwarpspeed/handycons-2/64/flickr-icon.png"];
	[self.dataSourceArr addObject:@"http://aux.iconpedia.net/uploads/2033095315.png"];
	[self.dataSourceArr addObject:@"http://aux4.iconpedia.net/uploads/726749517316942783.png"];*/
	
	//240x240
	[self.dataSourceArr addObject:@"http://img.informer.com/wiki/mediawiki/images/d/d5/Psn_flow_icon.png"];
	[self.dataSourceArr addObject:@"http://www.eco-rally.org/sites/default/files/category_pictures/electric-battery-icon.png"];
	[self.dataSourceArr addObject:@"http://steveshaw.me/wp-content/uploads/2010/07/timer-icon.png"];
	[self.dataSourceArr addObject:@"http://fc07.deviantart.net/fs71/i/2010/209/0/7/Square_Twitter_PNG_Icons_by_koidesign.png"];
	[self.dataSourceArr addObject:@"https://wiki.ubuntu.com/IceWeaselIcon?action=AttachFile&do=get&target=IceWeasel-KMandla-Revision.png"];
	[self.dataSourceArr addObject:@"http://www.rediflame.com/images/Environment-Icon.png"];
	[self.dataSourceArr addObject:@"http://1.bp.blogspot.com/_DduM5cFCp60/S8_BO80AjHI/AAAAAAAAAAk/KYKzZHeJv_s/S240/plant-icon.png"];
	[self.dataSourceArr addObject:@"http://www.beograund.com/images/product_images/a0446.png"];
	[self.dataSourceArr addObject:@"http://www.freesite-advertising.com/images/519-California-custom-unique-and-personalized-pendant-necklaces-handmade-jewelry-2.jpg"];
	[self.dataSourceArr addObject:@"http://fc04.deviantart.net/fs32/f/2008/188/4/b/Sheep_Dock_Icon_by_squirminator2k.png"];
	[self.dataSourceArr addObject:@"http://media.merchantcircle.com/28042790/1203763613_iTunes_Icon_by_Suggymoto_medium.png"];
	[self.dataSourceArr addObject:@"http://images1.wikia.nocookie.net/__cb20100531052426/gtawiki/images/f/fb/CourierService-GTA4-trophy.PNG"];
	[self.dataSourceArr addObject:@"http://www.divinenewsnetwork.com/images/_vimeo-icon.png"];
	[self.dataSourceArr addObject:@"http://greenemagazine.us/wp-content/uploads/2011/02/mailbox-icon.png"];
	[self.dataSourceArr addObject:@"http://www.iphonelife.com/sites/iphonelife.com/files/Kid-icon.png"];
	[self.dataSourceArr addObject:@"http://fc07.deviantart.net/fs71/i/2010/209/0/7/Square_Twitter_PNG_Icons_by_koidesign.png"];
	[self.dataSourceArr addObject:@"http://images.wikia.com/wweallstars/images/0/0a/Breaking_the_Rules.png"];
	[self.dataSourceArr addObject:@"http://www.rediflame.com/images/Environment-Icon.png"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.dataSourceArr count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {   

	return 64.0f;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    ImageCacheTableViewCell *cell = (ImageCacheTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[ImageCacheTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    HOImageCache *sharedImageCache = [HOImageCache sharedInstance];
	
	NSString *urlString=[self.dataSourceArr objectAtIndex:indexPath.row];
	
	NSDictionary *dictionary = [[NSDictionary  alloc] initWithObjectsAndKeys:indexPath ,@"IndexPath", nil];
	
	urlString =[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	
	UIImage *image = [sharedImageCache imageForURL:urlString];
	
	if(image == nil)
	{
		[sharedImageCache loadImageFromURL:[NSURL URLWithString:urlString] sender:self context:(NSDictionary*)dictionary];
	}
	else
	{
		cell.iconImageView.image = image;
	}
	
	cell.title.text = urlString;
	
	[dictionary release];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    /*
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
    */
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

-(void)didLoadImage:(UIImage *)inImage contextInfo:(void *)inContext
{
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:inContext , @"context",inImage , @"image",nil];
    [self performSelectorOnMainThread:@selector(updateUI:) withObject:dict waitUntilDone:NO];
    [dict release];
}

- (void) updateUI:(NSDictionary *)dict
{
	NSIndexPath *indexPath = [[dict objectForKey:@"context"] objectForKey:@"IndexPath"];
	ImageCacheTableViewCell *tableViewCell = (ImageCacheTableViewCell *)[self.tableView cellForRowAtIndexPath:indexPath];
	tableViewCell.iconImageView.image = [dict objectForKey:@"image"];
	[self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
	
}

@end

