//
//  UITableView+CellRegistering.h
//  SBTTask
//
//  Created by Isa Aliev on 21.04.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (CellRegistering)

- (void)registerCellForIdentifier:(NSString *)identifier withClass:(__unsafe_unretained Class)class;

@end
