//
//  OGCollectionExtensionsConverting.h
//  OGCollectionExtensionsExample
//
//  Created by Jesper on 8/11/13.
//  Copyright (c) 2013 Orange Groove. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OGCollectionExtensionsCommon.h"

@protocol OGCollectionExtensionsConverting <NSObject>

/**
 Converts an array to an array.
 @return The converted collection.
 */
- (NSArray *)array;

/**
 Converts an array to a mutable array.
 @return The converted collection.
 */
- (NSMutableArray *)mutableArray;

/**
 Converts an array to a set.
 @return The converted collection.
 */
- (NSSet *)set;

/**
 Converts an array to a mutable set.
 @return The converted collection.
 */
- (NSMutableSet *)mutableSet;

/**
 Converts an array to an ordered set.
 @return The converted collection.
 */
- (NSOrderedSet *)orderedSet;

/**
 Converts an array to a mutable ordered set.
 @return The converted collection.
 */
- (NSMutableOrderedSet *)mutableOrderedSet;

@end
