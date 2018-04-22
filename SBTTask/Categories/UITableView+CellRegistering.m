//
//  UITableView+CellRegistering.m
//  SBTTask
//
//  Created by Isa Aliev on 21.04.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import "UITableView+CellRegistering.h"

@implementation UITableView (CellRegistering)

- (void)registerCellForIdentifier:(NSString *)identifier withClass:(__unsafe_unretained Class)class {
    [self registerClass:class forCellReuseIdentifier:identifier];
    [self registerNib:[UINib nibWithNibName:identifier bundle:NSBundle.mainBundle] forCellReuseIdentifier:identifier];
}

- (void)registerCellForIdentifier:(NSString *)identifier {
    [self registerClass:NSClassFromString(identifier) forCellReuseIdentifier:identifier];
    [self registerNib:[UINib nibWithNibName:identifier bundle:NSBundle.mainBundle] forCellReuseIdentifier:identifier];
}

@end
