//
//  MPMBoatCell.m
//  Southern80
//
//  Created by Matt McInnes on 1/06/14.
//  Copyright (c) 2014 Matt McInnes. All rights reserved.
//

#import "MPMBoatCell.h"

@implementation MPMBoatCell
@synthesize backgroundImage = _backgroundImage;
@synthesize nameLable = _nameLable;
@synthesize classLabel = _classLabel;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
