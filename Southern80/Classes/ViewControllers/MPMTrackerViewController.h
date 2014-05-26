//
//  MPMTrackerViewController.h
//  Southern 80
//
//  Created by Matt on 21/08/13.
//  Copyright (c) 2013 Matt McInnes. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <Parse/Parse.h>
#import <MapKit/MapKit.h>
@interface MPMTrackerViewController : UIViewController {
    NSString *boatname;
    NSTimer *timer;
    MKMapView *mapView;
    //double *longi;
   // double *lati;
   // CLLocationCoordinate2D *location;

}
@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, retain)  NSString* boatname;

@property (nonatomic, readonly) CLLocationCoordinate2D location;


- (CLLocationCoordinate2D) location;
@end
