//
//  PaymentDetailsController.h
//  SBTTask
//
//  Created by Isa Aliev on 21.04.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PaymentDetailsViewModel.h"

@interface PaymentDetailsController : UITableViewController

- (instancetype)initWithViewModel:(PaymentDetailsViewModel *)viewModel;

@end
