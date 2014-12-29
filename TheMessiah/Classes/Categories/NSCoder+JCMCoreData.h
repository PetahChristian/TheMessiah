//
//  NSCoder+JCMCoreData.h
//  TheMessiah
//
//  Created by Peter Jensen on 12/11/14.
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

@import Foundation;
@import CoreData;

@interface NSCoder (JCMCoreData)

/**
 Encodes the URI of a managed object and associates it with the string key.

 @param object The managed object to be encoded.

 @param key The string key to associate with the managed object's URI.
 */
- (void)jcm_encodeCoreDataObject:(NSManagedObject *)object forKey:(NSString *)key;
/**
 Decodes the URI of a managed object that was previously encoded with
 jcm_encodeCoreDataObject:forKey: and associated with the string key and returns the
 managed object matching the encoded URI.
 
 Can return nil if the persistent store no longer has an object matching the URI.

 @param key The string key associated with the managed object's URI.
 
 @return The managed object matching the encoded URI representation.
 */
- (NSManagedObject *)jcm_decodeCoreDataObjectForKey:(NSString *)key;

@end
