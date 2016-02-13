//
//  ExampleTablePresenter.m
//  WindyModules
//
//  Created by Igor Kamenev on 13/02/16.
//  Copyright © 2016 Igor Kamenev. All rights reserved.
//

#import "ExampleTablePresenter.h"
#import "ExampleTableInteractor.h"
#import "ExampleTableWireframe.h"

@interface ExampleTablePresenter ()

@property (nonatomic, strong) ExampleTableInteractor* interactor;

@end

@implementation ExampleTablePresenter

+(ExampleTableView*)view
{
    return [ExampleTableView new];
}

-(instancetype)init
{
    self = [super init];
 
    if (self) {
        self.interactor = [ExampleTableInteractor new];
        [self loadItems];
    }
    
    return self;
}

-(void)loadItems
{
    [self.interactor loadExampleItemsWithSuccessBlock:^(NSArray *result) {
       
        self.view.items = result;
        
    } errorBlock:^(NSError *error) {
        
    }];
}

#pragma mark ExampleTableViewDelegate
-(void)didSelectItemWithIndex:(NSInteger)index
{
    
    [ExampleTableWireframe showExampleTableFromNavigationController: self.view.navigationController];
}

@end
