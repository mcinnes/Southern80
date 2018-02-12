//
//  MPMSponsorsViewController.h
//  Southern 80
//
//  Created by Matt McInnes on 5/02/14.
//  Copyright (c) 2014 Matt McInnes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFImagePager.h"
#import "Exhibitor.h"
@interface MPMSponsorsViewController : UIViewController <AFImagePagerDelegate, AFImagePagerDataSource>
{
    IBOutlet AFImagePager *_imagePager;
    Exhibitor *exhibitor;
}


@property (nonatomic, assign) int locationInt;
@property (nonatomic, retain) Exhibitor *exhibitor;


@end
