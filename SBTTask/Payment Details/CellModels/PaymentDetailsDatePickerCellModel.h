//
//  PaymentDetailsDatePickerCellModel.h
//  SBTTask
//
//  Created by Isa Aliev on 22.04.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import "BaseCellModel.h"

@class PaymentDetailsDatePickerCellModel;

@protocol PaymentDetailsDatePickerCellDelegate

- (void)clearButtonDidTapOnCellModel:(PaymentDetailsDatePickerCellModel *)cellModel;
- (void)applyButtonDidTapWithDate:(NSDate *)date onCellModel:(PaymentDetailsDatePickerCellModel *)cellModel;

@end

@interface PaymentDetailsDatePickerCellModel : BaseCellModel

@property (strong, nonatomic) NSDate *selectedDate;
@property (weak, nonatomic) id<PaymentDetailsDatePickerCellDelegate> delegate;

- (instancetype)initWithDate:(NSDate *)date;
- (void)applyButtonDidTap;
- (void)clearButtonDidTap;

@end
