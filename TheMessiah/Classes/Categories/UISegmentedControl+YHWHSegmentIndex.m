//
//  UISegmentedControl+YHWHSegmentIndex.m
//  NamesOfGod
//
//  Created by Peter Jensen on 4/4/14.
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

#import "UISegmentedControl+YHWHSegmentIndex.h"

@implementation UISegmentedControl (YHWHSegmentIndex)

#pragma mark - Public methods

- (void)yhwh_selectSegmentWithTitle:(NSString *)title
{
    // Find the segment with this title
    NSInteger segmentIndex = [self yhwh_segmentIndexWithTitle:title];

    if (segmentIndex == UISegmentedControlNoSegment)
    {
        // No segments matched.  Default to selecting the first segment.
        [self setSelectedSegmentIndex:0];
    }
    else
    {
        [self setSelectedSegmentIndex:segmentIndex];
    }
}

- (NSString *)yhwh_titleForSelectedSegment
{
    return [self yhwh_titleForSegmentAtIndex:[self selectedSegmentIndex]];
}

#pragma mark - Private methods

/**
 Returns the title of the specified segment.

 Range-check the index before calling -titleForSegmentAtIndex: to avoid an
    NSRangeException.

 @param segment An index number identifying a segment in the control.

 @return The string (title) of the specified segment. If no title has been set, or
    the segment is out of bounds, it returns nil.
 */
- (NSString *)yhwh_titleForSegmentAtIndex:(NSInteger)segment
{
    if (segment >= 0 && segment < (NSInteger)[self numberOfSegments])
    {
        return [self titleForSegmentAtIndex:segment];
    }
    return nil;
}

/**
 Returns the index of the segment with an equivalent title.

 @param title The title to compare.

 @return Returns the index of the segment with a matching title.  If no segment
    titles match, it returns UISegmentedControlNoSegment.
 */
- (NSInteger)yhwh_segmentIndexWithTitle:(NSString *)title
{
    NSInteger segmentIndex = UISegmentedControlNoSegment;

    // Find the segment with the given title

    NSUInteger numberOfSegments =  [self numberOfSegments];

    for (NSUInteger index = 0; index < numberOfSegments; index++)
    {
        // Does this segment's title match the title we are looking for?
        if ([title isEqualToString:[self titleForSegmentAtIndex:index]])
        {
            segmentIndex = index;
            break;
        }
    }

    return segmentIndex;
}

@end
