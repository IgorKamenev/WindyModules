//
//  ExampleTablePresenter.h
//  WindyModules
//
//  Created by Igor Kamenev on 13/02/16.
//  Copyright © 2016 Igor Kamenev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExampleTableView.h"

@class ExampleTableView;
@protocol ExampleTableViewDelegate;

@interface ExampleTablePresenter : NSObject <ExampleTableViewDelegate>

@property (nonatomic, weak) ExampleTableView* view;

+(ExampleTableView*)view;

@end
