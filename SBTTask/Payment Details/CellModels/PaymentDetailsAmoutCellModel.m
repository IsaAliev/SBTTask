//
//  PaymentDetailsAmoutCellModel.m
//  SBTTask
//
//  Created by Isa Aliev on 21.04.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import "PaymentDetailsAmoutCellModel.h"

@implementation PaymentDetailsAmoutCellModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.amountString = @"150,00 ₽";
        self.taxString = @"Расчет по % (1)";
    }
    
    return self;
}
    
- (NSString *)identifier {
    return @"PaymentDetailsAmoutCell";
}

@end
