//
//  FRDataSource.h
//
//  Created by Jonathan Dalrymple on 20/12/2009.
//  Copyright 2009 Float:Right. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FRDataSource : NSEnumerator <UITableViewDataSource> {
	@private NSArray* _collection;
}

@property (retain, nonatomic) NSArray* collection;

//Override in the subclasses 
-(NSString*) displayStringForObject:(id) object;
 

-(id)objectAtIndex:(NSUInteger) index;

-(NSUInteger) count;

-(id)lastObject;
/*
 - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
 - (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView;
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath;
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath;
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath;
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath;
 - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
 - (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index;
 - (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section;
 - (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;
 */

@end

