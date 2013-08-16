//
//  OGCollectionExtensionsMapping.h
//  OGCollectionExtensionsExample
//
//  Created by Jesper on 8/11/13.
//  Copyright (c) 2013 Orange Groove. All rights reserved.
//

#import <Foundation/Foundation.h>
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
