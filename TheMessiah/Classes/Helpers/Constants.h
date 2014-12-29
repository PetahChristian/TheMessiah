//
//  Constants.h
//  TheMessiah
//
//  Created by Peter Jensen on 11/11/14.
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

#ifndef TheMessiah_Constants_h
#define TheMessiah_Constants_h

@import UIKit;

///-----------------------------------------------
/// @name NSUserDefaults keys for user preferences
///-----------------------------------------------

/**
 Last bible version preference when displaying a verse.
 */
extern NSString * const kJCMBibleVersionKey;
/**
 Last group by preference when displaying list of prophecies.
 */
extern NSString * const kJCMProphecyGroupByKey;

///---------------------------------------------
/// @name Group by for Master list of prophecies
///---------------------------------------------

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpedantic"
typedef NS_ENUM(NSUInteger, JCMProphecyGroupBy) {
    kJCMProphecyGroupByBook,
    kJCMProphecyGroupByCategory
};
#pragma clang diagnostic pop

///------------------------------
/// @name Miscellaneous constants
///------------------------------

/**
 Bible book number for the last book of the Old Testament
 */
extern const NSUInteger kJCMLastOldTestamentBook;

#endif
