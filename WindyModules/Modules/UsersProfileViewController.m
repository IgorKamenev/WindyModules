//
//  UsersProfileViewController.m
//  WindyModules
//
//  Created by Камиль Манафов on 20/02/16.
//  Copyright © 2016 Igor Kamenev. All rights reserved.
//

#import "UsersProfileViewController.h"
#import "UIColor+AllColors.h"
#import <PureLayout/PureLayout.h>
#import <OAStackView/OAStackView+Constraint.h>

@interface UsersProfileViewController ()

@property (nonatomic) UIImageView *profileImageView;
@property (nonatomic) UILabel *nameLabel;
@property (nonatomic) BOOL isOnline;
@property (nonatomic) UILabel *followingNumberLabel;
@property (nonatomic) UILabel *followersNumberLabel;
@property (nonatomic) UILabel *favoritesNumberLabel;
@property (nonatomic) UIButton *exerciseButton;
@property (nonatomic) UIView *rectangleView;
@property (nonatomic) BOOL isHighlighted;

@end

@implementation UsersProfileViewController

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.title = NSLocalizedString(@"User's Profile", nil);
    }
    
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor baseColor];
    
    [self setupNavigationBarItems];
    [self setupProfileInfoBlock];
    [self setupFollowingBlock];
    [self setupSocialActions];
    [self setupActivityBlock];
    [self setupSocialBlock];
}

- (void)setupNavigationBarItems
{
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Arrow Back White"]
                                                               style:UIBarButtonItemStylePlain
                                                              target:self
                                                              action:@selector(getBack)];
    self.navigationItem.leftBarButtonItem = button;
    
    button = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Add User-48"] style:UIBarButtonItemStylePlain target:self action:@selector(addUser)];
    self.navigationItem.rightBarButtonItem = button;
}

#pragma mark - Views

- (void)setupProfileInfoBlock
{
    UIImage *profileImage = [UIImage imageNamed:@"ProfilePlaceholder"];
    _profileImageView = [[UIImageView alloc] initWithImage:profileImage];
    
    [self.view addSubview:_profileImageView];
    
    [_profileImageView autoAlignAxis:ALAxisVertical toSameAxisOfView:self.view];
    [_profileImageView autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.view withOffset:17.];
    
    //User's First and Second name Label
    _nameLabel = [self createLabelWithTitle:@"Semen Solomon" fontName:@"HelveticaNeue-Light" fontSize:21.];
    _nameLabel.textColor = [UIColor whiteColor];
    [_nameLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_profileImageView withOffset:16.];
    [_nameLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.view];
    
    UILabel *isActive = [self createLabelWithTitle:@"online" fontName:@"HelveticaNeue-Light" fontSize:13.];
    isActive.textColor = [UIColor colorWithRed:0.13 green:0.84 blue:0.05 alpha:1];
    isActive.backgroundColor = [UIColor clearColor];
    [isActive autoAlignAxis:ALAxisVertical toSameAxisOfView:self.view];
    [isActive autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_nameLabel withOffset:4.];
}

