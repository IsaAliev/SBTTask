//
//  PaymentDetailsDocumentInfoCellModel.h
//  SBTTask
//
//  Created by Isa Aliev on 21.04.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import "BaseCellModel.h"
#import "Payment.h"

@class PaymentDetailsDocumentInfoCellModel;

@protocol PaymentDetailsDocumentInfoCellDelegate

- (void)dateButtonDidTapOnCellModel:(PaymentDetailsDocumentInfoCellModel *)cellModel;

@end

@interface PaymentDetailsDocumentInfoCellModel : BaseCellModel

@property (weak, nonatomic) id<PaymentDetailsDocumentInfoCellDelegate> delegate;
@property (strong, nonatomic) NSString *numberString;
@property (strong, nonatomic) NSString *dateString;

- (instancetype)initWithPayment:(Payment *)payment;
- (void)dateButtonDidTap;

@end
