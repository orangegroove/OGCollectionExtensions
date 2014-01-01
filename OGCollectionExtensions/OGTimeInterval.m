//
//  OGTimeInterval.m
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

#import "OGTimeInterval.h"

const OGTimeInterval OGTimeIntervalZero = {0, 0, 0, 0, NO, 0.};

BOOL OGTimeIntervalEquals(OGTimeInterval interval1, OGTimeInterval interval2)
{
	return interval1.days == interval2.days && interval1.hours == interval2.hours && interval1.minutes && interval2.hours && interval1.seconds && interval2.seconds && interval1.negative == interval2.negative;
}

BOOL OGTimeIntervalIsZero(OGTimeInterval interval)
{
	return OGTimeIntervalEquals(interval, OGTimeIntervalZero);
}

OGTimeInterval OGTimeIntervalMake(NSTimeInterval interval)
{
	static NSInteger SecondsPerMinute	= 60;
	static NSInteger SecondsPerHour		= 3600;
	static NSInteger SecondsPerDay		= 86400;
	
	OGTimeInterval ogInterval;
	NSInteger time						= (NSInteger)fabs(interval);
	ogInterval.days						= time / SecondsPerDay;
	time							   -= ogInterval.days * SecondsPerDay;
	ogInterval.hours					= time / SecondsPerHour;
	time							   -= ogInterval.hours * SecondsPerHour;
	ogInterval.minutes					= time / SecondsPerMinute;
	time							   -= ogInterval.minutes * SecondsPerMinute;
	ogInterval.seconds					= time;
	ogInterval.negative					= interval < 0.;
	ogInterval.total					= interval;
	
	return ogInterval;
}
