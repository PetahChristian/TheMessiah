//
//  UIFont+YHWHCustomFont.m
//  NamesOfGod
//
//  Created by Peter Jensen on 2/28/14.
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

#import "UIFont+YHWHCustomFont.h"

@implementation UIFont (YHWHCustomFont)

// Font names for TeX Gyre Heros family:
//   TeXGyreHeros-Bold
//   TeXGyreHeros-BoldItalic
//   TeXGyreHeros-Italic
//   TeXGyreHeros-Regular

// Since the preferred (system) font does not have small caps, we return a custom
// Helvetica alternative that matches the preferredFontForTextStyle size and weight.

+ (UIFont *)yhwh_preferredCustomFontForTextStyle:(NSString *)style
{
    // Get the preferred (system) font descriptor for the specified style

    // Direct, but contributes to feature envy: [UIFontDescriptor
    // preferredFontDescriptorWithTextStyle:style]
    UIFontDescriptor *preferredFontDesc = [[UIFont preferredFontForTextStyle:style] fontDescriptor];

    // Note any bold or italic traits

    UIFontDescriptorSymbolicTraits neededSymbolicTraits = preferredFontDesc.symbolicTraits &
        (UIFontDescriptorTraitBold | UIFontDescriptorTraitItalic);

    // Support Dynamic Type by returning a custom font that matches the
    // preferredFontForTextStyle size and traits

    UIFont *customFont = [UIFont fontWithName:@"TeXGyreHeros-Regular"
                                         size:preferredFontDesc.pointSize];

    return [UIFont fontWithDescriptor:[[customFont fontDescriptor]
                                       fontDescriptorWithSymbolicTraits:neededSymbolicTraits]
                                 size:preferredFontDesc.pointSize];
}

@end
