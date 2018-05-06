//
//  PaymentDetailsDatePickerCell.m
//  SBTTask
//
//  Created by Isa Aliev on 22.04.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import "PaymentDetailsDatePickerCell.h"
#import "PaymentDetailsDatePickerCellModel.h"

@interface PaymentDetailsDatePickerCell ()

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation PaymentDetailsDatePickerCell

- (void)updateViews {
    self.datePicker.date = [[self cellModel] selectedDate];
}

- (IBAction)applyButtonAction:(UIButton *)sender {
    [[self cellModel] setSelectedDate:self.datePicker.date];
    [[self cellModel] applyButtonDidTap];
}
    
- (IBAction)clearButtonAction:(UIButton *)sender {
    [[self cellModel] clearButtonDidTap];
}

- (PaymentDetailsDatePickerCellModel *)cellModel {
    return (PaymentDetailsDatePickerCellModel *)self.viewModel;
}

@end
