//
//  ExampleTableView.m
//  WindyModules
//
//  Created by Igor Kamenev on 13/02/16.
//  Copyright © 2016 Igor Kamenev. All rights reserved.
//

#import "ExampleTableView.h"
#import "ExampleTableViewCell.h"

@interface ExampleTableView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView* tableView;

@end

static NSString* const kCellIdentifier = @"kCellIdentifier";

@implementation ExampleTableView

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupTableView];
}

-(void)viewWillLayoutSubviews
{
    self.tableView.frame = self.view.bounds;
}

-(void)setupTableView
{
    self.tableView = [UITableView new];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerClass:[ExampleTableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    
    [self.view addSubview:self.tableView];
}

-(void)setItems:(NSArray *)items
{
    _items = items;
    [self.tableView reloadData];
}

#pragma mark UITableViewDatasource&Delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ExampleTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];

    cell.textLabel.text = self.items[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.delegate didSelectItemWithIndex:indexPath.row];
}


@end
