//
//  FRRemoteDatasource.m
//
//  Created by Jonathan Dalrymple on 22/12/2009.
//  Copyright 2009 Float:Right. All rights reserved.
//

#import "FRRemoteDataSource.h"


@implementation FRRemoteDataSource

@synthesize delegate = _delegate;

-(id) init{
	if( !(self = [super init]) ) return nil;
	
	_delegate = nil;
	
	return self;
}

# pragma mark -
# pragma mark Notifications
// Let the world know we are loading data
-(void) notifyLoading{
	//Post a notification
	[[NSNotificationCenter defaultCenter] postNotificationName: @"Loading"
														object: self
	 ];
	
	//Call the delegate
	if( [self delegate] && [[self delegate] conformsToProtocol:@protocol(FRRemoteDataSourceDelegate)]){
		//Call on the main thread
		[[self delegate] performSelectorOnMainThread: @selector(dataSourceWillLoad:) 
										  withObject: self 
									   waitUntilDone: YES
		 ];
		//[[self delegate] dataSourceWillLoad:self];
		
	}
}

// Let the world know that data is loaded
-(void) notifyLoaded{
	
	//Post a notification
	[[NSNotificationCenter defaultCenter] postNotificationName: @"Loaded"
														object: self
	 ];
	
	//Call the delegate
	if( [self delegate] && [[self delegate] conformsToProtocol:@protocol(FRRemoteDataSourceDelegate)]){
		
		[[self delegate] performSelectorOnMainThread: @selector(dataSourceDidLoad:) 
										  withObject: self 
									   waitUntilDone: YES
		 ];
		//[[self delegate] dataSourceDidLoad:self];
		
	}
//	else{
//		[NSException raise:@"FRRemoteDataSourceException" format:@"%@ doesn't conform to FRRemoteDataSourceDelegate protocol or doesn't exists", [[self delegate] class]];
//	}
}

-(void) notifyFailed{
	
	//Post a notification
	[[NSNotificationCenter defaultCenter] postNotificationName: @"Failed"
														object: self
	 ];

	//Call the delegate
	if( [self delegate] && [[self delegate] conformsToProtocol:@protocol(FRRemoteDataSourceDelegate)]){
		
		[[self delegate] performSelectorOnMainThread: @selector(dataSourceLoadDidFail:) 
										  withObject: self 
									   waitUntilDone: YES
		 ];
		//[[self delegate] dataSourceLoadDidFail:self];
		
	}
}

-(void) loadFromIndex:(NSUInteger) start toIndex:(NSUInteger) end{
	NSLog(@"Loading data from %d to %d", start, end);
}

-(void) dealloc{
	
	_delegate = nil;
	
	[super dealloc];
}

@end
