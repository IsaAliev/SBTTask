//
//  PaymentDetailsAmoutCellModel.h
//  SBTTask
//
//  Created by Isa Aliev on 21.04.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import "BaseCellModel.h"
#import "Payment.h"

@interface PaymentDetailsAmoutCellModel : BaseCellModel

@property (strong, nonatomic) NSString *amountString;
@property (strong, nonatomic) NSString *taxString;

- (instancetype)initWithPayment:(Payment *)payment;

@end
