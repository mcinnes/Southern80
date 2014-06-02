//
//  MPMSponsorsViewController.m
//  Southern 80
//
//  Created by Matt McInnes on 5/02/14.
//  Copyright (c) 2014 Matt McInnes. All rights reserved.
//

#import "MPMSponsorsViewController.h"
#import "SWRevealViewController.h"
@interface MPMSponsorsViewController ()

@end

@implementation MPMSponsorsViewController {
    NSArray *imageArray;
    NSArray *imageArray2;
    NSArray *imageArray3;
    NSArray *nameArray;
    NSArray *phoneNumberArray;
    NSArray *addressArray;
    NSArray *textViewArray;
    NSArray *websiteArray;
    IBOutlet UIImageView *imageView;
    IBOutlet UIWebView *textView;
    IBOutlet UIButton *phoneNumberButton;
    IBOutlet UIButton *emailButton;
    IBOutlet UIButton *addressButton;
    
}
@synthesize locationInt;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Change button color
    UIBarButtonItem *sidebarButton = [UIBarButtonItem alloc];
    self.navigationItem.leftBarButtonItem = sidebarButton;
    sidebarButton.title = @"Menu";
    sidebarButton.tintColor = [UIColor colorWithWhite:0.1f alpha:0.9f];
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    sidebarButton.target = self.revealViewController;
    sidebarButton.action = @selector(revealToggle:);

    // Change button color
    locationInt = 0;
    
    _imagePager.pageControl.currentPageIndicatorTintColor = [UIColor lightGrayColor];
    _imagePager.pageControl.pageIndicatorTintColor = [UIColor blackColor];
    
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    [_imagePager addGestureRecognizer:pinchGesture];
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];

    NSString *path = [[NSBundle mainBundle] pathForResource:@"Sponsors" ofType:@"plist"];
    
    // Load the file content and read the data into arrays
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    imageArray = [dict objectForKey:@"Image1"];
    imageArray2 = [dict objectForKey:@"Image2"];
    imageArray3 = [dict objectForKey:@"Image3"];
    nameArray = [dict objectForKey:@"Name"];
    phoneNumberArray = [dict objectForKey:@"PhoneNumber"];
    addressArray = [dict objectForKey:@"Address"];
    textViewArray = [dict objectForKey:@"TextView"];
    websiteArray = [dict objectForKey:@"Website"];

    locationInt = 1;
    

   // [imageView setImage:[UIImage imageNamed:[imageArray objectAtIndex:locationInt]]];
    [textView loadHTMLString:[textViewArray objectAtIndex:locationInt] baseURL:nil];
    [self setTitle:[nameArray objectAtIndex:locationInt]];
    [phoneNumberButton setTitle:[phoneNumberArray objectAtIndex:locationInt] forState:UIControlStateNormal];
    [addressButton setTitle:[addressArray objectAtIndex:locationInt] forState:UIControlStateNormal];
    [emailButton setTitle:[websiteArray objectAtIndex:locationInt] forState:UIControlStateNormal];


	// Do any additional setup after loading the view.
}
- (NSArray *) arrayWithImageUrlStrings
{
    NSLog(@"lel");
    return [NSArray arrayWithObjects:
           [imageArray objectAtIndex:locationInt],
            nil];
}

- (UIViewContentMode) contentModeForImage:(NSUInteger)image
{
    return UIViewContentModeScaleAspectFill;
}

-(void)handlePinch:(UIPinchGestureRecognizer*)sender {
    
  
   
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
