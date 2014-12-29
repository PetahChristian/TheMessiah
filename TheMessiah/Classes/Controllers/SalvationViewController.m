//
//  SalvationViewController.m
//  TheMessiah
//
//  Created by Peter Jensen on 12/12/14.
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

#import "SalvationViewController.h"

#import "TableViewCell.h"

@interface SalvationViewController ()

@end

@implementation SalvationViewController

#pragma mark - Getters and setters

- (NSArray *)fetchedResults
{
    if (super.fetchedResults != nil) {
        return super.fetchedResults;
    }

    return @[@[@[@"There is none righteous, no, not one:", @"—Romans 3:10b"],
               @[@"for all have sinned, and come short of the glory of God;", @"—Romans 3:23"],
               ],
             @[@[@"For the wages of sin is death;", @"—Romans 6:23a"],
               ],
             @[@[@"but the gift of God is eternal life through Jesus Christ our Lord.", @"—Romans 6:23b"],
               ],
             @[@[@"But God commendeth his love toward us, in that, while we were yet sinners, Christ died for us.", @"—Romans 5:8"],
               ],
             @[@[@"that if thou shalt confess with thy mouth the Lord Jesus, and shalt believe in thine heart that God hath raised him from the dead, thou shalt be saved. For with the heart man believeth unto righteousness; and with the mouth confession is made unto salvation.", @"—Romans 10:9-10"],
               @[@"For whosoever shall call upon the name of the Lord shall be saved.", @"—Romans 10:13"],
               ],
             ];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.title = @"Savior and Lord";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return @[@"Admit we have sinned",
             @"Understand we deserve death for sin",
             @"Ask God to forgive and save you",
             @"Believe in Jesus and what He has done",
             @"Confess your faith in Jesus Christ",
             ][section];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @[@"Sin is a refusal to acknowledge God’s authority over our lives. We all are guilty of sin. We all need a savior.",
             @"Punishment for sin is spiritual death that alienates us from God, and will last for all eternity. The Bible teaches that there is a place called the Lake of Fire where lost people will be in torment forever.",
             @"Salvation is a free gift from God to us! We can't earn this gift, but we must reach out and receive it.",
             @"God loves each of us. Through the death of Jesus on the cross, God offers salvation to all who would repent of their sins, believe in Jesus, and receive His gift of forgiveness from sin.",
             @"Call out to God in the name of Jesus. Ask Him to come into your heart by faith, and ask Him to reveal Himself to you.\n\nFind a good church that believes the Bible and proclaims the good news of Christ.\n\nFollowing Christ’s example, ask for baptism by immersion as a public expression of your faith.\n\nPray and read your Bible daily.\n\nTrust every day that God loves you intensely!",
             ][section];
}

#pragma mark - <UITableviewDelegate>

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

#pragma mark - Private methods

- (CGFloat)p_determineRowHeightForPreferredFont
{
    NSString *category = [[UIApplication sharedApplication] preferredContentSizeCategory];

    if ([category isEqualToString:UIContentSizeCategoryLarge])
    {
        return 95.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryMedium])
    {
        return 83.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryExtraLarge])
    {
        return 105.0;
    }
    else if ([category isEqualToString:UIContentSizeCategorySmall])
    {
        return 78.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryExtraExtraLarge])
    {
        return 115.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryExtraSmall])
    {
        return 71.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryExtraExtraExtraLarge])
    {
        return 126.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryAccessibilityMedium])
    {
        return 175.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryAccessibilityLarge])
    {
        return 230.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryAccessibilityExtraLarge])
    {
        return 326.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryAccessibilityExtraExtraLarge])
    {
        return 422.0;
    }
    else if ([category isEqualToString:UIContentSizeCategoryAccessibilityExtraExtraExtraLarge])
    {
        return 614.0;
    }

    return 95.0;
}

- (void)configureCell:(TableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *verse = self.fetchedResults[indexPath.section][indexPath.row];

    cell.titleLabel.text = verse[0];
    cell.detailLabel.text = verse[1];

    cell.titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    cell.detailLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}

@end
