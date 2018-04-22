//
//  PaymentDetailsNameSelectionCellModel.h
//  SBTTask
//
//  Created by Isa Aliev on 22.04.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import "BaseCellModel.h"

@protocol PaymentDetailsNameSelectionCellDelegate

- (void)nameTextDidChange;

@end

@interface PaymentDetailsNameSelectionCellModel : BaseCellModel

@property (strong, nonatomic) NSString *name;
@property (weak, nonatomic) id<PaymentDetailsNameSelectionCellDelegate> delegate;

@end