- (void)setupFollowingBlock
{
    //Following Labels
    _followingNumberLabel = [self createLabelWithTitle:@"25" fontName:@"HelveticaNeue-Bold" fontSize:18.];
    _followingNumberLabel.textColor = [UIColor whiteColor];
    [_followingNumberLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_nameLabel withOffset:41.];
    [_followingNumberLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.view];
    
    UILabel *followingTextLabel = [self createLabelWithTitle:@"FOLLOWING" fontName:@"HelveticaNeue-Medium" fontSize:9.];
    followingTextLabel.textColor = [UIColor colorWithWhite:1. alpha:0.36];
    [followingTextLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_followingNumberLabel withOffset:4.];
    [followingTextLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:_followingNumberLabel];
    
    //Followers Labels
    _followersNumberLabel = [self createLabelWithTitle:@"10" fontName:@"HelveticaNeue-Bold" fontSize:18.];
    _followersNumberLabel.textColor = [UIColor whiteColor];
    [_followersNumberLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_followingNumberLabel withOffset:-100.];
    [_followersNumberLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_nameLabel withOffset:41.];
    
    UILabel *followersTextLabel = [self createLabelWithTitle:@"FOLLOWERS" fontName:@"HelveticaNeue-Medium" fontSize:9.];
    followersTextLabel.textColor = [UIColor colorWithWhite:1. alpha:0.36];
    [followersTextLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_followersNumberLabel withOffset:4.];
    [followersTextLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:_followersNumberLabel];
    
    
    //Favorites Labels
    _favoritesNumberLabel = [self createLabelWithTitle:@"151" fontName:@"HelveticaNeue-Bold" fontSize:18.];
    _favoritesNumberLabel.textColor = [UIColor whiteColor];
    [_favoritesNumberLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_followingNumberLabel withOffset:102.];
    [_favoritesNumberLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_nameLabel withOffset:41.];
    
    UILabel *favoritesTextLabel = [self createLabelWithTitle:@"FAVORITES" fontName:@"HelveticaNeue-Medium" fontSize:9.];
    favoritesTextLabel.textColor = [UIColor colorWithWhite:1. alpha:0.36];
    [favoritesTextLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_favoritesNumberLabel withOffset:4.];
    [favoritesTextLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:followingTextLabel withOffset:61.];
    
    UIImage *favoriteImage = [UIImage imageNamed:@"FavoriteImage"];
    UIImageView *favoriteImageView = [[UIImageView alloc] initWithImage:favoriteImage];
    
    [self.view addSubview:favoriteImageView];
    
    [favoriteImageView autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_favoritesNumberLabel withOffset:-5.];
    [favoriteImageView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_nameLabel withOffset:45.];
}

- (void)setupSocialActions
{
    if (NSClassFromString(@"UIStackView")) {
        
        UIButton *followActionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        followActionButton.frame = CGRectZero;
        [followActionButton setTitle:@"Follow" forState:UIControlStateNormal];
        [followActionButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        followActionButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.];
        followActionButton.layer.cornerRadius = 4;
        [followActionButton sizeToFit];
//        [followActionButton autoSetDimensionsToSize:followActionButton.frame.size];
        [followActionButton autoSetDimension:ALDimensionHeight toSize:36.];
        [followActionButton autoSetDimension:ALDimensionWidth toSize:163.];
        
        UIButton *sendMsgActionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        sendMsgActionButton.frame = CGRectZero;
        [sendMsgActionButton setTitle:@"Send Message" forState:UIControlStateNormal];
        [sendMsgActionButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        sendMsgActionButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.];
        sendMsgActionButton.layer.cornerRadius = 4;
        [sendMsgActionButton sizeToFit];
        [sendMsgActionButton autoSetDimensionsToSize:sendMsgActionButton.frame.size];
        
        //StackView setup
        UIStackView *stackView = [[UIStackView alloc] init];
        
        stackView.axis = UILayoutConstraintAxisHorizontal;
        stackView.distribution = UIStackViewDistributionEqualSpacing;
        stackView.alignment = UIStackViewAlignmentCenter;
        
        stackView.spacing = 9.;
        
        [stackView addArrangedSubview:followActionButton];
        [stackView addArrangedSubview:sendMsgActionButton];
        
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        [self.view addSubview:stackView];
        
        //Layout for Stack View
        [stackView autoAlignAxis:ALAxisVertical toSameAxisOfView:self.view];
        [stackView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_followersNumberLabel withOffset:44.];

    
    } else {
        
    }

}

