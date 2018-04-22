//
//  PaymentDetailsDocumentInfoCell.m
//  SBTTask
//
//  Created by Isa Aliev on 21.04.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import "PaymentDetailsDocumentInfoCell.h"
#import "PaymentDetailsDocumentInfoCellModel.h"

@interface PaymentDetailsDocumentInfoCell ()

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation PaymentDetailsDocumentInfoCell

- (void)updateViews {
    PaymentDetailsDocumentInfoCellModel *model = (PaymentDetailsDocumentInfoCellModel *)self.model;
    
    self.numberLabel.text = model.numberString;
    self.dateLabel.text = model.dateString;
}

@end
