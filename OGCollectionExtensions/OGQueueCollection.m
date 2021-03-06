//
//  OGQueueCollection.m
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

#import "OGQueueCollection.h"
#import "OGQueue.h"

@interface OGQueueCollection ()

@property (strong, nonatomic) NSMutableDictionary* queues;

@end
@implementation OGQueueCollection

#pragma mark - Lifecycle

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        _queues = [NSMutableDictionary dictionary];
    }
    
    return self;
}

#pragma mark - Public

- (void)enqueue:(id)object inQueue:(id<NSCopying>)key
{
    @synchronized(self.queues)
    {
        [[self queueForKey:key] enqueue:object];
    }
}

- (id)dequeueQueue:(id<NSCopying>)key
{
    id object = nil;
    
    @synchronized(self.queues)
    {
        object = [[self queueForKey:key] dequeue];
    }
    
    return object;
}

- (id)peekInQueue:(id<NSCopying>)key
{
    id object = nil;
    
    @synchronized(self.queues)
    {
        object = [self queueForKey:key].peek;
    }
    
    return object;
}

- (NSUInteger)countQueue:(id<NSCopying>)key
{
    NSUInteger count = 0;
    
    @synchronized(self.queues)
    {
        count = [self queueForKey:key].count;
    }
    
    return count;
}

- (void)clearQueue:(id<NSCopying>)key
{
    @synchronized(self.queues)
    {
        [self.queues removeObjectForKey:key];
    }
}

- (void)clearAll
{
    @synchronized(self.queues)
    {
        [self.queues removeAllObjects];
    }
}

#pragma mark - Private

- (OGQueue *)queueForKey:(id<NSCopying>)key
{
	OGQueue* queue = self.queues[key];
	
	if (!queue)
    {
        queue            = [[OGQueue alloc] init];
        self.queues[key] = queue;
	}
	
	return queue;
}

@end
