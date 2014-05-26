//
//  MPMViewController.h
//  Southern80
//
//  Created by Matt McInnes on 26/05/14.
//  Copyright (c) 2014 Matt McInnes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MPMViewController : UIViewController <UITableViewDataSource, NSXMLParserDelegate> {
	
	IBOutlet UITableView * newsTable;
    
	CGSize cellSize;
	
	NSXMLParser * rssParser;
	
	NSMutableArray * stories;
	
	
	// a temporary item; added to the "stories" array one at a time, and cleared for the next one
	NSMutableDictionary * item;
	
	// it parses through the document, from top to bottom...
	// we collect and cache each sub-element value, and then save each item to our array.
	// we use these to track each current item, until it's ready to be added to the "stories" array
	NSString * currentElement;
	NSMutableString * currentTitle, * currentDate, * currentSummary, * currentLink;
}
- (void)parseXMLFileAtURL:(NSString *)URL;


@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UILabel *cityName;
@property (weak, nonatomic) IBOutlet UILabel *currentTemp;
@property (weak, nonatomic) IBOutlet UITableView *forecastTableView;
@property (weak, nonatomic) IBOutlet UILabel *currentTimestamp;
@property (weak, nonatomic) IBOutlet UILabel *weather;
@property (strong, nonatomic) IBOutlet UIImageView *weatherImage;
@property (nonatomic) NSString *imagenamejson;
@property (nonatomic) NSString *png;
@property (nonatomic) NSString *imagename;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@end
