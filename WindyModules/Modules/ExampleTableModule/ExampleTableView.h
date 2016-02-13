//
//  ExampleTableView.h
//  WindyModules
//
//  Created by Igor Kamenev on 13/02/16.
//  Copyright © 2016 Igor Kamenev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExampleTablePresenter.h"

@class ExampleTablePresenter;
@class ExampleTableWireframe;

@protocol ExampleTableViewDelegate <NSObject>

-(void)didSelectItemWithIndex:(NSInteger)index;

@end

@interface ExampleTableView : UIViewController

@property (nonatomic, strong) ExampleTableWireframe* wireframe;
@property (nonatomic, weak) ExampleTablePresenter* presenter;

@property (nonatomic, strong) NSArray* items;

@property (nonatomic, weak) id<ExampleTableViewDelegate>delegate;

@end
