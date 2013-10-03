//
//  Variable.h
//  as3Debugger
//
//  Created by Lucas Dupin on 9/3/09.
//  Copyright 2009 Gringo. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@protocol VariableDelegate

- (void) variableWantsItsChildren: (id) sender;
- (void) askedToReload: (id) sender;

@end

@interface Variable : NSObject {

@public
	
	//For output
	NSString * name;
	id value;
	
@protected
	
	//The real path in the FDB
	NSString * fullName;
	
	//Delegate to update children
	id __unsafe_unretained delegate;
	
	NSMutableArray * __unsafe_unretained child;

}

- (id) init;
- (id) initWithName: (NSString*) n andValue: (NSString*) v;
- (BOOL) leaf;
- (NSString *) printCommand;

@property (unsafe_unretained) id<VariableDelegate> delegate;
@property (unsafe_unretained) NSMutableArray * child;
@property (copy) NSString * name;
@property (copy) NSString * fullName;
@property (copy) id value;

@end
