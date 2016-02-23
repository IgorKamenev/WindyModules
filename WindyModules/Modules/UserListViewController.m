//
//  UserListViewController.m
//  WindyModules
//
//  Created by Камиль Манафов on 22/02/16.
//  Copyright © 2016 Igor Kamenev. All rights reserved.
//

#import "UserListViewController.h"
#import "UIColor+AllColors.h"
#import "UserListTableCell.h"

@interface UserListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) UITableView *tableView;

@end

@implementation UserListViewController

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.title = NSLocalizedString(@"UserList", nil);
    }
    
    return self;
}

- (void)viewDidLoad {

    [super viewDidLoad];
    self.navigationController.navigationBar.topItem.title = @"#General";
    self.view.backgroundColor = [UIColor baseColor];
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
}

- (void)loadData
{
    //Get data to place in tableView
}

- (void)setupTableView
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.separatorColor = [UIColor colorWithRed:0.16 green:0.25 blue:0.33 alpha:1];
//    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [_tableView registerClass:[UserListTableCell class] forCellReuseIdentifier:UserListTableCellIdentifier];
}

#pragma mark - Table View Delegates

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 62.;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UserListTableCell *cell = [_tableView dequeueReusableCellWithIdentifier:UserListTableCellIdentifier];
    static NSString *const cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.backgroundColor = [UIColor clearColor];
        cell.backgroundColor = [UIColor baseColor];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.detailTextLabel.textColor = [UIColor whiteColor];
    }
    
    cell.textLabel.text = @"Farid Rafikov";
    cell.detailTextLabel.text = @"Administrator";
    cell.imageView.image = [UIImage imageNamed:@"Template"];
    
    return cell;
}

#pragma mark - Actions

- (void)getBack
{
    NSLog(@"Button pressed");
}


@end
