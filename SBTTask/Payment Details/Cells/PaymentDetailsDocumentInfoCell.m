//
//  PaymentDetailsDocumentInfoCell.m
//  SBTTask
//
//  Created by Isa Aliev on 21.04.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import "PaymentDetailsDocumentInfoCell.h"
#import "PaymentDetailsDocumentInfoCellModel.h"

#import "NSObject+Observe.h"

@interface PaymentDetailsDocumentInfoCell ()

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) NSMutableArray *observingKeyPaths;

@end

@implementation PaymentDetailsDocumentInfoCell

- (void)updateViews {
    self.observingKeyPaths = [NSMutableArray array];
    [self updateLabels];
    [self bindWithModel];
}

- (void)updateLabels {
    self.numberLabel.text = [self cellModel].numberString;
    self.dateLabel.text = [self cellModel].dateString;
}

- (void)bindWithModel {
    self.observingKeyPaths = [NSMutableArray arrayWithObjects:@"cellModel.dateString", nil];

    [self observeKeyPaths:self.observingKeyPaths];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([self.observingKeyPaths containsObject:keyPath]) {
        [self updateLabels];
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (PaymentDetailsDocumentInfoCellModel *)cellModel {
    return (PaymentDetailsDocumentInfoCellModel *)self.viewModel;
}

- (IBAction)dateButtonAction:(UIButton *)sender {
    [[self cellModel] dateButtonDidTap];
}

- (void)dealloc {
    [self removeObservingOfKeyPaths:self.observingKeyPaths];
}

@end
