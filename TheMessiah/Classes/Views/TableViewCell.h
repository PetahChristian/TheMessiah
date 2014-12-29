//
//  TableViewCell.h
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

@import UIKit;

/**
 Both master and detail view controllers use this custom tableView cell to show
 prophetic details such as category or reference, number of prophecies, and verse.
 */
@interface TableViewCell : UITableViewCell
/**
 Primary content, always prominently featured in the upper left of the cell.
 */
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
/**
 Secondary details, located along the right side of the cell.
 */
@property (nonatomic, strong) IBOutlet UILabel *detailLabel;
/**
 Secondary content, located under the primary content.
 */
@property (nonatomic, strong) IBOutlet UILabel *subtitleLabel;
/**
 Leading horizontal space constraints
 */
@property (nonatomic, strong) IBOutletCollection(NSLayoutConstraint) NSArray *leadingMargins;
/**
 Trailing horizontal space constraints
 */
@property (nonatomic, strong) IBOutletCollection(NSLayoutConstraint) NSArray *trailingMargins;

/**
 Set leading and trailing constraints to match separator inset
 */
- (void)adjustConstraintsToMatchSeparatorInset:(UIEdgeInsets)inset;
/**
 Adjust cell size to match (tableview) width (to work around autolayout issues)
 */
- (void)adjustSizeToMatchWidth:(CGFloat)width;

@end
