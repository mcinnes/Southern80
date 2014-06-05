//
//  MPMLocationsViewController.h
//  Southern 80
//
//  Created by Matt McInnes on 4/02/14.
//  Copyright (c) 2014 Matt McInnes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MPMLocationsViewController : UIViewController <MKMapViewDelegate>
@property (nonatomic, assign) int locationInt;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
- (IBAction)showPopover:(id)sender;

@property (strong, nonatomic) UIPopoverController *filterPopoverController;
@end
