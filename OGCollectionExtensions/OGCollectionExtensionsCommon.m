//
//  OGCollectionExtensionsCommon.m
//  OGCollectionExtensionsProject
//
//  Created by Jesper on 8/30/13.
//  Copyright (c) 2013 Orange Groove. All rights reserved.
//

#import "OGCollectionExtensionsCommon.h"

BOOL OGTimeIntervalEquals(OGTimeInterval interval1, OGTimeInterval interval2)
{
	return interval1.days == interval2.days && interval1.hours == interval2.hours && interval1.minutes && interval2.hours && interval1.seconds && interval2.seconds && interval1.negative == interval2.negative;
}

BOOL OGTimeIntervalIsZero(OGTimeInterval interval)
{
	return OGTimeIntervalEquals(interval, OGTimeIntervalZero);
}

const OGTimeInterval OGTimeIntervalZero = {0, 0, 0, 0, NO, 0.};

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
