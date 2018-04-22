//
//  PaymentDetailsBaseCell.h
//  SBTTask
//
//  Created by Isa Aliev on 21.04.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseCellModel.h"

@interface PaymentDetailsBaseCell : UITableViewCell

@property (strong, nonatomic) BaseCellModel *viewModel;

- (void)updateViews;
    
@end