- (void)setupActivityBlock
{
    _rectangleView = [[UIImageView alloc] initWithFrame:CGRectZero];
    _rectangleView.backgroundColor = [UIColor colorWithRed:33./255. green:44./255. blue:54./255. alpha:0.1];
    _rectangleView.layer.cornerRadius = 4;
    
    [self.view addSubview:_rectangleView];
    CGRect rect = [UIScreen mainScreen].bounds;
    float widthRectangle = rect.size.width * 0.94;
    float widthOffset = -rect.size.width * 0.06;
    
    [_rectangleView autoAlignAxis:ALAxisVertical toSameAxisOfView:self.view];
    [_rectangleView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_followingNumberLabel withOffset:100.];
    //    [_rectangleView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.view];
    [_rectangleView autoSetDimension:ALDimensionHeight toSize:158.];
    [_rectangleView autoMatchDimension:ALDimensionWidth
                           toDimension:ALDimensionWidth
                                ofView:self.view
                            withOffset:widthOffset];
    
    UILabel *activitiesLabel = [self createLabelWithTitle:@"ACTIVITIES" fontName:@"HelveticaNeue-Medium" fontSize:11.];
    activitiesLabel.textColor = [UIColor whiteColor];
    [activitiesLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_rectangleView withOffset:20.];
    [activitiesLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.view];
    
    //Activity Images Setup
    if (NSClassFromString(@"UIStackView")) {
        
        //Exercise Icon
        _exerciseButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _exerciseButton.frame = CGRectZero;
        [_exerciseButton setImage:[UIImage imageNamed:@"ExerciseImage"] forState:UIControlStateNormal];
        [_exerciseButton addTarget:self action:@selector(exerciseButtonClicked:) forControlEvents:UIControlEventTouchDown];
        [_exerciseButton setImage:[UIImage imageNamed:@"ExerciseImage-Highlighted"] forState:UIControlStateSelected];
        _exerciseButton.adjustsImageWhenHighlighted = NO;
        [_exerciseButton sizeToFit];
        
        //View 2
        UIButton *skiingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        skiingButton.frame = CGRectZero;
        [skiingButton setImage:[UIImage imageNamed:@"SkiingImage"] forState:UIControlStateNormal];
        [skiingButton addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchDown];
        [skiingButton setImage:[UIImage imageNamed:@"SkiingImage-Highlighted"] forState:UIControlStateHighlighted];
        skiingButton.adjustsImageWhenHighlighted = NO;
        [skiingButton sizeToFit];
        
        //View 3
        UIButton *windSurfButton = [UIButton buttonWithType:UIButtonTypeCustom];
        windSurfButton.frame = CGRectZero;
        [windSurfButton setImage:[UIImage imageNamed:@"WindSurfImage"] forState:UIControlStateNormal];
        [windSurfButton addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchDown];
        [windSurfButton setImage:[UIImage imageNamed:@"WindSurfImage-Highlighted"] forState:UIControlStateHighlighted];
        windSurfButton.adjustsImageWhenHighlighted = NO;
        [windSurfButton sizeToFit];
        
        UIButton *bikingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        bikingButton.frame = CGRectZero;
        [bikingButton setImage:[UIImage imageNamed:@"BikingImage"] forState:UIControlStateNormal];
        [bikingButton addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchDown];
        [bikingButton setImage:[UIImage imageNamed:@"BikingImage-Highlighted"] forState:UIControlStateHighlighted];
        bikingButton.adjustsImageWhenHighlighted = NO;
        [bikingButton sizeToFit];
        
        //Stack View
        UIStackView *stackView = [[UIStackView alloc] init];
        
        stackView.axis = UILayoutConstraintAxisHorizontal;
        stackView.distribution = UIStackViewDistributionEqualSpacing;
        stackView.alignment = UIStackViewAlignmentCenter;
        
        float widthSpacing = (widthRectangle/4 - 50.);
        stackView.spacing = widthSpacing;
        
        [stackView addArrangedSubview:_exerciseButton];
        [stackView addArrangedSubview:skiingButton];
        [stackView addArrangedSubview:windSurfButton];
        [stackView addArrangedSubview:bikingButton];
        
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        [self.view addSubview:stackView];
        
        //Layout for Stack View
        [stackView autoAlignAxis:ALAxisVertical toSameAxisOfView:_rectangleView];
        [stackView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_rectangleView withOffset:6.];
        
    } else {
        
        //View 1
        UIView *view1 = [[UIView alloc] init];
        view1.backgroundColor = [UIColor blueColor];
        [view1 autoSetDimension:ALDimensionWidth toSize:50.];
        [view1 autoSetDimension:ALDimensionHeight toSize:50.];
        
        //View 2
        UIView *view2 = [[UIView alloc] init];
        view2.backgroundColor = [UIColor greenColor];
        [view2 autoSetDimension:ALDimensionWidth toSize:50.];
        [view2 autoSetDimension:ALDimensionHeight toSize:50.];
        
        //View 3
        UIView *view3 = [[UIView alloc] init];
        view3.backgroundColor = [UIColor magentaColor];
        [view3 autoSetDimension:ALDimensionWidth toSize:50.];
        [view3 autoSetDimension:ALDimensionHeight toSize:50.];
        
        //View 4
        UIView *view4 = [[UIView alloc] init];
        view4.backgroundColor = [UIColor orangeColor];
        [view4 autoSetDimension:ALDimensionWidth toSize:50.];
        [view4 autoSetDimension:ALDimensionHeight toSize:50.];
        
        OAStackView *stackView = [[OAStackView alloc] initWithArrangedSubviews:@[view1, view2, view3, view4]];
        stackView.axis = UILayoutConstraintAxisHorizontal;
        stackView.distribution = OAStackViewDistributionEqualSpacing;
        stackView.alignment = UIStackViewAlignmentCenter;
        
        float widthSpacing = (widthRectangle/4 - 50.);
        stackView.spacing = widthSpacing;
        
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        [self.view addSubview:stackView];
        
        [stackView autoAlignAxis:ALAxisVertical toSameAxisOfView:self.view];
        [stackView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.view];
        
        NSLog(@"UIStackView is available from iOS 9.0, OAStackView used instead");
    }
}

