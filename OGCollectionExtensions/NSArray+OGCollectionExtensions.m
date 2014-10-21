//
//  NSArray+OGCollectionExtensions.m
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

#import "NSArray+OGCollectionExtensions.h"
#import "OGCollectionExtensionsPrivate.h"

@implementation NSArray (OGCollectionExtensions)

#pragma mark - OGCollectionExtensionsFiltering

- (instancetype)og_objectsMatching:(OGCollectionExtensionsObjectsMatchBlock)block
{
	return [self.class arrayWithArray:_ogceFilteredCollection(self, [NSMutableArray array], block)];
}

#pragma mark - OGCollectionExtensionsRetrieval

- (id)og_randomObject
{
	return _ogceRandomCollectionObject(self);
}

- (id)og_objectMatching:(OGCollectionExtensionsObjectMatchBlock)block
{
	return _ogceMatchingCollectionObject(self, block);
}

#pragma - OGCollectionExtensionsIndexedSafeRetrieval

- (id)og_objectSafelyAtIndex:(NSUInteger)index
{
	if (index > self.count-1) return nil;
	
	return self[index];
}

#pragma mark - OGCollectionExtensionsMapping

- (NSArray *)og_mapToArray:(OGCollectionExtensionsObjectMapBlock)block
{
	return [NSArray arrayWithArray:_ogceMappedCollection(self, [NSMutableArray array], block)];
}

- (NSMutableArray *)og_mapToMutableArray:(OGCollectionExtensionsObjectMapBlock)block
{
	return _ogceMappedCollection(self, [NSMutableArray array], block);
}

- (NSSet *)og_mapToSet:(OGCollectionExtensionsObjectMapBlock)block
{
	return [NSSet setWithSet:_ogceMappedCollection(self, [NSMutableSet set], block)];
}

- (NSMutableSet *)og_mapToMutableSet:(OGCollectionExtensionsObjectMapBlock)block
{
	return _ogceMappedCollection(self, [NSMutableSet set], block);
}

- (NSOrderedSet *)og_mapToOrderedSet:(OGCollectionExtensionsObjectMapBlock)block
{
	return [NSOrderedSet orderedSetWithOrderedSet:_ogceMappedCollection(self, [NSMutableOrderedSet orderedSet], block)];
}

- (NSMutableOrderedSet *)og_mapToMutableOrderedSet:(OGCollectionExtensionsObjectMapBlock)block
{
	return _ogceMappedCollection(self, [NSMutableOrderedSet orderedSet], block);
}

#pragma mark - OGCollectionExtensionsConverting

- (NSArray *)og_array
{
	return [NSArray arrayWithArray:self];
}

- (NSMutableArray *)og_mutableArray
{
	return [NSMutableArray arrayWithArray:self];
}

- (NSSet *)og_set
{
	return [NSSet setWithArray:self];
}

- (NSMutableSet *)og_mutableSet
{
	return [NSMutableSet setWithArray:self];
}

- (NSOrderedSet *)og_orderedSet
{
	return [NSOrderedSet orderedSetWithArray:self];
}

- (NSMutableOrderedSet *)og_mutableOrderedSet
{
	return [NSMutableOrderedSet orderedSetWithArray:self];
}

@end
