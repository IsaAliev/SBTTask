//
//  PaymentDetailsAmoutCellModel.m
//  SBTTask
//
//  Created by Isa Aliev on 21.04.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import "PaymentDetailsAmoutCellModel.h"

@implementation PaymentDetailsAmoutCellModel

- (instancetype)initWithPayment:(Payment *)payment {
    self = [super init];
    if (self) {
        self.amountString = [NSString stringWithFormat:@"%.2f ₽", payment.amoutInRubles];
        self.taxString = payment.taxesCalculationTypeName;
    }
    
    return self;
}
    
- (NSString *)identifier {
    return @"PaymentDetailsAmoutCell";
}

@end
