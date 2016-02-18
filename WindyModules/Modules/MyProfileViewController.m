//
//  MyprofileViewController.m
//  WindyModules
//
//  Created by Камиль Манафов on 13/02/16.
//  Copyright © 2016 Igor Kamenev. All rights reserved.
//

#import "MyProfileViewController.h"
#import "UIColor+AllColors.h"
#import <PureLayout/PureLayout.h>
#import "TestViewController.h"

@interface MyProfileViewController ()

@property (nonatomic) UIImageView *profileImageView;
@property (nonatomic) UILabel *nameLabel;
@property (nonatomic) UIView *rectangleView;
@property (nonatomic) UILabel *followersNumberLabel;
@property (nonatomic) UILabel *followingNumberLabel;
@property (nonatomic) UILabel *favoritesNumberLabel;

@end

@implementation MyProfileViewController

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.title = NSLocalizedString(@"Profile", nil);
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor baseColor];
    [self setupNavigationBarItems];
    [self setupProfileImageView];
    [self setupLabelsAndButtons];
}

- (void)setupNavigationBarItems
{
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Arrow Back White"]
                                                               style:UIBarButtonItemStylePlain
                                                              target:self
                                                              action:@selector(getBack)];
    self.navigationItem.leftBarButtonItem = button;
    
    button = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Settings"]
                                              style:UIBarButtonItemStylePlain
                                             target:self
                                             action:@selector(settings:)];
    
    self.navigationItem.rightBarButtonItem = button;
    
//    self.navigationController.navigationBar.barTintColor = [UIColor baseColor];
    self.navigationController.navigationBar.translucent = NO;
}

- (void)getBack
{
    NSLog(@"Back button pressed");
}

- (void)settings:(UIBarButtonItem *)sender
{
    TestViewController *viewController = [TestViewController new];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewController];
    [self presentViewController:navController animated:YES completion:nil];
}

#pragma mark - Views

- (void)setupProfileImageView
{
    UIImage *profileImage = [UIImage imageNamed:@"ProfileImage"];
    self.profileImageView = [[UIImageView alloc] initWithImage:profileImage];

    [self.view addSubview:_profileImageView];
    
    [_profileImageView autoAlignAxis:ALAxisVertical toSameAxisOfView:self.view];
    [_profileImageView autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.view withOffset:17.];
}

