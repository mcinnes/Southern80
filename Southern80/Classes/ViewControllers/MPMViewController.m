//
//  MPMViewController.m
//  Southern80
//
//  Created by Matt McInnes on 26/05/14.
//  Copyright (c) 2014 Matt McInnes. All rights reserved.
//

#import "MPMViewController.h"
#import "SWRevealViewController.h"
#import "OWMWeatherAPI.h"
@interface MPMViewController () {
    OWMWeatherAPI *_weatherAPI;
    NSArray *_forecast;
    NSDateFormatter *_dateFormatter;
    
    int downloadCount;
    
}

@end

@implementation MPMViewController

@synthesize imagenamejson, png, imagename;

- (void)viewDidLoad
{
    

    
    //// Image Declarations
UIImage* bj = [UIImage imageNamed: @"bj"];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:bj]];
    //UIImage *basearea = [UIImage imageNamed:@"Basearea.png"];
   
  //  weatherView.backgroundColor = [UIColor colorWithPatternImage:basearea];
    
    UIGraphicsBeginImageContext(weatherView.frame.size);
    [[UIImage imageNamed:@"Basearea.png"] drawInRect:weatherView.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    weatherView.backgroundColor = [UIColor colorWithPatternImage:image];
    
    
    // Change button color
    _sidebarButton.tintColor = [UIColor colorWithWhite:0.1f alpha:0.9f];
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    _sidebarButton.target = self.revealViewController;
    _sidebarButton.action = @selector(revealToggle:);
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];

    
    if ([stories count] == 0) {
		NSString * path = @"http://twss.55uk.net/southern80/10";
        
		[self parseXMLFileAtURL:path];
	}
	
	cellSize = CGSizeMake([newsTable bounds].size.width, 60);
    downloadCount = 0;
    
    NSString *dateComponents = @"H:m dd MMM";
    NSString *dateFormat = [NSDateFormatter dateFormatFromTemplate:dateComponents options:0 locale:[NSLocale systemLocale] ];
    _dateFormatter = [[NSDateFormatter alloc] init];
    [_dateFormatter setDateFormat:dateFormat];
    
    
    
    _forecast = @[];
    
    _weatherAPI = [[OWMWeatherAPI alloc] initWithAPIKey:@"fbd6045d4e979779640c901fe2126714"]; // Replace the key with your own
    
    // We want localized strings according to the prefered system language
    [_weatherAPI setLangWithPreferedLanguage];
    
    // We want the temperatures in celcius, you can also get them in farenheit.
    [_weatherAPI setTemperatureFormat:kOWMTempCelcius];
    
    [self.activityIndicator startAnimating];
    
    [_weatherAPI currentWeatherByCityName:@"Echuca" withCallback:^(NSError *error, NSDictionary *result) {
        downloadCount++;
        if (downloadCount > 1) [self.activityIndicator stopAnimating];
        
        if (error) {
            // Handle the error
            return;
        }
        
        NSLog(@"%@", result);
        self.cityName.text = [NSString stringWithFormat:@"%@, %@",
                              result[@"name"],
                              result[@"sys"][@"country"]
                              ];
        imagenamejson = result[@"weather"][0][@"icon"];
        imagenamejson = [imagenamejson stringByAppendingString:@".png"];
        
        self.currentTemp.textColor = [UIColor whiteColor];
        self.currentTemp.text = [NSString stringWithFormat:@"%.1f℃",
                                 [result[@"main"][@"temp"] floatValue] ];
        
        self.currentTimestamp.text =  [_dateFormatter stringFromDate:result[@"dt"]];
        
        self.weather.text = result[@"weather"][0][@"description"];
        NSLog(@"%@", result[@"weather"][0][@"description"]);
        
        NSLog(@"%@", imagenamejson);
        self.weatherImage.image = [UIImage imageNamed:imagenamejson];
        
        
        
        
        [self.activityIndicator hidesWhenStopped];
        [self.activityIndicator stopAnimating];
        //end image load
    }];
    
    //  [_weatherAPI forecastWeatherByCityName:@"Echuca" withCallback:^(NSError *error, NSDictionary *result) {
    //      downloadCount++;
    //      if (downloadCount > 1) [self.activityIndicator stopAnimating];
    
    //     if (error) {
    //         // Handle the error;
    //   return;
    //     }
    //
    //      _forecast = result[@"list"];
    //     [self.forecastTableView reloadData];
    //
    //  }];
    
    //[self.currentTemp setFont:[UIFont fontWithName:@"Helvetica Neue" size:50]];
    
    
    // UIImage *gradientImage44 = [[UIImage imageNamed:@"ipad-menu-bar.png"]
    //                            resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    // [[UINavigationBar appearance] setBackgroundImage:gradientImage44
    //                                    forBarMetrics:UIBarMetricsDefault];
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableview datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // return _forecast.count;
    //return 5;
    return [stories count];
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic
    
    int storyIndex = [indexPath indexAtPosition: [indexPath length] - 1];
    
    NSString * storyLink = [[stories objectAtIndex: storyIndex] objectForKey: @"link"];
    NSLog(@"%@",stories );
    // clean up the link - get rid of spaces, returns, and tabs...
    storyLink = [storyLink stringByReplacingOccurrencesOfString:@" " withString:@""];
    storyLink = [storyLink stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    storyLink = [storyLink stringByReplacingOccurrencesOfString:@"	" withString:@""];
    
    // open in Safari
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:storyLink]];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *MyIdentifier = @"MyIdentifier";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Basearea"]];
        
	}
	
	// Set up the cell
	int storyIndex = [indexPath indexAtPosition: [indexPath length] - 1];
    cell.textLabel.text=[[stories objectAtIndex: storyIndex] objectForKey: @"title"];
	
	return cell;
}




