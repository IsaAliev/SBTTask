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
#import "PaymentDetailsNameSelectionCellModel.h"

@implementation PaymentDetailsViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
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
    
    [self.cellModels addObject:[PaymentDetailsDocumentInfoCellModel new]];
    [self.cellModels addObject:[PaymentDetailsAmoutCellModel new]];
    [self.cellModels addObject:[PaymentDetailsReceiverCellModel new]];
    [self.cellModels addObject:[PaymentDetailsNameSelectionCellModel new]];
}

@end
