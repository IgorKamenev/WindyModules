//
//  UIColor+AllColors.m
//  WindyModules
//
//  Created by Камиль Манафов on 14/02/16.
//  Copyright © 2016 Igor Kamenev. All rights reserved.
//

#import "UIColor+AllColors.h"

@implementation UIColor (AllColors)

+ (UIColor *)baseColor
{
    return [UIColor colorWithRed:40./255. green:70./255. blue:90./255. alpha:1.];
}

+ (UIColor *)baseWithAlpha
{
    return [UIColor colorWithRed:33./255. green:44./255. blue:54./255. alpha:0.1];
}

@end
