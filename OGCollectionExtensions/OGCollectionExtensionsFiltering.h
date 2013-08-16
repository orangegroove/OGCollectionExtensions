//
//  OGCollectionExtensionsFiltering.h
//  OGCollectionExtensionsExample
//
//  Created by Jesper on 8/11/13.
//  Copyright (c) 2013 Orange Groove. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OGCollectionExtensionsCommon.h"

@protocol OGCollectionExtensionsFiltering <NSObject>

/**
 Returns a collection of matching objects.
 @param The matching block
 @return The new collection
 */
- (instancetype)objectsMatching:(OGCollectionExtensionsObjectsMatchBlock)block;

@end
