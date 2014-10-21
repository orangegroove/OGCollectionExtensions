//
//  OGStack.m
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

#import "OGStack.h"

@interface OGStack ()

@property (strong, nonatomic) NSMutableArray* stack;

@end
@implementation OGStack

#pragma mark - Lifecycle

- (id)init
{
    self = [super init];
    
	if (self)
    {
        _stack = [NSMutableArray array];
	}
	
	return self;
}

#pragma mark - Public

- (void)push:(id)object
{
    @synchronized(self.stack)
    {
        [self.stack addObject:object];
    }
}

- (id)peek
{
    id object = nil;
    
    @synchronized(self.stack)
    {
        object = self.stack.lastObject;
    }
    
    return object;
}

- (id)pop
{
    id object = nil;
    
    @synchronized(self.stack)
    {
        object = self.stack.lastObject;
        
        [self.stack removeLastObject];
    }
    
	return object;
}

- (void)clear
{
    @synchronized(self.stack)
    {
        [self.stack removeAllObjects];
    }
}

- (NSUInteger)count
{
    NSUInteger count = 0;
    
    @synchronized(self.stack)
    {
        count = self.stack.count;
    }
    
	return count;
}

@end
