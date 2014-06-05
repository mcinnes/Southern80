//
//  MPMBoatData.m
//  Southern80
//
//  Created by Matt McInnes on 5/06/14.
//  Copyright (c) 2014 Matt McInnes. All rights reserved.
//

#import "MPMBoatData.h"

@implementation MPMBoatData
@synthesize about, boatName, boatNumber, driverImage, driverName, observerImage, observerName, skier1Image, skier1Name, skier2Image, skier2Name, engine, hullType, startTime, previousResult, pic1,pic2,pic3,pic4;


-(id)initWithName:(NSString *)theName andPic1:(UIImage*)thepic1 andPic2:(UIImage*)thepic2 andPic3:(UIImage*)thepic3 andPic4:(UIImage*)thepic4 andDriver:(UIImage*)thedriver andObserver:(UIImage*)theobserver andSkier1:(UIImage*)theskier1 andSkier2:(UIImage*)theskier2 andDrivername:(NSString*)thedrivername andObservername:(NSString*)theobservername andSkier1name:(NSString*)theskier1name andSkier2name:(NSString*)theskier2name andAbout:(NSString*)theabout andEngine:(NSString*)engineSize andHull:(NSString*)thehullType andBoatNumber:(NSString*)theboatNumber andStartTime:(NSString*)thestartTime andPreviousResult:(NSString *)thePreviousResult;

{
    self = [super init];
    
    if(self)
    {
        self.about= theabout;
        self.pic1 = thepic1;
        self.pic2 = thepic2;
        self.pic3 = thepic3;
        self.pic4 = thepic4;
        self.driverImage = thedriver;
        self.driverName = thedrivername;
        self.observerImage = theobserver;
        self.observerName = theobservername;
        self.skier1Image = theskier1;
        self.skier1Name = theskier1name;
        self.skier2Image = theskier2;
        self.skier2Name = theskier2name;
        self.boatNumber = theboatNumber;
        self.engine = engineSize;
        self.hullType = thehullType;
        self.startTime = thestartTime;
        
        
    }
    
    return self;
}
+(NSArray*)getSampleData
{
//TODO: fill in mind numbing data
    return NULL;
}
@end
