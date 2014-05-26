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
    
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];

    NSString *path = [[NSBundle mainBundle] pathForResource:@"Sponsors" ofType:@"plist"];
    
    // Load the file content and read the data into arrays
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    imageArray = [dict objectForKey:@"Image"];
    nameArray = [dict objectForKey:@"Name"];
    phoneNumberArray = [dict objectForKey:@"PhoneNumber"];
    addressArray = [dict objectForKey:@"Address"];
    textViewArray = [dict objectForKey:@"TextView"];
    websiteArray = [dict objectForKey:@"Website"];

    locationInt = 1;
    

    [imageView setImage:[UIImage imageNamed:[imageArray objectAtIndex:locationInt]]];
    [textView loadHTMLString:[textViewArray objectAtIndex:locationInt] baseURL:nil];
    [self setTitle:[nameArray objectAtIndex:locationInt]];
    [phoneNumberButton setTitle:[phoneNumberArray objectAtIndex:locationInt] forState:UIControlStateNormal];
    [addressButton setTitle:[addressArray objectAtIndex:locationInt] forState:UIControlStateNormal];
    [emailButton setTitle:[websiteArray objectAtIndex:locationInt] forState:UIControlStateNormal];


	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
