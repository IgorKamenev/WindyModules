//
//  ExampleTableInteractor.m
//  WindyModules
//
//  Created by Igor Kamenev on 13/02/16.
//  Copyright © 2016 Igor Kamenev. All rights reserved.
//

#import "ExampleTableInteractor.h"

@implementation ExampleTableInteractor

-(void)loadExampleItemsWithSuccessBlock:(ExampleTableInteractorSuccessBlock)successBlock
                             errorBlock:(ExampleTableInteractorErrorBlock)errorBlock
{

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

        NSArray* itemDB = @[
                            @"dfjklsklfadfl;s",
                            @"zxvczxcvzxcv;s",
                            @"12341234;s",
                            @"wefqlmkwfqmklfqw;s",
                            @"vzxcmvczxmn;s",
                            @"13420892314;s",
                            @"ZVFV#VV;s",
                            @"!@#$!FFFFFF;s",
                            @"ITEM ITEM;s",
                            @"BLUE FISH;s",
                            @"DARK TREE;s",
                            @"REBEL;s",
                            @"ASSASIN;s",
                            @"TYPE DEF;s",
                            ];
        
        
        NSMutableArray* result = [NSMutableArray new];
        
        for (int i=0; i < rand()%255; i++) {
            [result addObject:[itemDB objectAtIndex:rand() % itemDB.count]];
        }

        if (successBlock) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                successBlock([result copy]);
            });
        }
    });
}

@end
