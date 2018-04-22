//
//  NSObject+Observe.m
//  SBTTask
//
//  Created by Isa Aliev on 22.04.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import "NSObject+Observe.h"

@implementation NSObject (Observe)

- (void)observeKeyPaths:(NSArray *)keyPaths {
    for (NSString *keyPath in keyPaths) {
        [self addObserver:self forKeyPath:keyPath options:0 context:nil];
    }
}

- (void)removeObservingOfKeyPaths:(NSArray *)keyPaths {
    for (NSString *keyPath in keyPaths) {
        [self removeObserver:self forKeyPath:keyPath];
    }
}

@end