- (void)setupLabelsAndButtons
{
    //User's First and Second name Label
    _nameLabel = [self createLabelWithTitle:@"Farid Rafikov" fontName:@"HelveticaNeue-Light" fontSize:21.];
    _nameLabel.textColor = [UIColor whiteColor];
    [_nameLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_profileImageView withOffset:16.];
    [_nameLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.view];
    
    //Following Labels
    _followingNumberLabel = [self createLabelWithTitle:@"25" fontName:@"HelveticaNeue-Bold" fontSize:18.];
    _followingNumberLabel.textColor = [UIColor whiteColor];
    [_followingNumberLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_nameLabel withOffset:29.];
    [_followingNumberLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.view];
    
    UILabel *followingTextLabel = [self createLabelWithTitle:@"FOLLOWING" fontName:@"HelveticaNeue-Medium" fontSize:9.];
    followingTextLabel.textColor = [UIColor colorWithWhite:1. alpha:0.36];
    [followingTextLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_followingNumberLabel withOffset:4.];
    [followingTextLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:_followingNumberLabel];
    
    //Followers Labels
    _followersNumberLabel = [self createLabelWithTitle:@"10" fontName:@"HelveticaNeue-Bold" fontSize:18.];
    _followersNumberLabel.textColor = [UIColor whiteColor];
    [_followersNumberLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_followingNumberLabel withOffset:-100.];
    [_followersNumberLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_nameLabel withOffset:29.];
    
    UILabel *followersTextLabel = [self createLabelWithTitle:@"FOLLOWERS" fontName:@"HelveticaNeue-Medium" fontSize:9.];
    followersTextLabel.textColor = [UIColor colorWithWhite:1. alpha:0.36];
    [followersTextLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_followersNumberLabel withOffset:4.];
    [followersTextLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:_followersNumberLabel];

    
    //Favorites Labels
    _favoritesNumberLabel = [self createLabelWithTitle:@"151" fontName:@"HelveticaNeue-Bold" fontSize:18.];
    _favoritesNumberLabel.textColor = [UIColor whiteColor];
    [_favoritesNumberLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_followingNumberLabel withOffset:102.];
    [_favoritesNumberLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_nameLabel withOffset:29.];
    
    UILabel *favoritesTextLabel = [self createLabelWithTitle:@"FAVORITES" fontName:@"HelveticaNeue-Medium" fontSize:9.];
    favoritesTextLabel.textColor = [UIColor colorWithWhite:1. alpha:0.36];
    [favoritesTextLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_favoritesNumberLabel withOffset:4.];
    [favoritesTextLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:followingTextLabel withOffset:61.];
    
    UIImage *favoriteImage = [UIImage imageNamed:@"FavoriteImage"];
    UIImageView *favoriteImageView = [[UIImageView alloc] initWithImage:favoriteImage];
    
    [self.view addSubview:favoriteImageView];
    
    [favoriteImageView autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_favoritesNumberLabel withOffset:-5.];
    [favoriteImageView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_nameLabel withOffset:33.];
    
    //RectangleView
    _rectangleView = [[UIView alloc] initWithFrame:CGRectZero];
    _rectangleView.backgroundColor = [UIColor baseWithAlpha];
    _rectangleView.layer.cornerRadius = 4;
    
    [self.view addSubview:_rectangleView];
    
    CGRect rect = [UIScreen mainScreen].bounds;
    float widthRectangle = rect.size.width * 0.94;
    float widthOffset = -rect.size.width * 0.06;
    
    [_rectangleView autoAlignAxis:ALAxisVertical toSameAxisOfView:self.view];
    [_rectangleView autoSetDimension:ALDimensionHeight toSize:158.];
    [_rectangleView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.view withOffset:widthOffset];
    [_rectangleView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:followingTextLabel withOffset:29.];
    
    //Activities Label
    UILabel *activities = [self createLabelWithTitle:@"ACTIVITIES" fontName:@"HelveticaNeue-Medium" fontSize:11.];
    activities.textColor = [UIColor whiteColor];
    [activities autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_rectangleView withOffset:20.];
    [activities autoAlignAxis:ALAxisVertical toSameAxisOfView:self.view];
    
    //Activity Images Setup
    UIImageView *exerciseImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ExerciseImage"]
                                              highlightedImage:[UIImage imageNamed:@"ExerciseImage-Highlighted"]];
    [self.view addSubview:exerciseImageView];
    
    [exerciseImageView autoAlignAxis:ALAxisVertical toSameAxisOfView:self.view withOffset:-127.5];
    [exerciseImageView autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_rectangleView withOffset:74.];
    
    UIImageView *skiingImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"SkiingImage"]
                                                     highlightedImage:[UIImage imageNamed:@"SkiingImage-Highlighted"]];
    [self.view addSubview:skiingImageView];
    
    [skiingImageView autoAlignAxis:ALAxisVertical toSameAxisOfView:self.view withOffset:-48.5];
    [skiingImageView autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_rectangleView withOffset:74.];

    UIImageView *inSeaImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"InSeaImage"]
                                                     highlightedImage:[UIImage imageNamed:@"InSeaImage-Highlighted"]];
    [self.view addSubview:inSeaImageView];
    
    [inSeaImageView autoAlignAxis:ALAxisVertical toSameAxisOfView:self.view withOffset:48.5];
    [inSeaImageView autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_rectangleView withOffset:74.];
    
//    UIImageView *bikingImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BikingImage"]
//                                                       highlightedImage:[UIImage imageNamed:@"BikingImage-Highlighted"]];
//    [self.view addSubview:bikingImageView];
//    
//    [bikingImageView autoAlignAxis:ALAxisVertical toSameAxisOfView:self.view withOffset:127.5];
//    [bikingImageView autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:rectangleView withOffset:74.];
    
    UIButton *imageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    imageButton.frame = CGRectZero;
    [imageButton setImage:[UIImage imageNamed:@"BikingImage"] forState:UIControlStateNormal];
    [imageButton setImage:[UIImage imageNamed:@"BikingImage-Highlighted"] forState:UIControlStateHighlighted];
    [imageButton sizeToFit];
    [self.view addSubview:imageButton];
    
    [imageButton autoSetDimensionsToSize:imageButton.frame.size];
    [imageButton autoAlignAxis:ALAxisVertical toSameAxisOfView:self.view withOffset:127.5];
    [imageButton autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_rectangleView withOffset:74.];
    
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
//    
//    NSString *string = @"ACTIVITIES";
//    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
//    
//    float spacing = 2.;
//    [attributedString addAttribute:NSKernAttributeName
//                             value:@(spacing)
//                             range:NSMakeRange(0, [string length])];
//    
//    label.attributedText = attributedString;
//    [self.view addSubview:label];
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


@end