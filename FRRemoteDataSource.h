//
//  FRRemoteDatasource.h
//
//  Created by Jonathan Dalrymple on 22/12/2009.
//  Copyright 2009 Float:Right. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FRDataSource.h"

@interface FRRemoteDataSource : FRDataSource {
	id _delegate;
}

@property (assign,nonatomic) id delegate;

-(void) notifyLoading;
-(void) notifyLoaded;
-(void) notifyFailed;

-(void) loadFromIndex:(NSUInteger) start toIndex:(NSUInteger) end;

@end

@protocol FRRemoteDataSourceDelegate

-(void) dataSourceDidLoad:(FRRemoteDataSource*) src;
-(void) dataSourceLoadDidFail:(FRRemoteDataSource*) src;
-(void) dataSourceWillLoad:(FRRemoteDataSource*) src;

@end

