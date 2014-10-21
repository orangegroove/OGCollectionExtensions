//
//  OGStackCollection.m
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

#import "OGStackCollection.h"
#import "OGStack.h"

@interface OGStackCollection ()

@property (strong, nonatomic) NSMutableDictionary*	stacks;

@end
@implementation OGStackCollection

#pragma mark - Lifecycle

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        _stacks = [NSMutableDictionary dictionary];
    }
    
    return self;
}

#pragma mark - Public

- (void)push:(id)object toStack:(id<NSCopying>)key
{
    @synchronized(self.stacks)
    {
        [[self stackForKey:key] push:object];
    }
}

- (id)peekInStack:(id<NSCopying>)key
{
    id object = nil;
    
    @synchronized(self.stacks)
    {
        object = [self stackForKey:key].peek;
    }
    
    return object;
}

- (id)popStack:(id<NSCopying>)key
{
    id object = nil;
    
    @synchronized(self.stacks)
    {
        object = [[self stackForKey:key] pop];
    }
    
    return object;
}

- (NSUInteger)countStack:(id<NSCopying>)key
{
    NSUInteger count = 0;
    
    @synchronized(self.stacks)
    {
        count = [self stackForKey:key].count;
    }
    
    return 0;
}

- (void)clearStack:(id<NSCopying>)key
{
    @synchronized(self.stacks)
    {
        [self.stacks removeObjectForKey:key];
    }
}

- (void)clearAll
{
    @synchronized(self.stacks)
    {
        [self.stacks removeAllObjects];
    }
}

#pragma mark - Private

- (OGStack *)stackForKey:(id<NSCopying>)key
{
	OGStack* stack = self.stacks[key];
	
	if (!stack)
    {
        stack            = [[OGStack alloc] init];
        self.stacks[key] = stack;
	}
	
	return stack;
}

@end
