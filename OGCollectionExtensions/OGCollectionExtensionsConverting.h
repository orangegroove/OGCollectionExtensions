//
//  OGCollectionExtensionsConverting.h
//
//  Created by Jesper <jesper@orangegroove.net>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to
//  deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
//  IN THE SOFTWARE.
//

@import Foundation;
#import "OGCollectionExtensionsCommon.h"

@protocol OGCollectionExtensionsConverting <NSObject>

/**
 Converts an array to an array.
 @return The converted collection.
 */
- (NSArray *)og_array;

/**
 Converts an array to a mutable array.
 @return The converted collection.
 */
- (NSMutableArray *)og_mutableArray;

/**
 Converts an array to a set.
 @return The converted collection.
 */
- (NSSet *)og_set;

/**
 Converts an array to a mutable set.
 @return The converted collection.
 */
- (NSMutableSet *)og_mutableSet;

/**
 Converts an array to an ordered set.
 @return The converted collection.
 */
- (NSOrderedSet *)og_orderedSet;

/**
 Converts an array to a mutable ordered set.
 @return The converted collection.
 */
- (NSMutableOrderedSet *)og_mutableOrderedSet;

@end
