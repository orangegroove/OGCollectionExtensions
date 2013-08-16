//
//  NSOrderedSet+OGCollectionExtensions.m
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

#import "NSOrderedSet+OGCollectionExtensions.h"
#import "OGCollectionExtensionsPrivate.h"

@implementation NSOrderedSet (OGCollectionExtensions)

#pragma mark - OGCollectionExtensionsFiltering

- (instancetype)objectsMatching:(OGCollectionExtensionsObjectsMatchBlock)block
{
	return [self.class orderedSetWithOrderedSet:_ogceFilteredCollection(self, [NSMutableOrderedSet orderedSet], block)];
}

#pragma mark - OGCollectionExtensionsRetrieval

- (id)randomObject
{
	return _ogceRandomCollectionObject(self);
}

- (id)objectMatching:(OGCollectionExtensionsObjectMatchBlock)block
{
	return _ogceMatchingCollectionObject(self, block);
}

#pragma mark - OGCollectionExtensionsIndexedSafeRetrieval

- (id)objectSafelyAtIndex:(NSUInteger)index
{
	if (index > self.count-1)
		return nil;
	
	return self[index];
}

#pragma mark - OGCollectionExtensionsMapping

- (NSArray *)mapToArray:(OGCollectionExtensionsObjectMapBlock)block
{
	return [NSArray arrayWithArray:_ogceMappedCollection(self, [NSMutableArray array], block)];
}

- (NSMutableArray *)mapToMutableArray:(OGCollectionExtensionsObjectMapBlock)block
{
	return _ogceMappedCollection(self, [NSMutableArray array], block);
}

- (NSSet *)mapToSet:(OGCollectionExtensionsObjectMapBlock)block
{
	return [NSSet setWithSet:_ogceMappedCollection(self, [NSMutableSet set], block)];
}

- (NSMutableSet *)mapToMutableSet:(OGCollectionExtensionsObjectMapBlock)block
{
	return _ogceMappedCollection(self, [NSMutableSet set], block);
}

- (NSOrderedSet *)mapToOrderedSet:(OGCollectionExtensionsObjectMapBlock)block
{
	return [NSOrderedSet orderedSetWithOrderedSet:_ogceMappedCollection(self, [NSMutableOrderedSet orderedSet], block)];
}

- (NSMutableOrderedSet *)mapToMutableOrderedSet:(OGCollectionExtensionsObjectMapBlock)block
{
	return _ogceMappedCollection(self, [NSMutableOrderedSet orderedSet], block);
}

#pragma mark - OGCollectionExtensionsConverting

- (NSMutableArray *)mutableArray
{
	return [NSMutableArray arrayWithArray:self.array];
}

- (NSMutableSet *)mutableSet
{
	return [NSMutableSet setWithSet:self.set];
}

- (NSOrderedSet *)orderedSet
{
	return [NSOrderedSet orderedSetWithOrderedSet:self];
}

- (NSMutableOrderedSet *)mutableOrderedSet
{
	return [NSMutableOrderedSet orderedSetWithOrderedSet:self];
}

@end
