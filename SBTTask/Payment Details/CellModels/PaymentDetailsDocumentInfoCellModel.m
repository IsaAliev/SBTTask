//
//  PaymentDetailsDocumentInfoCellModel.m
//  SBTTask
//
//  Created by Isa Aliev on 21.04.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import "PaymentDetailsDocumentInfoCellModel.h"

@implementation PaymentDetailsDocumentInfoCellModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.numberString = @"№ 53";
        self.dateString = @"04.02.2017";
    }
    
    return self;
}
    
- (NSString *)identifier {
    return @"PaymentDetailsDocumentInfoCell";
}
    
@end
