//
//  UITextView+TextSize.m
//  SBTTask
//
//  Created by Isa Aliev on 06.05.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import "UITextView+TextSize.h"

@implementation UITextView (TextSize)

- (CGFloat)textHeight {
    NSMutableDictionary *attributes = [NSMutableDictionary new];
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineBreakMode = self.textContainer.lineBreakMode;
    
    attributes[NSParagraphStyleAttributeName] = paragraphStyle;
    attributes[NSFontAttributeName] = self.font;
    
    return [[self text] boundingRectWithSize:CGSizeMake(self.frame.size.width, CGFLOAT_MAX)
                                     options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                  attributes:attributes context:nil].size.height;
}

@end
