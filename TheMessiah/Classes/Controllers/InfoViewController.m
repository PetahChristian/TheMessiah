//
//  InfoViewController.m
//  TheMessiah
//
//  Created by Peter Jensen on 11/21/14.
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

#import "InfoViewController.h"

#import "TableViewCell.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

#pragma mark - Getters and setters

- (NSArray *)fetchedResults
{
    if (super.fetchedResults != nil) {
        return super.fetchedResults;
    }

    return @[@[@"After His resurrection, Jesus appears to two of His disciples on the road to Emmaus. Jesus explains to them, beginning from Moses and from all the prophets, the scriptures concerning Himself.\n\nMay God give us a deeper understanding of all the scriptures declare about Him. God bless you."],
             @[@"The Romans Road"],
             @[@"Bible Memory", @"Names of God"],
             @[@"Email developer"],
             ];
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

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if ([identifier isEqualToString:@"showSalvation"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];

        return indexPath.section == kJCMTableViewSectionSalvation ? YES : NO;
    }

    return YES;
}

#pragma mark - <UITableviewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.fetchedResults count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.fetchedResults[section] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @[@"The Messiah",
             @"Salvation",
             @"Other apps",
             @"App help and feedback",
             ][section];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @[@"Jesus is the Christ. He is King of kings and Lord of lords. His kingdom is eternal. His reign will never end. He is coming soon.",
             @"",
             @"",
             @"More bible versions will be added as publishers grant permission.",
             ][section];
}

#pragma mark - <UITableviewDelegate>

static const NSUInteger kJCMTableViewSectionTheMessiah = 0;
static const NSUInteger kJCMTableViewSectionSalvation = 1;
static const NSUInteger kJCMTableViewSectionOtherApps = 2;
static const NSUInteger kJCMTableViewSectionComposeEmail = 3;

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];

    NSInteger section = [indexPath section];

    if (section == kJCMTableViewSectionOtherApps || section == kJCMTableViewSectionComposeEmail)
    {
        [self openURLForRow:[indexPath row] inSection:section];
    }
}

#pragma mark - <UIStateRestoring>

- (void)encodeRestorableStateWithCoder:(NSCoder *)coder
{
    [super encodeRestorableStateWithCoder:coder];
}

- (void)decodeRestorableStateWithCoder:(NSCoder *)coder
{
    [super decodeRestorableStateWithCoder:coder];
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

#pragma mark - Private methods

- (void)openURLForRow:(NSInteger)row inSection:(NSInteger)section
{
    NSURL *url = nil;

    if (section == kJCMTableViewSectionComposeEmail)
    {
        url = [NSURL URLWithString:@"mailto:BibleMemoryApp@gmail.com?subject=The%20Messiah%20app"];
    }
    else if (section == kJCMTableViewSectionOtherApps)
    {
        if (row)
        {
            url = [NSURL URLWithString:@"https://itunes.apple.com/app/names-of-god-from-the-bible/id860449184?mt=8"];
        }
        else
        {
            url = [NSURL URLWithString:@"https://itunes.apple.com/app/bible-memory-to-god-be-glory/id714235223?mt=8"];
        }
    }

    if (url) {
        [[UIApplication sharedApplication] openURL:url];
    }
}

- (CGFloat)p_determineRowHeightForPreferredFont
{
    NSString *category = [[UIApplication sharedApplication] preferredContentSizeCategory];

    if ([category isEqualToString:UIContentSizeCategoryLarge])
    {
        return 45.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryMedium])
    {
        return 44.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryExtraLarge])
    {
        return 47.0;
    }
    else if ([category isEqualToString:UIContentSizeCategorySmall])
    {
        return 42.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryExtraExtraLarge])
    {
        return 48.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryExtraSmall])
    {
        return 41.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryExtraExtraExtraLarge])
    {
        return 48.0;
    }

    return 45.0;
}

static const CGFloat kJCMBodyPointSizeCeiling = 20.0; // Largest non-accessibility point size

- (void)configureCell:(TableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *text = self.fetchedResults[indexPath.section][indexPath.row];

    if (indexPath.section == kJCMTableViewSectionOtherApps)
    {
        cell.textLabel.text = text;
        cell.titleLabel.text = @" ";
        cell.imageView.image = indexPath.row ? [UIImage imageNamed:@"OtherAppsNamesOfGod"] : [UIImage imageNamed:@"OtherAppsBibleMemory"];
    }
    else
    {
        cell.textLabel.text = nil;
        cell.titleLabel.text = text;
        cell.imageView.image = nil;
    }

    // Use body pointsize, up to but not including larger accessibility sizes
    CGFloat pointSize = [[UIFont preferredFontForTextStyle:UIFontTextStyleBody] pointSize];
    pointSize = MIN(pointSize, kJCMBodyPointSizeCeiling);

    UIFont *font = [UIFont systemFontOfSize:pointSize];

    cell.textLabel.font = font;
    cell.titleLabel.font = font;
}

- (void)configureAccessoryTypeForCell:(TableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == kJCMTableViewSectionTheMessiah)
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
}

@end
