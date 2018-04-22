//
//  PaymentDetailsViewModel.m
//  SBTTask
//
//  Created by Isa Aliev on 21.04.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import "PaymentDetailsViewModel.h"
#import "PaymentDetailsDocumentInfoCellModel.h"
#import "PaymentDetailsAmoutCellModel.h"
#import "PaymentDetailsReceiverCellModel.h"
#import "PaymentDetailsDatePickerCellModel.h"

#import "NSDate+NSString.h"

typedef enum : NSUInteger {
    PaymentDetailsViewModelStateDefault,
    PaymentDetailsViewModelStateSelectingDate,
} PaymentDetailsViewModelState;

@interface PaymentDetailsViewModel ()

@property (assign, nonatomic) PaymentDetailsViewModelState state;
@property (strong, nonatomic) Payment *payment;

@end

@implementation PaymentDetailsViewModel

- (instancetype)initWithPayment:(Payment *)payment {
    self = [super init];
    if (self) {
        self.payment = payment;
        [self configure];
    }
    
    return self;
}

- (void)configure {
    self.title = @"Платеж в бюджет";
    [self configureCellModels];
}

- (void)configureCellModels {
    self.cellModels = [NSMutableArray array];

    PaymentDetailsDocumentInfoCellModel *docInfoModel = [[PaymentDetailsDocumentInfoCellModel alloc] initWithPayment:self.payment];
    docInfoModel.delegate = self;

    PaymentDetailsAmoutCellModel *amountModel = [[PaymentDetailsAmoutCellModel alloc] initWithPayment:self.payment];
    
    PaymentDetailsNameSelectionCellModel *nameModel = [PaymentDetailsNameSelectionCellModel new];
    nameModel.delegate = self;
    
    [self.cellModels addObjectsFromArray:@[docInfoModel,
                                           amountModel,
                                           [PaymentDetailsReceiverCellModel new],
                                           nameModel]];
}

- (NSMutableArray *)keyValueObservableCellModels {
    return [self mutableArrayValueForKey:@"cellModels"];
}

- (void)dateButtonDidTapOnCellModel:(PaymentDetailsDocumentInfoCellModel *)cellModel {
    if (self.state == PaymentDetailsViewModelStateSelectingDate) {
        return;
    }
    
    NSInteger indexOfTheModel = [self indexOfModel:cellModel];
    
    if (indexOfTheModel != NSNotFound) {
        PaymentDetailsDatePickerCellModel *datePickerModel = [[PaymentDetailsDatePickerCellModel alloc]
                                                              initWithDate:self.payment.date];
        datePickerModel.delegate = self;
        [[self keyValueObservableCellModels] insertObject:datePickerModel atIndex:indexOfTheModel + 1];
        self.state = PaymentDetailsViewModelStateSelectingDate;
    }
}
    
- (void)applyButtonDidTapWithDate:(NSDate *)date onCellModel:(PaymentDetailsDatePickerCellModel *)cellModel {
    self.payment.date = date;
    
    [self removeDatePickerModel:cellModel];
}
    
- (void)clearButtonDidTapOnCellModel:(PaymentDetailsDatePickerCellModel *)cellModel {
    self.payment.date = nil;
    
    [self removeDatePickerModel:cellModel];
}

- (void)removeDatePickerModel:(PaymentDetailsDatePickerCellModel *)cellModel {
    NSInteger indexOfTheModel = [self indexOfModel:cellModel];
    
    if (indexOfTheModel != NSNotFound) {
        [[self keyValueObservableCellModels] removeObjectAtIndex:indexOfTheModel];
        self.state = PaymentDetailsViewModelStateDefault;
    }
}

- (NSInteger)indexOfModel:(BaseCellModel *)model {
    return [[self cellModels] indexOfObject:model];
}
    
- (void)nameTextDidChange {
    self.shouldUpdateRowsTrigger = true;
}

@end
