//
//  MPMTrackerViewController.m
//  Southern 80
//
//  Created by Matt on 21/08/13.
//  Copyright (c) 2013 Matt McInnes. All rights reserved.
//

#import "MPMTrackerViewController.h"
//#import "MPMAnnotation.h"
#define METERS_PER_MILE 1609.344

@interface MPMTrackerViewController ()

@end

@implementation MPMTrackerViewController
@synthesize mapView, boatname;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}




- (void)viewDidLoad
{// Set some coordinates for our position (Buckingham Palace!)
    //Parse stuffs
       
    [self updated];
    timer = [NSTimer scheduledTimerWithTimeInterval:5.0
                                             target:self
                                           selector:@selector(refresh)
                                           userInfo:nil
                                            repeats:YES];
}
-(void)refresh {
    [self updated];
}
-(void)updated {
    self.boatname = boatname;
  /*  PFQuery *query = [PFQuery queryWithClassName:boatname];
    [query whereKey:@"name" equalTo:@"string"];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        if (!object) {
            NSLog(@"nope");
        } else {
            // The find succeeded.
            NSLog(@"Successfully retrieved the object.");
            double longi = [[object objectForKey:@"long"] doubleValue];
            double lati = [[object objectForKey:@"lat"] doubleValue];
            
            
            CLLocationCoordinate2D location;
            
            location.latitude = lati;
            location.longitude =longi;
            
            [mapView removeAnnotations:mapView.annotations];

            // Add the annotation to our map view
            MPMAnnotation *newAnnotation = [[MPMAnnotation alloc] initWithTitle:boatname andCoordinate:location];
            [self.mapView addAnnotation:newAnnotation];
            // 2
            MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(location, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
            
            // 3
            [mapView setRegion:viewRegion animated:YES];
            
            
        }
    }];

*/
}

// When a map annotation point is added, zoom to it (1500 range)
- (void)mapView:(MKMapView *)mv didAddAnnotationViews:(NSArray *)views
{
	MKAnnotationView *annotationView = [views objectAtIndex:0];
	id <MKAnnotation> mp = [annotationView annotation];
	MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([mp coordinate], 1500, 1500);
	[mv setRegion:region animated:YES];
	[mv selectAnnotation:mp animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidDisappear:(BOOL)animated {
    [timer invalidate];
    NSLog(@"timer has stopped updating");
}

@end
