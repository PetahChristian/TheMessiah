//
//  MasterViewController.m
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

#import "MasterViewController.h"
#import "SubjectViewController.h"

#import "TableViewCell.h"

#import "Constants.h" // For user defaults preference keys

#import "JCMCategory.h" // Entity for fetchedResults
#import "JCMBook.h" // Entity for fetchedResults

@interface MasterViewController ()
/**
 A segmented control in the navigation bar that lets the user select how prophecies
 should be grouped.
 */
@property (nonatomic, weak) IBOutlet UISegmentedControl *groupBySegmentedControl;

@end

@implementation MasterViewController

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

- (NSArray *)fetchedResults
{
    if (super.fetchedResults != nil) {
        return super.fetchedResults;
    }

    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];

    [fetchRequest setFetchBatchSize:20];

    if ([self isGroupByBook])
    {
        [fetchRequest setEntity:[JCMBook entityInManagedObjectContext:self.managedObjectContext]];
    }
    else // default to kJCMProphecyGroupByCategory
    {
        [fetchRequest setEntity:[JCMCategory entityInManagedObjectContext:self.managedObjectContext]];
    }

    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"order" ascending:YES];
    NSArray *sortDescriptors = @[sortDescriptor];

    [fetchRequest setSortDescriptors:sortDescriptors];

    NSError *error;
    NSArray *array = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];

    return array;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    // Default to the last grouped by preference that the user had selected

    NSUInteger groupedBy = [[NSUserDefaults standardUserDefaults] integerForKey:kJCMProphecyGroupByKey];

    [self.groupBySegmentedControl setSelectedSegmentIndex:groupedBy];
    self.title = [self isGroupByBook] ? @"Books" : @"Categories";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Scene management

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showSubject"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        SubjectViewController *controller = (SubjectViewController *)[segue destinationViewController];
        controller.managedObjectContext = self.managedObjectContext;
        controller.subject = self.fetchedResults[indexPath.row];
    }
}

#pragma mark - <UITableviewDataSource>

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

- (void)showDetailTargetDidChange:(NSNotification *)__unused notification
{
    // Whenever the target for showDetailViewController: changes, update all of our cells (to ensure they have the right accessory type)
    [self.tableView reloadRowsAtIndexPaths:[self.tableView indexPathsForVisibleRows]
                          withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Actions

- (IBAction)groupByChanged:(UISegmentedControl *)sender
{
    self.tableView.contentOffset = CGPointMake(0, 0 - self.tableView.contentInset.top);
    self.fetchedResults = nil;
    [self.tableView reloadData];

    // Save the new version in user defaults

    [[NSUserDefaults standardUserDefaults] setValue:@(self.groupBySegmentedControl.selectedSegmentIndex) forKey:kJCMProphecyGroupByKey];
    self.title = [self isGroupByBook] ? @"Books" : @"Categories";
}

#pragma mark - Private methods

- (CGFloat)p_determineRowHeightForPreferredFont
{
    NSString *category = [[UIApplication sharedApplication] preferredContentSizeCategory];

    if ([category isEqualToString:UIContentSizeCategoryLarge])
    {
        return 67.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryMedium])
    {
        return 64.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryExtraLarge])
    {
        return 74.0;
    }
    else if ([category isEqualToString:UIContentSizeCategorySmall])
    {
        return 59.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryExtraExtraLarge])
    {
        return 83.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryExtraSmall])
    {
        return 55.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryExtraExtraExtraLarge])
    {
        return 90.0;
    }

    return 67.0;
}

/**
 Determines whether prophecies are grouped by book
 
 @return Returns YES if Book is selected, NO otherwise
 */
- (BOOL)isGroupByBook
{
    return self.groupBySegmentedControl.selectedSegmentIndex == kJCMProphecyGroupByBook;
}

- (void)configureCell:(TableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self isGroupByBook])
    {
        JCMBook *book = self.fetchedResults[indexPath.row];
        cell.titleLabel.text = book.title;
        if (book.orderValue <= kJCMLastOldTestamentBook)
        {
            // Display number of prophecies for an Old Testament book
            cell.detailLabel.text = [NSString stringWithFormat:@"%@ %@", book.numberOfProphecies, book.numberOfPropheciesValue > 1 ? @"prophecies" : @"prophecy"];
        }
        else
        {
            // Display number of fulfillments for a New Testament book
            cell.detailLabel.text = [NSString stringWithFormat:@"%@ %@", book.numberOfProphecies, book.numberOfPropheciesValue > 1 ? @"fulfillments" : @"fulfillment"];
        }
        cell.subtitleLabel.text = book.subtitle;
    }
    else // default to kJCMProphecyGroupByCategory
    {
        JCMCategory *category = self.fetchedResults[indexPath.row];
        cell.titleLabel.text = category.title;
        cell.detailLabel.text = [NSString stringWithFormat:@"%@ %@", category.numberOfProphecies, category.numberOfPropheciesValue > 1 ? @"prophecies" : @"prophecy"];
        cell.subtitleLabel.text = category.subtitle;
    }

    cell.titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    cell.detailLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
    cell.subtitleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
}

@end
