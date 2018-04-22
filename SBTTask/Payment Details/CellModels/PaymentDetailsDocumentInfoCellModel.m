//
//  PaymentDetailsDocumentInfoCellModel.m
//  SBTTask
//
//  Created by Isa Aliev on 21.04.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import "PaymentDetailsDocumentInfoCellModel.h"

#import "NSDate+NSString.h"
#import "NSObject+Observe.h"

@interface PaymentDetailsDocumentInfoCellModel ()

@property (strong, nonatomic) Payment *payment;
@property (strong, nonatomic) NSMutableArray *observingKeyPaths;

@end

@implementation PaymentDetailsDocumentInfoCellModel

- (instancetype)initWithPayment:(Payment *)payment {
    self = [super init];
    if (self) {
        self.payment = payment;
        self.observingKeyPaths = [NSMutableArray array];
        
        [self updateModel];
        [self bindWithPayment];
    }
    
    return self;
}

- (void)updateModel {
    self.numberString = self.payment.documentNumberString;
    self.dateString = [self.payment.date defaultDateString];
}

- (void)bindWithPayment {
    [self.observingKeyPaths addObject:@"payment.date"];

    [self observeKeyPaths:self.observingKeyPaths];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([self.observingKeyPaths containsObject:keyPath]) {
        [self updateModel];
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}
    
- (NSString *)identifier {
    return @"PaymentDetailsDocumentInfoCell";
}

- (void)dateButtonDidTap {
    [self.delegate dateButtonDidTapOnCellModel:self];
}
    
- (void)dealloc {
    [self removeObservingOfKeyPaths:self.observingKeyPaths];
}
    
@end
