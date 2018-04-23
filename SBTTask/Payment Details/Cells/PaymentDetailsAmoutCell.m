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

@property (weak, nonatomic) IBOutlet UITextField *amountField;
@property (weak, nonatomic) IBOutlet UILabel *taxLabel;

@end

@implementation PaymentDetailsAmoutCell

- (void)updateViews {
    PaymentDetailsAmoutCellModel *cellModel = (PaymentDetailsAmoutCellModel *)self.viewModel;
    
    self.amountField.text = cellModel.amountString;
    self.taxLabel.text = cellModel.taxString;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if ([textField.text containsString:@" ₽"]) {
        textField.text = [textField.text stringByReplacingOccurrencesOfString:@" ₽" withString:@""];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if ([string componentsSeparatedByCharactersInSet:NSCharacterSet.letterCharacterSet].count > 1) {
        return NO;
    }
    
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (![textField.text containsString:@" ₽"]) {
        textField.text = [NSString stringWithFormat:@"%@ ₽", textField.text];
    }
}

@end