- (void)setupSocialBlock
{
    UIButton *fbButton = [UIButton buttonWithType:UIButtonTypeCustom];
    fbButton.frame = CGRectZero;
    [fbButton setImage:[UIImage imageNamed:@"Facebook21"] forState:UIControlStateNormal];
    [fbButton addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchDown];
    [fbButton sizeToFit];
    [self.view addSubview:fbButton];
    
    [fbButton autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.view withOffset:-50.];
    [fbButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.view withOffset:60.];
    
    UIButton *vkButton = [UIButton buttonWithType:UIButtonTypeCustom];
    vkButton.frame = CGRectZero;
    [vkButton setImage:[UIImage imageNamed:@"Vk21"] forState:UIControlStateNormal];
    [vkButton addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchDown];
    [vkButton sizeToFit];
    [self.view addSubview:vkButton];
    
    [vkButton autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.view withOffset:-50.];
    [vkButton autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.view withOffset:-130.];
}


- (UILabel *)createLabelWithTitle:(NSString *)title fontName:(NSString *)fontName fontSize:(CGFloat)fontSize
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.text = NSLocalizedString(title, nil);
    label.font = [UIFont fontWithName:fontName size:fontSize];
    [label sizeToFit];
    [self.view addSubview:label];
    [label autoSetDimensionsToSize:label.frame.size];
    
    return label;
}
#pragma mark - Actions

- (void)exerciseButtonClicked: (UIButton *)sender
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if (_isHighlighted == false) {
            
            [_exerciseButton setSelected:YES];
            _isHighlighted = true;
            
        } else {
            
            [_exerciseButton setSelected:NO];
            _isHighlighted = false;
        }
    });
}

- (void)getBack
{
    NSLog(@"Button pressed");
}

- (void)addUser
{
    NSLog(@"Button pressed");
}

- (void)buttonClicked
{
    NSLog(@"Button pressed");
}

@end
