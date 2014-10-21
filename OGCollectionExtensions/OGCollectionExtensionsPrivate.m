//
//  OGCollectionExtensionsPrivate.m
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

#import "OGCollectionExtensionsPrivate.h"

void _ogceNoExceptionAddObjectToCollection(id mutableCollection, id object)
{
	if (object)
		[mutableCollection addObject:object];
}

void _ogceNoExceptionInsertObjectInCollection(id mutableCollection, id object, NSUInteger index)
{
	if (object)
		[mutableCollection insertObject:object atIndex:index];
}

void _ogceNoExceptionReplaceObjectInCollection(id mutableCollection, id object, NSUInteger index)
{
	if (object)
		[mutableCollection replaceObjectAtIndex:index withObject:object];
}

id _ogceRandomCollectionObject(id collection)
{
	uint32_t count = (uint32_t)((NSArray *)collection).count;
	
	if (!count)
		return nil;
	
	return collection[arc4random_uniform(count)];
}

id _ogceMatchingCollectionObject(id<NSFastEnumeration> collection, OGCollectionExtensionsObjectMatchBlock matchingBlock)
{
	for (id object in collection)
		if (matchingBlock(object))
			return object;
	
	return nil;
}

id _ogceMappedCollection(id<NSFastEnumeration>collection, id mutableTargetCollection, OGCollectionExtensionsObjectMapBlock mappingBlock)
{
	for (id object in collection)
		_ogceNoExceptionAddObjectToCollection(mutableTargetCollection, mappingBlock(object));
	
	return mutableTargetCollection;
}

id _ogceFilteredCollection(id<NSFastEnumeration>collection, id mutableTargetCollection, OGCollectionExtensionsObjectsMatchBlock matchingBlock)
{
	BOOL stop = NO;
	
	for (id object in collection) {
		
		if (matchingBlock(object, &stop))
			[mutableTargetCollection addObject:object];
		
		if (stop)
			break;
	}
	
	return mutableTargetCollection;
}

void _ogceRandomizeCollection(id collection)
{
	NSInteger count = [collection count];
	
	for (uint32_t i = 0; i < count-1; i++) {
		
		uint32_t n = arc4random_uniform((uint32_t)count-i)+i;
		[collection exchangeObjectAtIndex:i withObjectAtIndex:n];
	}
}
