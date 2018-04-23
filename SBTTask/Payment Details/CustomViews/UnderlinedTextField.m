//
//  UnderlinedTextField.m
//  SBTTask
//
//  Created by Isa Aliev on 22.04.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import "UnderlinedTextField.h"

@interface UnderlinedTextField ()

@property (strong, nonatomic) UIView *underlineView;

@end

@implementation UnderlinedTextField

- (void)layoutSubviews {
    [super layoutSubviews];

    self.underlineView.backgroundColor = self.lineColor;
}

- (void)didMoveToSuperview {
    if (self.underlineView != nil) {
        return;
    }

    [self addLineView];
    [self setConstraintsForLineView];
}

- (void)addLineView {
    UIView *line = [[UIView  alloc] init];
    
    [self.superview addSubview:line];
    self.underlineView = line;
}

- (void)setConstraintsForLineView {
    self.underlineView.translatesAutoresizingMaskIntoConstraints = false;
    
    NSArray *constraints = @[[self.underlineView.topAnchor constraintEqualToAnchor:self.bottomAnchor constant:3.0],
                             [self.underlineView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
                             [self.underlineView.widthAnchor constraintEqualToAnchor:self.widthAnchor],
                             [self.underlineView.heightAnchor
                              constraintEqualToConstant:1.0]];
    
    [NSLayoutConstraint activateConstraints:constraints];
}

@end
