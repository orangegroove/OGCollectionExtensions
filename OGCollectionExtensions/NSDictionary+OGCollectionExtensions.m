//
//  NSDictionary+OGCollectionExtensions.m
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

#import "NSDictionary+OGCollectionExtensions.h"
#import "OGCollectionExtensionsPrivate.h"

@implementation NSDictionary (OGCollectionExtensions)

#pragma mark - OGCollectionExtensionsKeyedSafeRetrieval

- (id)objectSafelyForKey:(id)aKey
{
	if (!aKey)
		return nil;
	
	return self[aKey];
}

#pragma mark - OGCollectionExtensionsKeyFiltering

- (instancetype)dictionaryWithKeysAndValuesMatching:(OGCollectionExtensionsKeyedMatchBlock)block
{
	NSArray* keys = [self keysOfEntriesWithOptions:0 passingTest:^BOOL(id key, id obj, BOOL *stop) {
		
		return block(key, obj, stop);
		
	}].allObjects;
	
	NSArray* objects = [self objectsForKeys:keys notFoundMarker:NSNull.null];
	
	return [self.class dictionaryWithObjects:objects forKeys:keys];
}

@end
