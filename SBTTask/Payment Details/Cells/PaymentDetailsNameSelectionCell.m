//
//  PaymentDetailsNameSelectionCell.m
//  SBTTask
//
//  Created by Isa Aliev on 21.04.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import "PaymentDetailsNameSelectionCell.h"
#import "PaymentDetailsNameSelectionCellModel.h"

#import "UITextView+TextSize.h"

@interface PaymentDetailsNameSelectionCell ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameTextViewHeightConstraint;
@property (weak, nonatomic) IBOutlet UITextView *nameTextView;
@property (weak, nonatomic) IBOutlet UILabel *placeholderLabel;

@end

@implementation PaymentDetailsNameSelectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.nameTextView.textContainerInset = UIEdgeInsetsZero;
    self.nameTextView.textContainer.lineBreakMode = NSLineBreakByWordWrapping;
    self.nameTextView.textContainer.lineFragmentPadding = 0.0;
}

- (void)updateViews {
    self.nameTextView.text = ((PaymentDetailsNameSelectionCellModel *)[self viewModel]).name;
}

- (void)textViewDidChange:(UITextView *)textView {
    NSUInteger textLength = textView.text.length;
    NSString *text = textView.text;
    
    [self.placeholderLabel setHidden:textLength > 0];
    
    if (textLength == 0) {
        self.nameTextViewHeightConstraint.constant = 44.0;
        ((PaymentDetailsNameSelectionCellModel *)[self viewModel]).name = text;
        
        return;
    }
    
    self.nameTextViewHeightConstraint.constant = self.nameTextView.textHeight;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.nameTextView scrollRangeToVisible:NSMakeRange(textLength - 1, 0)];
    });
    
    ((PaymentDetailsNameSelectionCellModel *)[self viewModel]).name = text;
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        
        return NO;
    }
    
    return YES;
}

@end
