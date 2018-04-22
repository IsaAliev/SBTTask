//
//  PaymentDetailsController.h
//  SBTTask
//
//  Created by Isa Aliev on 21.04.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import "PaymentDetailsViewModel.h"

#import <UIKit/UIKit.h>

@interface PaymentDetailsController : UITableViewController

- (instancetype)initWithModel:(PaymentDetailsViewModel *)model;

@end
