//
//  DetailViewController.m
//  TheMessiah
//
//  Created by Peter Jensen on 11/3/14.
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

#import "DetailViewController.h"

#import "ChapterViewController.h"

#import "TableViewCell.h"

#import "Constants.h" // For kJCMLastOldTestamentBook

#import "NSCoder+JCMCoreData.h" // For -jcm_encodeCoreDataObject:forKey:

#import "UIFont+YHWHCustomFont.h" // For +yhwh_preferredCustomFontForTextStyle:

#import "UISegmentedControl+YHWHSegmentIndex.h" // For -yhwh_selectSegmentWithTitle:

#import "JCMSubject.h"
#import "JCMProphecy.h"
#import "JCMVerse.h"
#import "KJVChapter.h"

@import CoreText; // For kLowerCaseType declaration

@interface DetailViewController ()
/**
 A bible version segmented control.

 Displays names of selected/alternate bible translations.
 */
@property (nonatomic, strong) UISegmentedControl *versionSegmentedControl;
/**
 (Abbreviation for) The selected bible version.
 */
@property (nonatomic, strong) NSString *selectedVersion;
/**
 Key for the selected bible version.
 */
@property (nonatomic, strong) NSString *selectedVersionKey;
/**
 Copyright message corresponding to the selected bible version.
 */
@property (nonatomic, strong) NSString *versionCopyright;

@end

@implementation DetailViewController

@synthesize versionSegmentedControl = _versionSegmentedControl;
@synthesize selectedVersion = _selectedVersion;
@synthesize selectedVersionKey = _selectedVersionKey;
@synthesize versionCopyright = _versionCopyright;

#pragma mark - Getters and setters

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    // Using toolbarItems lets the controller manage its bottom layout guide, which
    // will control the content's edge insets. (This is doubly important for auto
    // rotation, as the iPhone's toolbar height changes depending on orientation.)

    [self setupBibleVersionToolbarItems];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Scene management

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showChapter"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        JCMProphecy *promise = self.subject.prophecies[indexPath.section];
        JCMVerse *verse = promise.verses[indexPath.row];

        KJVChapter *chapter = verse.chapter;

        ChapterViewController *controller = (ChapterViewController *)[[segue destinationViewController] topViewController];
        controller.managedObjectContext = self.managedObjectContext;
        controller.chapter = chapter;
    }
}

#pragma mark - <UITableviewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.subject ? [self.subject.prophecies count] : 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.subject.prophecies[section] verses] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.subject.subtitle;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    if (self.subject && section == self.subject.prophecies.count - 1)
    {
        return self.versionCopyright;
    }
    return @"";
}

#pragma mark - <UITableViewDelegate>

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - <UIStateRestoring>

static NSString *SubjectIDKey = @"SubjectIDKey";

- (void)encodeRestorableStateWithCoder:(NSCoder *)coder
{
    [super encodeRestorableStateWithCoder:coder];

    [coder jcm_encodeCoreDataObject:self.subject forKey:SubjectIDKey];
}

- (void)decodeRestorableStateWithCoder:(NSCoder *)coder
{
    [super decodeRestorableStateWithCoder:coder];

    self.subject = (JCMSubject *)[coder jcm_decodeCoreDataObjectForKey:SubjectIDKey];
}

- (void)applicationFinishedRestoringState
{
    self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
    self.navigationItem.leftItemsSupplementBackButton = YES;

    [self.tableView reloadData];
}

#pragma mark - Notification handlers

#pragma mark - Actions

- (void)versionChanged:(UISegmentedControl *)sender
{
    self.selectedVersion = [sender yhwh_titleForSelectedSegment];
    self.selectedVersionKey = [NSString stringWithFormat:@"text%@", self.selectedVersion];

    // Save the new version in user defaults

    [[NSUserDefaults standardUserDefaults] setValue:self.selectedVersion forKey:kJCMBibleVersionKey];

    // Change the copyright message to match the selected version

    self.versionCopyright = [self copyrightForVersion:self.selectedVersion];

    [self.tableView reloadData];
}

#pragma mark - Private methods

- (CGFloat)p_determineRowHeightForPreferredFont
{
    NSString *category = [[UIApplication sharedApplication] preferredContentSizeCategory];

    if ([category isEqualToString:UIContentSizeCategoryLarge])
    {
        return 152.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryMedium])
    {
        return 138.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryExtraLarge])
    {
        return 170.0;
    }
    else if ([category isEqualToString:UIContentSizeCategorySmall])
    {
        return 125.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryExtraExtraLarge])
    {
        return 202.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryExtraSmall])
    {
        return 118.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryExtraExtraExtraLarge])
    {
        return 223.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryAccessibilityMedium])
    {
        return 293.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryAccessibilityLarge])
    {
        return 398.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryAccessibilityExtraLarge])
    {
        return 541.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryAccessibilityExtraExtraLarge])
    {
        return 686.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryAccessibilityExtraExtraExtraLarge])
    {
        return 872.0;
    }

    return 152.0;
}

