//
//  FeedbackTableViewCell.m
//  WindyModules
//
//  Created by Камиль Манафов on 22/02/16.
//  Copyright © 2016 Igor Kamenev. All rights reserved.
//

#import "SpotFeedbackTableViewCell.h"
#import "UIColor+AllColors.h"
#import <PureLayout/PureLayout.h>

NSString *const SpotFeedbackTableViewCellIdentifier = @"SpotFeedbackTableViewCellIdentifier";

@interface SpotFeedbackTableViewCell ()

@property (nonatomic) UILabel *nameLabel;
@property (nonatomic) UILabel *dateLabel;
@property (nonatomic) UILabel *detaileLabel;
@property (nonatomic) UIImageView *profileImageView;
@property (nonatomic) BOOL didSetupConstraints;

@end

@implementation SpotFeedbackTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
//        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.backgroundColor = [UIColor baseColor];

        _profileImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Template"]];
        [self addSubview:_profileImageView];
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _nameLabel.text = NSLocalizedString(@"Farid Rafikov", nil);
        _nameLabel.font = [UIFont fontWithName:@"HelveticaNeue-Regular" size:16.];
        _nameLabel.textColor = [UIColor whiteColor];
        [_nameLabel sizeToFit];
        
        [self addSubview:_nameLabel];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MMM, d"];
        NSString *title = [NSString stringWithFormat:@"%@", [formatter stringFromDate:[NSDate date]]];

        _dateLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [_dateLabel setText:title];
        _dateLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:13.];
        _dateLabel.textColor = [UIColor colorWithWhite:1. alpha:0.52];
        [_dateLabel sizeToFit];
        
        [self addSubview:_dateLabel];
        
        // Setup Info Label
        _detaileLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _detaileLabel.text = NSLocalizedString(@"This is an example of info. This is an example of info. This is an example of info. This is an example of info. This is an example of info.", nil);
        _detaileLabel.numberOfLines = 5;
        _detaileLabel.preferredMaxLayoutWidth = 280.;// width * 0.752
        _detaileLabel.font = [UIFont fontWithName:@"Helvetica-Light" size:14];
        _detaileLabel.textColor = [UIColor colorWithWhite:1. alpha:0.52];
        [_detaileLabel sizeToFit];

        [self addSubview:_detaileLabel];
        
        [self setNeedsUpdateConstraints];
    }
    
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints) {
        
        [_profileImageView autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self withOffset:20.];
        [_profileImageView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self withOffset:23.];
        
        [_nameLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self withOffset:23.];
        [_nameLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_profileImageView withOffset:12.];
        
        [_dateLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self withOffset:25.];
        [_dateLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_nameLabel withOffset:14.];
        
        [_detaileLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_nameLabel withOffset:8.];
        [_detaileLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_profileImageView withOffset:12.];
        CGRect rect = [UIScreen mainScreen].bounds;
        float width = rect.size.width;
        [_detaileLabel autoSetDimension:ALDimensionWidth toSize:width * 0.752];
        
        self.didSetupConstraints = YES;
    }
    
    [super updateConstraints];
}

@end