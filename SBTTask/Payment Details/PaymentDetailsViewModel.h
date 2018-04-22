//
//  PaymentDetailsViewModel.h
//  SBTTask
//
//  Created by Isa Aliev on 21.04.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PaymentDetailsDocumentInfoCellModel.h"
#import "PaymentDetailsDatePickerCellModel.h"
#import "Payment.h"

@class BaseCellModel;

@interface PaymentDetailsViewModel : NSObject <PaymentDetailsDocumentInfoCellDelegate, PaymentDetailsDatePickerCellDelegate>

- (instancetype)initWithPayment:(Payment *)payment;

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSMutableArray<BaseCellModel *> *cellModels;

@end
