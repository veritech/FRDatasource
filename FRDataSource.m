//
//  FRDataSource.m
//
//  Created by Jonathan Dalrymple on 20/12/2009.
//  Copyright 2009 Float:Right. All rights reserved.
//

#import "FRDataSource.h"


@implementation FRDataSource

@synthesize collection = _collection;


#pragma mark -
#pragma mark Initialization Methods
//The init
-(id) init{
	
	if( (self = [super init]) ){
		_collection = nil;
	}
	
	return self;
}

//Overide this method to output simple strings in your table view
-(NSString*) displayStringForObject:(id)object{
	return object;
}

//Return the object at a specified index
-(id)objectAtIndex:(NSUInteger) index{
	
	return [[self collection] objectAtIndex: index];
}

-(NSUInteger) count{
	return [[self collection] count];
}

-(id)lastObject{
	return [[self collection] lastObject];
}

#pragma mark -
#pragma mark DataSource Methods
// Table Datasource methods
// TableRow
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	UITableViewCell* cell;
	
//	NSLog(@"Requested %d of %d", [indexPath indexAtPosition:1], [self.collection count]);
	
	if( !(cell = [tableView dequeueReusableCellWithIdentifier:@"cell"]) ){
		cell = [[[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:@"cell"] autorelease];
	}
	
	cell.textLabel.text = [self displayStringForObject:[[self collection] objectAtIndex:[indexPath indexAtPosition:1]]];
	
	return cell;
	
}

//Number of cells
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return [[self collection] count];
}

#pragma mark -
#pragma mark NSFastEnumeration implementation
- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id *)stackbuf count:(NSUInteger)len{
	
	return [[self collection] countByEnumeratingWithState:state objects: stackbuf count:len ];
}


#pragma mark -
#pragma mark Memory Management
-(void) dealloc{
	
	[_collection release];
	_collection = nil;

	[super dealloc];
}

@end
