//
//  NSDate+NSString.m
//  SBTTask
//
//  Created by Isa Aliev on 22.04.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import "NSDate+NSString.h"

@implementation NSDate (NSString)

- (NSString *)defaultDateString {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"dd.MM.yyyy";
    
    return [dateFormatter stringFromDate:self];
}

@end
