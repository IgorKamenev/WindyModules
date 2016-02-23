//
//  UserListTableCell.m
//  WindyModules
//
//  Created by Камиль Манафов on 22/02/16.
//  Copyright © 2016 Igor Kamenev. All rights reserved.
//

#import "UserListTableCell.h"
#import "UIColor+AllColors.h"
#import <PureLayout/PureLayout.h>

NSString *const UserListTableCellIdentifier = @"UserListTableCellIdentifier";

@interface UserListTableCell ()

@property (nonatomic) UILabel *titleLabel;
@property (nonatomic) UILabel *infoLabel;
@property (nonatomic) BOOL didSetupConstraints;


@end

@implementation UserListTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.backgroundColor = [UIColor baseColor];
//        self.layer.shouldRasterize = YES;
//        self.layer.rasterizationScale = [UIScreen mainScreen].scale;
        
//        UIColor *color = [UIColor colorWithRed:1.0 green:1.0 blue:252.0/255.0 alpha:1.];
        
        // Setup Title Label
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.text = NSLocalizedString(@"Title", nil);
        _titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:20];
        [_titleLabel sizeToFit];
        
        [self addSubview:_titleLabel];
        
        
        // Setup Info Label
        _infoLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _infoLabel.text = NSLocalizedString(@"This is an example of info.", nil);
        _infoLabel.numberOfLines = 0;
        _infoLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:16];
        [_infoLabel sizeToFit];
        
        [self addSubview:_infoLabel];
        
        [self setNeedsUpdateConstraints];
    }
    
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints) {
        [_titleLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self withOffset:20.];
        [_titleLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self];
        
        [_infoLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_titleLabel withOffset:10.];
        [_infoLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:_titleLabel];
        [_infoLabel autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self withOffset:-40.];
        
        self.didSetupConstraints = YES;
    }
    
    [super updateConstraints];
}

@end
