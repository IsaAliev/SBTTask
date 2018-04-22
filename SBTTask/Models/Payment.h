//
//  Payment.h
//  SBTTask
//
//  Created by Isa Aliev on 22.04.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Payment : NSObject

@property (strong, nonatomic) NSDate *date;
@property (assign, nonatomic) float amoutInRubles;
@property (strong, nonatomic) NSString *documentNumberString;
@property (strong, nonatomic) NSString *taxesCalculationTypeName;

+ (Payment *)dummyPayment;

@end
