//
//  Payment.m
//  SBTTask
//
//  Created by Isa Aliev on 22.04.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import "Payment.h"

@implementation Payment

+ (Payment *)dummyPayment {
    Payment *payment = [[Payment alloc] init];
    
    payment.date = [NSDate dateWithTimeIntervalSinceNow:-360000];
    payment.amoutInRubles = 140.23;
    payment.documentNumberString = @"№ 43";
    payment.taxesCalculationTypeName = @"Расчет по % (1)";
    
    return payment;
}

@end
