//
//  PaymentDetailsNameSelectionCell.m
//  SBTTask
//
//  Created by Isa Aliev on 21.04.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import "PaymentDetailsNameSelectionCell.h"
#import "PaymentDetailsNameSelectionCellModel.h"

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
    [self.placeholderLabel setHidden:[[textView text] length] > 0];
    
    if ([[textView text] length] == 0) {
        self.nameTextViewHeightConstraint.constant = 44.0;
        ((PaymentDetailsNameSelectionCellModel *)[self viewModel]).name = textView.text;
        
        return;
    }
    
    NSMutableDictionary *attributes = [NSMutableDictionary new];
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;

    attributes[NSParagraphStyleAttributeName] = paragraphStyle;
    attributes[NSFontAttributeName] = [UIFont systemFontOfSize:18.0];
    
    self.nameTextViewHeightConstraint.constant = [[textView text] boundingRectWithSize:CGSizeMake(self.nameTextView.frame.size.width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil].size.height;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.nameTextView scrollRangeToVisible:NSMakeRange(self.nameTextView.text.length - 1, 0)];
    });
    
    ((PaymentDetailsNameSelectionCellModel *)[self viewModel]).name = textView.text;
}

@end
