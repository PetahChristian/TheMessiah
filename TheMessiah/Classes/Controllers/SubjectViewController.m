//
//  SubjectViewController.m
//  TheMessiah
//
//  Created by Peter Jensen on 11/17/14.
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

#import "SubjectViewController.h"

#import "DetailViewController.h"

#import "TableViewCell.h"

#import "NSCoder+JCMCoreData.h" // For -jcm_encodeCoreDataObject:forKey:

#import "JCMBook.h"
#import "JCMSubject.h" // Entity for fetchedResults when not limited to book
#import "JCMReference.h" // Entity for fetchedResults when limited to book

@interface SubjectViewController ()

@end

@implementation SubjectViewController

@synthesize subject = _subject;

#pragma mark - Initialization

// Override to support custom initialization.
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        // Custom initialization
        NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
        [notificationCenter addObserver:self
                               selector:@selector(showDetailTargetDidChange:)
                                   name:UIViewControllerShowDetailTargetDidChangeNotification
                                 object:nil];
    }
    return self;
}

- (void)dealloc
{
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter removeObserver:self name:UIViewControllerShowDetailTargetDidChangeNotification object:nil];
}

#pragma mark - Getters and setters

- (void)setSubject:(NSManagedObject *)aSubject
{
    if (_subject != aSubject)
    {
        _subject = aSubject;

        NSString *relationshipKey = [_subject isKindOfClass:[JCMBook class]] ? @"references" : @"subjects";
        self.fetchedResults = [[_subject valueForKey:relationshipKey] allObjects];
        self.title = [_subject valueForKey:@"title"];
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        JCMSubject *subject = [self.subject isKindOfClass:[JCMBook class]] ? [(JCMReference *)self.fetchedResults[indexPath.row] subject] : self.fetchedResults[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        controller.managedObjectContext = self.managedObjectContext;
        controller.subject = subject;
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark - <UITableviewDataSource>

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

    self.subject = [coder jcm_decodeCoreDataObjectForKey:SubjectIDKey];
}

#pragma mark - Notification handlers

- (void)showDetailTargetDidChange:(NSNotification *)__unused notification
{
    // Whenever the target for showDetailViewController: changes, update all of our cells (to ensure they have the right accessory type)
    [self.tableView reloadRowsAtIndexPaths:[self.tableView indexPathsForVisibleRows]
                          withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Actions

#pragma mark - Private methods

- (CGFloat)p_determineRowHeightForPreferredFont
{
    NSString *category = [[UIApplication sharedApplication] preferredContentSizeCategory];

    if ([category isEqualToString:UIContentSizeCategoryLarge])
    {
        return 78.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryMedium])
    {
        return 73.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryExtraLarge])
    {
        return 88.0;
    }
    else if ([category isEqualToString:UIContentSizeCategorySmall])
    {
        return 69.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryExtraExtraLarge])
    {
        return 98.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryExtraSmall])
    {
        return 62.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryExtraExtraExtraLarge])
    {
        return 108.0;
    }

    return 78.0;
}

- (void)configureCell:(TableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.subject isKindOfClass:[JCMBook class]])
    {
        JCMReference *reference = self.fetchedResults[indexPath.row];

        cell.titleLabel.text = reference.reference;
        cell.subtitleLabel.text = reference.subject.subtitle;
    }
    else
    {
        JCMSubject *subject = self.fetchedResults[indexPath.row];

        cell.titleLabel.text = subject.title;
        cell.subtitleLabel.text = subject.subtitle;
    }

    cell.titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    cell.subtitleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
}

- (void)configureAccessoryTypeForCell:(TableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Only show a disclosure indicator if collapsed

    BOOL showDisclosureIndicator = self.splitViewController.collapsed;

    cell.accessoryType = showDisclosureIndicator ? UITableViewCellAccessoryDisclosureIndicator : UITableViewCellAccessoryNone;
}

@end
