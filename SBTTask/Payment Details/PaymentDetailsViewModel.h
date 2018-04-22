//
//  PaymentDetailsViewModel.h
//  SBTTask
//
//  Created by Isa Aliev on 21.04.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BaseCellModel;

@interface PaymentDetailsViewModel : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSMutableArray<BaseCellModel *> *cellModels;

@end
