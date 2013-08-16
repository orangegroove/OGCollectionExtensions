//
//  OGCollectionExtensionsSafeMutation.h
//  OGCollectionExtensionsExample
//
//  Created by Jesper on 8/11/13.
//  Copyright (c) 2013 Orange Groove. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OGCollectionExtensionsCommon.h"

@protocol OGCollectionExtensionsSafeMutation <NSObject>

/**
 Alias for addObject: that doesn't throw exceptions on nil parameters.
 @param anObject The object to add
 */
- (void)addObjectSafely:(id)anObject;

@end

@protocol OGCollectionExtensionsIndexedSafeMutation <OGCollectionExtensionsSafeMutation>

/**
 Alias for insertObject:atIndex: that doesn't throw exceptions on nil parameters.
 @param anObject The object to insert
 @param index The target index
 */
- (void)insertObjectSafely:(id)anObject atIndex:(NSUInteger)index;

/**
 Alias for replaceObjectAtIndex:withObject: that doesn't throw exceptions on nil parameters.
 @param index The target index
 @param anObject The object to insert
 */
- (void)replaceObjectSafelyAtIndex:(NSUInteger)index withObject:(id)anObject;

@end

@protocol OGCollectionExtensionsKeyedSafeMutation <NSObject>

/**
 Alias for setObject:forKey: that doesn't throw exceptions of nil parameters.
 @param anObject The object to set. If nil, the key is removed from the dictionary.
 @param aKey The key
 */
- (void)setObjectSafely:(id)anObject forKey:(id<NSCopying>)aKey;

/**
 Renames a key but the preserves the object
 @param key The old key
 @param newKey The new key
 */
- (void)renameKey:(id<NSCopying>)key toKey:(id<NSCopying>)newKey;

@end