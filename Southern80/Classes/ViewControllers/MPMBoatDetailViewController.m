//
//  MPMBoatDetailViewController.m
//  Southern80
//
//  Created by Matt McInnes on 5/06/14.
//  Copyright (c) 2014 Matt McInnes. All rights reserved.
//

#import "MPMBoatDetailViewController.h"

@interface MPMBoatDetailViewController ()

@end

@implementation MPMBoatDetailViewController {
    UIScrollView *scroll;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//FIX: make for iphone and bring old one across to new project
- (void)viewDidLoad
{
    [super viewDidLoad];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapTest:)];
   // [tap setDelegate:self];
    [self.view addGestureRecognizer:tap];
    
    scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 391, 1024, self.view.frame.size.height)];
	// Do any additional setup after loading the view.
    scroll.pagingEnabled = YES;
    
    NSInteger numberOfViews = 3;
  //  for (int i = 0; i < numberOfViews; i++) {
        CGFloat xOrigin = 0 * 1024;
        UIView *awesomeView = [[UIView alloc] initWithFrame:CGRectMake(xOrigin, 0, 1024, self.view.frame.size.height)];
        awesomeView.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1];
        UILabel *test = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 200, 20)];
        test.text = @"Boat Info Screen";
        [awesomeView addSubview:test];
        [scroll addSubview:awesomeView];
    CGFloat xOrigin2 = 1 * 1024;

        UIView *awesomeView2 = [[UIView alloc] initWithFrame:CGRectMake(xOrigin2, 0, 1024, self.view.frame.size.height)];
        awesomeView2.backgroundColor = [UIColor colorWithRed:0.6 green:0.5 blue:0.5 alpha:1];
    UILabel *test2 = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 200, 20)];
    test2.text = @"Race Info Screen";
    [awesomeView2 addSubview:test2];
        [scroll addSubview:awesomeView2];
    CGFloat xOrigin3 = 2 * 1024;

        UIView *awesomeView3 = [[UIView alloc] initWithFrame:CGRectMake(xOrigin3, 0, 1024, self.view.frame.size.height)];
        awesomeView3.backgroundColor = [UIColor colorWithRed:0.8 green:0.5 blue:0.5 alpha:1];
    UILabel *test23 = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 200, 20)];
    test23.text = @"Team Info Screen";
    [awesomeView3 addSubview:test23];
        [scroll addSubview:awesomeView3];
    
    
        scroll.contentSize = CGSizeMake(1024 * numberOfViews, self.view.frame.size.height);
    
        [self.view addSubview:scroll];

   // }
}
- (IBAction)test:(id)sender {
    //CGPoint offset = scroll.contentOffset;
    //offset.x += 1024;
    //[scroll setContentOffset:offset animated:YES];
 //   [scroll setContentOffset:CGPointMake(1024, 0) animated:TRUE];

}
- (void)tapTest:(UITapGestureRecognizer *)sender {
    NSLog(@"%f %f", [sender locationInView:self.view].x,  [sender locationInView:self.view].y);
}
- (IBAction)showBoatInfo:(id)sender {
    [scroll setContentOffset:CGPointMake(0, 0) animated:TRUE];

}
- (IBAction)showRaceInfo:(id)sender {
    [scroll setContentOffset:CGPointMake(1024, 0) animated:TRUE];

}
- (IBAction)showTeamInfo:(id)sender {
    [scroll setContentOffset:CGPointMake(2048, 0) animated:TRUE];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
