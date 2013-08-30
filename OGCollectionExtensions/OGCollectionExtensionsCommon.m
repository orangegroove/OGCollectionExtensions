//
//  OGCollectionExtensionsCommon.m
//  OGCollectionExtensionsProject
//
//  Created by Jesper on 8/30/13.
//  Copyright (c) 2013 Orange Groove. All rights reserved.
//

#import "OGCollectionExtensionsCommon.h"

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
