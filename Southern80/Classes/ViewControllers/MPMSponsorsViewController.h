//
//  MPMSponsorsViewController.h
//  Southern 80
//
//  Created by Matt McInnes on 5/02/14.
//  Copyright (c) 2014 Matt McInnes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFImagePager.h"
@interface MPMSponsorsViewController : UIViewController <AFImagePagerDelegate, AFImagePagerDataSource>
{
    IBOutlet AFImagePager *_imagePager;
}


@property (nonatomic, assign) int locationInt;


@end
