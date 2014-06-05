//
//  MPMLocationsViewController.m
//  Southern 80
//
//  Created by Matt McInnes on 4/02/14.
//  Copyright (c) 2014 Matt McInnes. All rights reserved.
//

#import "MPMLocationsViewController.h"
#import "JPSThumbnailAnnotation.h"
#import "SWRevealViewController.h"
//#import "MPMSponsorsViewController.h"

@interface MPMLocationsViewController ()

@end

@implementation MPMLocationsViewController
@synthesize locationInt;

- (void)viewDidLoad {
    [super viewDidLoad];
    // TODO: popoverviewcontroller for toggling items on or off
    // Map View
    MKMapView *mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    mapView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    mapView.delegate = self;
    [self.view addSubview:mapView];
  //  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
   // if (![defaults objectForKey:@"Username"]) {
        [mapView addAnnotations:[self generateAnnotations]];

    //} else {
        [mapView addAnnotations:[self generateRaceLocations]];
  //  }
    // Annotations
    //[mapView addAnnotations:[self generateAnnotations]];
    

    
    // Change button color
    _sidebarButton.tintColor = [UIColor colorWithWhite:0.1f alpha:0.9f];
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    _sidebarButton.target = self.revealViewController;
    _sidebarButton.action = @selector(revealToggle:);
}
-(NSArray *)generateRaceLocations {
    NSMutableArray *raceAnnotations = [[NSMutableArray alloc] initWithCapacity:3];
    // Empire State Building
    JPSThumbnail *empire = [[JPSThumbnail alloc] init];
    empire.image = [UIImage imageNamed:@"MWSC.png"];
    empire.title = @"Moama Watersports Club";
    empire.subtitle = @"Home of the Southern 80";
    empire.coordinate = CLLocationCoordinate2DMake(-36.134945, 144.753021);
    empire.disclosureBlock = ^{ locationInt = 0; [self performSegueWithIdentifier:@"sponsor" sender:self];
    };
    
    [raceAnnotations addObject:[[JPSThumbnailAnnotation alloc] initWithThumbnail:empire]];
    
    // Apple HQ
    JPSThumbnail *apple = [[JPSThumbnail alloc] init];
    apple.image = [UIImage imageNamed:@"ramp.png"];
    apple.title = @"Ramp 3";
    apple.subtitle = @"Vic side - Headworks";
    apple.coordinate = CLLocationCoordinate2DMake(-35.9954605102539, 144.521850585938);
    apple.disclosureBlock = ^{  };
    
    [raceAnnotations addObject:[[JPSThumbnailAnnotation alloc] initWithThumbnail:apple]];
    return raceAnnotations;
}
- (NSArray *)generateAnnotations {
    NSMutableArray *annotations = [[NSMutableArray alloc] initWithCapacity:6];
    
    
    // Parliament of Canada
    JPSThumbnail *ottawa = [[JPSThumbnail alloc] init];
    ottawa.image = [UIImage imageNamed:@"ramp.png"];
    ottawa.title = @"Ramp 7";
    ottawa.subtitle = @"NSW side - Pericoota Waters - Private Boat Ramp";
    ottawa.coordinate = CLLocationCoordinate2DMake(-36.0517766051342, 144.653252708266);
    ottawa.disclosureBlock = ^{ NSLog(@"selected r7"); };
    
    [annotations addObject:[[JPSThumbnailAnnotation alloc] initWithThumbnail:ottawa]];
    
    JPSThumbnail *ramp13 = [[JPSThumbnail alloc] init];
    ramp13.image = [UIImage imageNamed:@"ramp.png"];
    ramp13.title = @"Ramp 13";
    ramp13.subtitle = @"NSW side - Cadell Motel - Private Boat Ramp";
    ramp13.coordinate = CLLocationCoordinate2DMake(-36.0890121459961, 144.72297668457);
    ramp13.disclosureBlock = ^{ NSLog(@"selected r7"); };
    
    [annotations addObject:[[JPSThumbnailAnnotation alloc] initWithThumbnail:ramp13]];
    
    JPSThumbnail *ramp6 = [[JPSThumbnail alloc] init];
    ramp6.image = [UIImage imageNamed:@"ramp.png"];
    ramp6.title = @"Ramp 16";
    ramp6.subtitle = @"Vic side - Wills bend";
    ramp6.coordinate = CLLocationCoordinate2DMake(-36.048033, 144.633115);
    ramp6.disclosureBlock = ^{ NSLog(@"selected r7"); };
    
    [annotations addObject:[[JPSThumbnailAnnotation alloc] initWithThumbnail:ramp6]];
    
    JPSThumbnail *BeechworthBakery = [[JPSThumbnail alloc] init];
    BeechworthBakery.image = [UIImage imageNamed:@"beechworthbakery.png"];
    BeechworthBakery.title = @"Beechworth Bakery";
    BeechworthBakery.subtitle = @"Southern 80 Sponsor";
    BeechworthBakery.coordinate = CLLocationCoordinate2DMake(-36.123867, 144.746425);
    BeechworthBakery.disclosureBlock = ^{ locationInt = 1; [self performSegueWithIdentifier:@"sponsor" sender:self]; };
    
    [annotations addObject:[[JPSThumbnailAnnotation alloc] initWithThumbnail:BeechworthBakery]];


    
    return annotations;
}

#pragma mark - MKMapViewDelegate

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    if ([view conformsToProtocol:@protocol(JPSThumbnailAnnotationViewProtocol)]) {
        [((NSObject<JPSThumbnailAnnotationViewProtocol> *)view) didSelectAnnotationViewInMap:mapView];
    }
}

- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view {
    if ([view conformsToProtocol:@protocol(JPSThumbnailAnnotationViewProtocol)]) {
        [((NSObject<JPSThumbnailAnnotationViewProtocol> *)view) didDeselectAnnotationViewInMap:mapView];
    }
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    if ([annotation conformsToProtocol:@protocol(JPSThumbnailAnnotationProtocol)]) {
        return [((NSObject<JPSThumbnailAnnotationProtocol> *)annotation) annotationViewInMap:mapView];
    }
    return nil;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  //  MPMSponsorsViewController* sponsors = segue.destinationViewController;
    
  //  sponsors.locationInt = locationInt;
    
    
}
- (IBAction)showPopover:(id)sender {
    {
        if (_filterPopoverController == nil){
            [self performSegueWithIdentifier:@"segueToFilterPopoverView" sender:self];
        }else
            [_filterPopoverController dismissPopoverAnimated:YES];
        _filterPopoverController = nil;
    }
}

@end
