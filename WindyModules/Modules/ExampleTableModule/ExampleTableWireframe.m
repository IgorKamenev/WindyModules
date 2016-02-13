//
//  ExampleTableWireframe.m
//  WindyModules
//
//  Created by Igor Kamenev on 13/02/16.
//  Copyright © 2016 Igor Kamenev. All rights reserved.
//

#import "ExampleTableWireframe.h"
#import "ExampleTableInteractor.h"
#import "ExampleTablePresenter.h"
#import "ExampleTableView.h"

@interface ExampleTableWireframe ()

@property (nonatomic, weak) ExampleTableView* view;
@property (nonatomic, strong) ExampleTablePresenter* presenter;

@end

@implementation ExampleTableWireframe

+(void)showExampleTableFromWindow:(UIWindow*)window
{
    ExampleTableWireframe* wireframe = [ExampleTableWireframe new];
    ExampleTablePresenter* presenter = [ExampleTablePresenter new];
    
    ExampleTableView* view = [ExampleTablePresenter view];
    
    view.wireframe = wireframe;
    view.delegate = presenter;
    
    wireframe.presenter = presenter;
    presenter.view = view;
    
    
    UINavigationController* navVC = [UINavigationController new];
    navVC.viewControllers = @[view];
    
    window.rootViewController = navVC;
}

+(void)showExampleTableFromNavigationController:(UINavigationController*)navigationController
{

    ExampleTableWireframe* wireframe = [ExampleTableWireframe new];
    ExampleTablePresenter* presenter = [ExampleTablePresenter new];
    
    ExampleTableView* view = [ExampleTablePresenter view];
    
    view.wireframe = wireframe;
    view.delegate = presenter;

    wireframe.presenter = presenter;
    presenter.view = view;

    [navigationController pushViewController:view animated:YES];
}

@end
