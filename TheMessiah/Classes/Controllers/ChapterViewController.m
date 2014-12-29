//
//  ChapterViewController.m
//  TheMessiah
//
//  Created by Peter Jensen on 12/9/14.
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

#import "ChapterViewController.h"

#import "NSCoder+JCMCoreData.h" // For -jcm_encodeCoreDataObject:forKey:

#import "UIFont+YHWHCustomFont.h" // For +yhwh_preferredCustomFontForTextStyle:

#import "TableViewCell.h"

#import "KJVChapter.h"
#import "KJVVerse.h"

@import CoreText; // For kLowerCaseType declaration

@interface ChapterViewController ()

@end

@implementation ChapterViewController

@synthesize chapter = _chapter;

#pragma mark - Getters and setters

- (void)setChapter:(KJVChapter *)aChapter
{
    if (_chapter != aChapter)
    {
        _chapter = aChapter;
        self.fetchedResults = [_chapter.versesSet array];
        self.title = _chapter.title;
    }
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Scene management

#pragma mark - <UITableviewDataSource>

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @"Scripture quotations are from The Authorized (King James) Version (KJV). "
    "Rights in the Authorized Version in the United Kingdom are vested in the Crown. "
    "Used by permission of the Crown’s patentee, Cambridge University Press.";
}

#pragma mark - <UIStateRestoring>

static NSString *ChapterIDKey = @"ChapterIDKey";

- (void)encodeRestorableStateWithCoder:(NSCoder *)coder
{
    [super encodeRestorableStateWithCoder:coder];

    [coder jcm_encodeCoreDataObject:self.chapter forKey:ChapterIDKey];
}

- (void)decodeRestorableStateWithCoder:(NSCoder *)coder
{
    [super decodeRestorableStateWithCoder:coder];

    self.chapter = (KJVChapter *)[coder jcm_decodeCoreDataObjectForKey:ChapterIDKey];
}

#pragma mark - Notification handlers

#pragma mark - Actions

/**
 @warn Using dismiss target action instead of unwind segue for 3 reasons:
 1. Unwind segues need workaround for 8.0
 2. Unwind segues + state restoration need workaround for 8.1
 3. Reports of modals still undismissable on 8.1.1 even with workaround.
 */
- (IBAction)dismiss:(UIBarButtonItem *)sender
{
    // Even though we're the presented view controller, it is the presenting view
    // controller that will actually dismiss us
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)navigateBack:(UISwipeGestureRecognizer *)sender // Swipe right
{
    self.chapter = self.chapter.previousChapter;
    [self.tableView reloadData];
}

- (IBAction)navigateForward:(UISwipeGestureRecognizer *)sender // Swipe left
{
    self.chapter = self.chapter.nextChapter;
    [self.tableView reloadData];
}

#pragma mark - Private methods

- (CGFloat)p_determineRowHeightForPreferredFont
{
    NSString *category = [[UIApplication sharedApplication] preferredContentSizeCategory];

    if ([category isEqualToString:UIContentSizeCategoryLarge])
    {
        return 79.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryMedium])
    {
        return 74.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryExtraLarge])
    {
        return 92.0;
    }
    else if ([category isEqualToString:UIContentSizeCategorySmall])
    {
        return 68.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryExtraExtraLarge])
    {
        return 107.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryExtraSmall])
    {
        return 63.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryExtraExtraExtraLarge])
    {
        return 121.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryAccessibilityMedium])
    {
        return 172.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryAccessibilityLarge])
    {
        return 230.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryAccessibilityExtraLarge])
    {
        return 329.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryAccessibilityExtraExtraLarge])
    {
        return 457.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryAccessibilityExtraExtraExtraLarge])
    {
        return 590.0;
    }

    return 79.0;
}

/**
 Use the small caps variant for any text delimited by zero-width spaces

 @param text The bible verse text.

 @return The styled bible verse text.
 */
- (NSMutableAttributedString *)applySmallCapsToText:(NSString *)text
{
    // Setup the small caps font variant

    UIFontDescriptor *descriptor = [[UIFont yhwh_preferredCustomFontForTextStyle:UIFontTextStyleBody] fontDescriptor];
    NSArray *array = @[@{ UIFontFeatureTypeIdentifierKey : @(kLowerCaseType),
                          UIFontFeatureSelectorIdentifierKey : @(kLowerCaseSmallCapsSelector) }];

    descriptor = [descriptor fontDescriptorByAddingAttributes:@{ UIFontDescriptorFeatureSettingsAttribute : array }];
    UIFont *smallCapsFont = [UIFont fontWithDescriptor:descriptor size:0.0f];

    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:text attributes:@{NSFontAttributeName : [UIFont preferredFontForTextStyle:UIFontTextStyleBody]}];

    NSUInteger textLength = [attributedText length];
    NSRange textRange = NSMakeRange(0, textLength);

    // Look for any words (e.g., Lord) delimited by zero-width spaces, and display
    // them in small caps

    NSString *bracketedByDelimiter = @"\u200b[^\u200b]+\u200b";

    NSRange bracketedRange = [text rangeOfString:bracketedByDelimiter
                                         options:NSRegularExpressionSearch
                                           range:textRange];

    while (bracketedRange.location != NSNotFound)
    {
        // Apply small-caps to this substring
        [attributedText addAttribute:NSFontAttributeName value:smallCapsFont range:bracketedRange];

        // Advance the search range past the previous match
        textRange.location = bracketedRange.location + bracketedRange.length;

        if (textRange.location >= textLength)
        {
            // At end of string. Stop searching
            bracketedRange.location = NSNotFound;
        }
        else
        {
            // Adjust searchRange length
            textRange.length = textLength - textRange.location;
            // Check for another set of delimiters
            bracketedRange = [text rangeOfString:bracketedByDelimiter
                                         options:NSRegularExpressionSearch
                                           range:textRange];
        }
    }
    
    return attributedText;
}

- (void)configureCell:(TableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    KJVVerse *verse = self.fetchedResults[indexPath.row];

    if ([verse.text rangeOfString:@"\u200b"].location == NSNotFound)
    {
        cell.titleLabel.text = verse.text;
        cell.titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    }
    else
    {
        cell.titleLabel.attributedText = [self applySmallCapsToText:verse.text];
    }
}

@end
