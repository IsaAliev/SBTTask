//
//  PaymentDetailsAmoutCell.m
//  SBTTask
//
//  Created by Isa Aliev on 21.04.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import "PaymentDetailsAmoutCell.h"
#import "PaymentDetailsAmoutCellModel.h"

@interface PaymentDetailsAmoutCell ()

@property (weak, nonatomic) IBOutlet UILabel *amountLabel;
@property (weak, nonatomic) IBOutlet UILabel *taxLabel;

@end

@implementation PaymentDetailsAmoutCell

- (void)updateViews {
    PaymentDetailsAmoutCellModel *model = (PaymentDetailsAmoutCellModel *)self.model;
    
    self.amountLabel.text = model.amountString;
    self.taxLabel.text = model.taxString;
}

@end
