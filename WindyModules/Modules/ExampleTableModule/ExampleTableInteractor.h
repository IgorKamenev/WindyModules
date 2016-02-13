//
//  ExampleTableInteractor.h
//  WindyModules
//
//  Created by Igor Kamenev on 13/02/16.
//  Copyright © 2016 Igor Kamenev. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ExampleTableInteractorSuccessBlock)(NSArray* result);
typedef void (^ExampleTableInteractorErrorBlock)(NSError* error);

@interface ExampleTableInteractor : NSObject

-(void)loadExampleItemsWithSuccessBlock:(ExampleTableInteractorSuccessBlock)successBlock
                             errorBlock:(ExampleTableInteractorErrorBlock)errorBlock;

@end
