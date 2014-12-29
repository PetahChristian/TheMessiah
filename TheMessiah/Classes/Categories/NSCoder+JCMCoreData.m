//
//  NSCoder+JCMCoreData.m
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

#import "NSCoder+JCMCoreData.h"

@import UIKit;

@implementation NSCoder (JCMCoreData)

- (void)jcm_encodeCoreDataObject:(NSManagedObject *)object forKey:(NSString *)key
{
    NSURL *objectURI = [[object objectID] URIRepresentation];

    if (objectURI)
    {
        [self encodeObject:objectURI forKey:key];
    }
}

- (NSManagedObject *)jcm_decodeCoreDataObjectForKey:(NSString *)key
{
    NSManagedObject *object = nil;

    // Messy but avoids having to defer decoding until the moc is able to be injected
    id delegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *managedObjectContext = [delegate performSelector:@selector(managedObjectContext)];

    NSURL *objectURI = [self decodeObjectForKey:key];
    if (objectURI)
    {
        NSManagedObjectID *objectID = [[managedObjectContext persistentStoreCoordinator] managedObjectIDForURIRepresentation:objectURI];
        if (objectID)
        {
            object = [managedObjectContext objectWithID:objectID];
        }
    }

    return object;
}

@end
