//
//  PaymentDetailsNameSelectionCellModel.m
//  SBTTask
//
//  Created by Isa Aliev on 22.04.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import "PaymentDetailsNameSelectionCellModel.h"

@interface PaymentDetailsNameSelectionCellModel ()

@end

@implementation PaymentDetailsNameSelectionCellModel

- (void)setName:(NSString *)name {
    _name = name;
    
    [self.delegate nameTextDidChange];
}

- (NSString *)identifier {
    return @"PaymentDetailsNameSelectionCell";
}

@end
