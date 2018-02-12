//
//  Exhibitor.h
//  Southern80
//
//  Created by Matt McInnes on 23/8/17.
//  Copyright © 2017 Matt McInnes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Exhibitor : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *phoneNumber;
@property (strong, nonatomic) NSString *facebookURL;
@property (strong, nonatomic) NSString *instagramURL;
@property (strong, nonatomic) NSString *websiteURL;
@property (strong, nonatomic) NSString *aboutText;
@property (strong, nonatomic) NSString *address;


@property (strong, nonatomic) NSMutableArray *imageArray;

-(id) initMessageWithName:(NSString *)Name
                  phoneNumber:(NSString *)PhoneNumber
                     facebookURL:(NSString *)FacebookURL
                     instagramURL:(NSString *)InstagramURL
                   websiteURL:(NSString *)WebsiteURL
                aboutText:(NSString *)AboutText
                    imageArray:(NSMutableArray *)ImageArray
                  address:(NSString *)Address;
@end
