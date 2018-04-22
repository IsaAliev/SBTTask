//
//  NSObject+Observe.h
//  SBTTask
//
//  Created by Isa Aliev on 22.04.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Observe)

- (void)observeKeyPaths:(NSArray *)keyPaths;
- (void)removeObservingOfKeyPaths:(NSArray *)keyPaths;

@end
