//
//  TableViewCell.m
//  TheMessiah
//
//  Created by Peter Jensen on 11/14/14.
//  Copyright (c) 2014 Peter Christian Jensen.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

#import "TableViewCell.h"

@interface TableViewCell ()

@end

@implementation TableViewCell

@synthesize titleLabel = _titleLabel;
@synthesize detailLabel = _detailLabel;
@synthesize subtitleLabel = _subtitleLabel;
@synthesize leadingMargins = _leadingMargins;
@synthesize trailingMargins = _trailingMargins;

/**
 Handle button-like label highlighting for a cell with no selection
 */
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];

    if ([self.subtitleLabel.text isEqualToString:@"Read full chapter"])
    {
        self.subtitleLabel.textColor = highlighted ? self.subtitleLabel.highlightedTextColor : self.subtitleLabel.tintColor;
    }
}

- (void)adjustConstraintsToMatchSeparatorInset:(UIEdgeInsets)inset
{
    if (self.leadingMargins)
    {
        for (NSLayoutConstraint *constraint in self.leadingMargins)
        {
            constraint.constant = inset.left;
        }
    }

    if (self.trailingMargins)
    {
        for (NSLayoutConstraint *constraint in self.trailingMargins)
        {
            constraint.constant = self.accessoryType == UITableViewCellAccessoryDisclosureIndicator ? 0.0f : inset.left;
        }
    }
}

- (void)adjustSizeToMatchWidth:(CGFloat)width
{
    // Workaround for visible cells not laid out properly since their layout was
    // based on a different (initial) width from the tableView.

    CGRect rect = self.frame;
    rect.size.width = width;
    self.frame = rect;

    // Workaround for initial cell height less than auto layout required height.

    rect = self.contentView.bounds;
    rect.size.height = 99999.0;
    rect.size.width = 99999.0;
    self.contentView.bounds = rect;
}

@end
