//
//  MPMBoatData.h
//  Southern80
//
//  Created by Matt McInnes on 5/06/14.
//  Copyright (c) 2014 Matt McInnes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MPMBoatData : NSObject

@property (nonatomic, copy) NSString* about;

@property (nonatomic, retain) UIImage* pic1;
@property (nonatomic, retain) UIImage* pic2;
@property (nonatomic, retain) UIImage* pic3;
@property (nonatomic, retain) UIImage* pic4;

@property (nonatomic, retain) UIImage* driverImage;
@property (nonatomic, retain) UIImage* observerImage;
@property (nonatomic, retain) UIImage* skier1Image;
@property (nonatomic, retain) UIImage* skier2Image;

@property (nonatomic, copy) NSString* boatName;

@property (nonatomic, copy) NSString* driverName;
@property (nonatomic, copy) NSString* observerName;
@property (nonatomic, copy) NSString* skier1Name;
@property (nonatomic, copy) NSString* skier2Name;

@property (nonatomic, copy) NSString* engine;
@property (nonatomic, copy) NSString* hullType;
@property (nonatomic, copy) NSString* boatNumber;


@property (nonatomic, copy) NSString* previousResult;
@property (nonatomic, copy) NSString* startTime;


-(id)initWithName:(NSString *)theName andPic1:(UIImage*)thepic1 andPic2:(UIImage*)thepic2 andPic3:(UIImage*)thepic3 andPic4:(UIImage*)thepic4 andDriver:(UIImage*)thedriver andObserver:(UIImage*)theobserver andSkier1:(UIImage*)theskier1 andSkier2:(UIImage*)theskier2 andDrivername:(NSString*)thedrivername andObservername:(NSString*)theobservername andSkier1name:(NSString*)theskier1name andSkier2name:(NSString*)theskier2name andAbout:(NSString*)theabout andEngine:(NSString*)engineSize andHull:(NSString*)thehullType andBoatNumber:(NSString*)theboatNumber andStartTime:(NSString*)thestartTime andPreviousResult:(NSString *)thePreviousResult;
@end
