//
//  BaseCellModel.h
//  SBTTask
//
//  Created by Isa Aliev on 21.04.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BaseCellModel : NSObject

@property (strong, nonatomic, readonly) NSString *identifier;
@property (assign, nonatomic, readonly) CGFloat height;

@end