/**
 Setup a segmented control of bible versions, and add it to the toolbar
 */
- (void)setupBibleVersionToolbarItems
{
    self.versionSegmentedControl = [[UISegmentedControl alloc] initWithItems:[self allBibleVersions]];
    self.versionSegmentedControl.opaque = NO;
    [self.versionSegmentedControl addTarget:self
                                     action:@selector(versionChanged:)
                           forControlEvents:UIControlEventValueChanged];

    UIBarButtonItem *bibleVersionItem = [[UIBarButtonItem alloc]
                                         initWithCustomView:(UIView *)self.versionSegmentedControl];
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                      target:nil
                                      action:nil];

    self.toolbarItems = @[flexibleSpace, bibleVersionItem, flexibleSpace];

    // Default to the last bible version that the user had selected

    NSString *version = [[NSUserDefaults standardUserDefaults] stringForKey:kJCMBibleVersionKey];

    [self.versionSegmentedControl yhwh_selectSegmentWithTitle:version];

    self.selectedVersion = [self.versionSegmentedControl yhwh_titleForSelectedSegment];

    self.selectedVersionKey = [NSString stringWithFormat:@"text%@", self.selectedVersion];

    self.versionCopyright = [self copyrightForVersion:self.selectedVersion];
}

- (NSArray *)allBibleVersions
{
    if (!self.managedObjectContext)
    {
        id delegate = [[UIApplication sharedApplication] delegate];
        self.managedObjectContext = [delegate performSelector:@selector(managedObjectContext)];
    }

    NSString *verseEntityName = [[JCMVerse class] entityName];
    NSEntityDescription *verseEntityDescription = [NSEntityDescription entityForName:verseEntityName inManagedObjectContext:self.managedObjectContext];

    NSDictionary *verseAttributes = [verseEntityDescription attributesByName];

    NSMutableArray *bibleVersions = [[NSMutableArray alloc] init];
    NSString *bibleVersionPrefix = @"text";

    for (NSString *attribute in verseAttributes)
    {
        if ([attribute hasPrefix:bibleVersionPrefix])
        {
            NSString *version = [attribute substringFromIndex:[bibleVersionPrefix length]];
            if ([version length])
            {
                [bibleVersions addObject:version];
            }
        }
    }

    return [bibleVersions sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
}

- (NSString *)copyrightForVersion:(NSString *)version
{
    NSDictionary *copyright = @{
                                @"ESV" : @"Scripture quotations are from The Holy Bible, English Standard Version® (ESV®). "
                                "Copyright © 2001 by Crossway, a publishing ministry of Good News Publishers. "
                                "Used by permission. All rights reserved.",
                                @"KJV" : @"Scripture quotations are from The Authorized (King James) Version (KJV). "
                                "Rights in the Authorized Version in the United Kingdom are vested in the Crown. "
                                "Used by permission of the Crown’s patentee, Cambridge University Press.",
                                @"NASB" : @"Scripture quotations are from the New American Standard Bible® (NASB®). "
                                "Copyright © 1960, 1962, 1963, 1968, 1971, 1972, 1973, 1975, 1977, 1995 by The Lockman Foundation. "
                                "Used by permission.",
//                                @"NIV"  : @"Scripture quotations are from The Holy Bible, New International Version® (NIV®). "
//                                "Copyright © 1973, 1978, 1984, 2011 by Biblica, Inc.® "
//                                "Used by permission. All rights reserved worldwide.",
//                                @"NKJV" : @"Scripture quotations are from the New King James Version® (NKJV®). "
//                                "Copyright © 1982 by Thomas Nelson, Inc. "
//                                "Used by permission. All rights reserved.",
//                                @"NLT"  : @"Scripture quotations are from the Holy Bible, New Living Translation® (NLT®). "
//                                "Copyright © 1996, 2004, 2007 by Tyndale House Foundation. "
//                                "Used by permission of Tyndale House Publishers, Inc., Carol Stream, Illinois 60188. All rights reserved.",
//                                @"WEB" : @"Scripture quotations are from the World English Bible™ (WEB). "
//                                "The World English Bible is in the Public Domain."
                                };

    return copyright[version];
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
    JCMProphecy *promise = self.subject.prophecies[indexPath.section];

    JCMVerse *verse = promise.verses[indexPath.row];

    NSString *verseText = [verse valueForKey:self.selectedVersionKey];

    if ([verseText rangeOfString:@"\u200b"].location == NSNotFound)
    {
        cell.titleLabel.text = verseText;
        cell.titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    }
    else
    {
        cell.titleLabel.attributedText = [self applySmallCapsToText:verseText];
    }

    cell.detailLabel.text = [NSString stringWithFormat:@"—%@", verse.reference];
    cell.detailLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];

    // "Read full chapter" label
    cell.subtitleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}

@end
