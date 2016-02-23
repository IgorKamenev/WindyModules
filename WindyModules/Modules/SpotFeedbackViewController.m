//
//  SpotFeedbackViewController.m
//  WindyModules
//
//  Created by Камиль Манафов on 22/02/16.
//  Copyright © 2016 Igor Kamenev. All rights reserved.
//

#import "SpotFeedbackViewController.h"
#import "SpotFeedbackTableViewCell.h"
#import <PureLayout/PureLayout.h>
#import "UIColor+AllColors.h"

@interface SpotFeedbackViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) UITableView *tableView;


@end

@implementation SpotFeedbackViewController

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.title = NSLocalizedString(@"Feedback", nil);
    }
    
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupNavigationBarItems];
    [self setupTableView];
    
}

- (void)setupNavigationBarItems
{
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Arrow Back White"]
                                                               style:UIBarButtonItemStylePlain
                                                              target:self
                                                              action:@selector(getBack)];
    self.navigationItem.leftBarButtonItem = button;
    
    button = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Edit"]
                                              style:UIBarButtonItemStylePlain
                                             target:self
                                             action:@selector(edit)];
    self.navigationItem.rightBarButtonItem = button;
}

- (void)setupTableView
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    _tableView.backgroundColor = [UIColor baseColor];
    _tableView.separatorColor = [UIColor colorWithRed:0.16 green:0.25 blue:0.33 alpha:1];
    //    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [_tableView registerClass:[SpotFeedbackTableViewCell class] forCellReuseIdentifier:SpotFeedbackTableViewCellIdentifier];
}

#pragma mark - Table View Delegates

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 152.;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SpotFeedbackTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SpotFeedbackTableViewCellIdentifier];
    
//    cell.name = @"Title";
//    cell.detailTextLabel.text = @"Some Text";
////    cell.imageView.image = [UIImage imageNamed:@""];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 44.;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 56)];
    
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    addButton.frame = CGRectZero;
    [addButton setTitle:NSLocalizedString(@"Feedback", nil) forState:UIControlStateNormal];
    [addButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Regular" size:14.]];
    
    [addButton sizeToFit];
    
    [footerView addSubview:addButton];
    
    return footerView;
}


#pragma mark - Actions

- (void)getBack
{
    NSLog(@"Button pressed");
}

- (void)edit
{
    NSLog(@"Button pressed");
}

@end
