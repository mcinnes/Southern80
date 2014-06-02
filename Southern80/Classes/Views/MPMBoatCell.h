//
//  MPMBoatCell.h
//  Southern80
//
//  Created by Matt McInnes on 1/06/14.
//  Copyright (c) 2014 Matt McInnes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MPMBoatCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *classLabel;

@end
