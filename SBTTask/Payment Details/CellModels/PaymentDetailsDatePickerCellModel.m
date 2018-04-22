//
//  PaymentDetailsDatePickerCellModel.m
//  SBTTask
//
//  Created by Isa Aliev on 22.04.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import "PaymentDetailsDatePickerCellModel.h"

@implementation PaymentDetailsDatePickerCellModel

- (instancetype)initWithDate:(NSDate *)date {
    self = [super init];
    if (self) {
        self.selectedDate = date;
    }
    return self;
}

- (void)applyButtonDidTap {
    [self.delegate applyButtonDidTapWithDate:self.selectedDate onCellModel:self];
}

- (void)clearButtonDidTap {
    [self.delegate clearButtonDidTapOnCellModel:self];
}

- (NSString *)identifier {
    return @"PaymentDetailsDatePickerCell";
}

@end
