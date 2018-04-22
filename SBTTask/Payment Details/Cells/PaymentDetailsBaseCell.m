//
//  PaymentDetailsBaseCell.m
//  SBTTask
//
//  Created by Isa Aliev on 21.04.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import "PaymentDetailsBaseCell.h"

@implementation PaymentDetailsBaseCell

- (void)setViewModel:(BaseCellModel *)viewModel {
    _viewModel = viewModel;
    
    [self updateViews];
}

- (void)updateViews {
    
}
    
@end
