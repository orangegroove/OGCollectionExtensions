//
//  OGCollectionExtensionsSafeRetrieval.h
//  OGCollectionExtensionsExample
//
//  Created by Jesper on 8/11/13.
//  Copyright (c) 2013 Orange Groove. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OGCollectionExtensionsCommon.h"

@protocol OGCollectionExtensionsIndexedSafeRetrieval <NSObject>

/**
 Returns the object at index or nil if index is out of bounds.
 @param index The index of object
 @return The object or nil
 */
- (id)objectSafelyAtIndex:(NSUInteger)index;

@end

@protocol OGCollectionExtensionsKeyedSafeRetrieval <NSObject>

/**
 Returns an object stored with, returns nil if key is nil
 @param aKey The key, may be nil
 @return The object or nil
 */
- (id)objectSafelyForKey:(id)aKey;

@end