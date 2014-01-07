//
//  OGCollectionExtensionsMapping.h
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

@protocol OGCollectionExtensionsMapping <NSObject>

/**
 Maps an array to an array.
 @param block The mapping block. Returned nil values are ignored.
 @return The mapped collection.
 */
- (NSArray *)mapToArray:(OGCollectionExtensionsObjectMapBlock)block;

/**
 Maps an array to a mutable array.
 @param block The mapping block. Returned nil values are ignored.
 @return The mapped collection.
 */
- (NSMutableArray *)mapToMutableArray:(OGCollectionExtensionsObjectMapBlock)block;

/**
 Maps an array to a set.
 @param block The mapping block. Returned nil values are ignored.
 @return The mapped collection.
 */
- (NSSet *)mapToSet:(OGCollectionExtensionsObjectMapBlock)block;

/**
 Maps an array to a mutable set.
 @param block The mapping block. Returned nil values are ignored.
 @return The mapped collection.
 */
- (NSMutableSet *)mapToMutableSet:(OGCollectionExtensionsObjectMapBlock)block;

/**
 Maps an array to an ordered set.
 @param block The mapping block. Returned nil values are ignored.
 @return The mapped collection.
 */
- (NSOrderedSet *)mapToOrderedSet:(OGCollectionExtensionsObjectMapBlock)block;

/**
 Maps an array to a mutable ordered set.
 @param block The mapping block. Returned nil values are ignored.
 @return The mapped collection.
 */
- (NSMutableOrderedSet *)mapToMutableOrderedSet:(OGCollectionExtensionsObjectMapBlock)block;

@end
