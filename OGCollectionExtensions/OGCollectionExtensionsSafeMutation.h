//
//  OGCollectionExtensionsSafeMutation.h
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

@protocol OGCollectionExtensionsSafeMutation <NSObject>

/**
 Alias for addObject: that doesn't throw exceptions on nil parameters.
 @param anObject The object to add
 */
- (void)og_addObjectSafely:(id)anObject;

@end

@protocol OGCollectionExtensionsIndexedSafeMutation <OGCollectionExtensionsSafeMutation>

/**
 Alias for insertObject:atIndex: that doesn't throw exceptions on nil parameters.
 @param anObject The object to insert
 @param index The target index
 */
- (void)og_insertObjectSafely:(id)anObject atIndex:(NSUInteger)index;

/**
 Alias for replaceObjectAtIndex:withObject: that doesn't throw exceptions on nil parameters.
 @param index The target index
 @param anObject The object to insert
 */
- (void)og_replaceObjectSafelyAtIndex:(NSUInteger)index withObject:(id)anObject;

@end

@protocol OGCollectionExtensionsKeyedSafeMutation <NSObject>

/**
 Alias for setObject:forKey: that doesn't throw exceptions of nil parameters.
 @param anObject The object to set. If nil, the key is removed from the dictionary.
 @param aKey The key
 */
- (void)og_setObjectSafely:(id)anObject forKey:(id<NSCopying>)aKey;

/**
 Renames a key but the preserves the object
 @param key The old key
 @param newKey The new key
 */
- (void)og_renameKey:(id<NSCopying>)key toKey:(id<NSCopying>)newKey;

@end