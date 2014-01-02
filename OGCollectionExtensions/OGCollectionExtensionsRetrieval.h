//
//  OGCollectionExtensionsRetrieval.h
//  OGCollectionExtensionsExample
//
//  Created by Jesper on 8/11/13.
//  Copyright (c) 2013 Orange Groove. All rights reserved.
//

@import Foundation;
#import "OGCollectionExtensionsCommon.h"

@protocol OGCollectionExtensionsRetrieval <NSObject>

/**
 Returns a random object in the collection.
 @return The object.
 */
- (id)randomObject;

/**
 Returns the first matched object.
 @param block The predicate
 @return The matched object
 */
- (id)objectMatching:(OGCollectionExtensionsObjectMatchBlock)block;

@end
