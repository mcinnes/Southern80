//
//  SimpleTableCell.m
//  SimpleTable
//
//  Created by Simon Ng on 28/4/12.
//  Copyright (c) 2012 Appcoda. All rights reserved.
//

#import "WatchingTableCell.h"

@implementation WatchingTableCell
@synthesize nameLabel = _nameLabel;
@synthesize thumbnailImageView = _thumbnailImageView;
@synthesize descLabel = _descLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
     //   [self.nameLabel setFont:[UIFont fontWithName:@"BrandonGrotesque-Regular" size:45]];
         
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