#pragma mark - parseing_Delegate_methods
- (void)parserDidStartDocument:(NSXMLParser *)parser{
	NSLog(@"found file and started parsing");
	// TODO: strip "southern80: " from feed
}

- (void)parseXMLFileAtURL:(NSString *)URL
{
	stories = [[NSMutableArray alloc] init];
	
    //you must then convert the path to a proper NSURL or it won't work
    NSURL *xmlURL = [NSURL URLWithString:URL];
	
    // here, for some reason you have to use NSClassFromString when trying to alloc NSXMLParser, otherwise you will get an object not found error
    // this may be necessary only for the toolchain
    rssParser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
	
    // Set self as the delegate of the parser so that it will receive the parser delegate methods callbacks.
    [rssParser setDelegate:self];
	
    // Depending on the XML document you're parsing, you may want to enable these features of NSXMLParser.
    [rssParser setShouldProcessNamespaces:NO];
    [rssParser setShouldReportNamespacePrefixes:NO];
    [rssParser setShouldResolveExternalEntities:NO];
	
    [rssParser parse];
	
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
	NSString * errorString = [NSString stringWithFormat:@"Unable to download story feed from web site (Error code %i )", [parseError code]];
	NSLog(@"error parsing XML: %@", errorString);
	
	UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"Error loading content" message:errorString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[errorAlert show];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    //NSLog(@"found this element: %@", elementName);
	currentElement = [elementName copy];
	if ([elementName isEqualToString:@"item"]) {
		// clear out our story item caches...
		item = [[NSMutableDictionary alloc] init];
		currentTitle = [[NSMutableString alloc] init];
		currentDate = [[NSMutableString alloc] init];
		currentSummary = [[NSMutableString alloc] init];
		currentLink = [[NSMutableString alloc] init];
	}
	
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
	//NSLog(@"ended element: %@", elementName);
	if ([elementName isEqualToString:@"item"]) {
		// save values to an item, then store that item into the array...
		[item setObject:currentTitle forKey:@"title"];
		[item setObject:currentLink forKey:@"link"];
		[item setObject:currentSummary forKey:@"summary"];
		[item setObject:currentDate forKey:@"date"];
		
		[stories addObject:[item copy]];
		NSLog(@"adding story: %@", currentTitle);
	}
	
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
	//NSLog(@"found characters: %@", string);
	// save the characters for the current item...
	if ([currentElement isEqualToString:@"title"]) {
		[currentTitle appendString:string];
	} else if ([currentElement isEqualToString:@"link"]) {
		[currentLink appendString:string];
	} else if ([currentElement isEqualToString:@"description"]) {
		[currentSummary appendString:string];
	} else if ([currentElement isEqualToString:@"pubDate"]) {
		[currentDate appendString:string];
	}
	
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
	
    //	[activityIndicator stopAnimating];
    //	[activityIndicator removeFromSuperview];
	
	NSLog(@"all done!");
	NSLog(@"stories array has %d items", [stories count]);
	[newsTable reloadData];
}
@end

