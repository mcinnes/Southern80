//
//  Exhibitor.m
//  Southern80
//
//  Created by Matt McInnes on 23/8/17.
//  Copyright © 2017 Matt McInnes. All rights reserved.
//

#import "Exhibitor.h"

@implementation Exhibitor

@synthesize name,phoneNumber,websiteURL,facebookURL,instagramURL,imageArray,aboutText, address;

-(id) initMessageWithName:(NSString *)Name
              phoneNumber:(NSString *)PhoneNumber
              facebookURL:(NSString *)FacebookURL
             instagramURL:(NSString *)InstagramURL
               websiteURL:(NSString *)WebsiteURL
                aboutText:(NSString *)AboutText
               imageArray:(NSMutableArray *)ImageArray
                  address:(NSString *)Address


{
    self = [super init];
    if(self)
    {
        self.name = Name;
        self.phoneNumber = PhoneNumber;
        self.facebookURL = FacebookURL;
        self.instagramURL = InstagramURL;
        self.websiteURL = WebsiteURL;
        self.aboutText = AboutText;
        self.imageArray = ImageArray;

    }
    
    return self;
}

@end
