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

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range
                                                        replacementString:(NSString *)string {
    
    BOOL isDeleting = string.length == 0;
    
    NSString *textWithoutReplacement = textField.text;
    NSRange modifiedRange = range;
    NSInteger locationOfRubleSymbol = [textWithoutReplacement rangeOfString:@"₽"].location;

    if (range.location == 0 && range.length == textField.text.length && isDeleting) {
        return YES;
    }

    if ([textWithoutReplacement containsString:@"₽"]) {
        textWithoutReplacement = [textWithoutReplacement stringByReplacingOccurrencesOfString:@" ₽" withString:@""];
        
        if (range.location == locationOfRubleSymbol + 1) {
            modifiedRange = NSMakeRange(MAX(range.location - 2, 0), range.length);
        } else if (range.location == locationOfRubleSymbol - 1 && isDeleting) {
            modifiedRange = NSMakeRange(MAX(range.location - 1, 0), range.length);
        } else if (range.location == locationOfRubleSymbol && !isDeleting) {
            modifiedRange = NSMakeRange(MAX(locationOfRubleSymbol - 1, 0), range.length);
        } else if (range.location == locationOfRubleSymbol && isDeleting) {
            if (textWithoutReplacement.length == 0) {
                return NO;
            } else {
                modifiedRange = NSMakeRange(MAX(locationOfRubleSymbol - 2, 0), range.length);
            }
        }
    }
    
    if ([textWithoutReplacement length] == 0 && [string isEqualToString:@""]) {
        return NO;
    }

    NSString *textWithReplacement = [textWithoutReplacement stringByReplacingCharactersInRange:modifiedRange withString:string];
    textField.text = [NSString stringWithFormat:@"%@ ₽", textWithReplacement];
    
    return NO;
}

@end
