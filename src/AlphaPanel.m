//
//  AlphaPanel.m
//  as3Debugger
//
//  Created by Lucas Dupin on 04/07/09.
//  Copyright 2009 28.room. All rights reserved.
//

#import "AlphaPanel.h"


@implementation AlphaPanel


- (void)viewDidMoveToWindow {
	
}

- (void)setFrame:(NSRect)frame {
	//NSLog(@"Frame set");
    [super setFrame:frame];
	
	[self createTrackingRect];
}

- (void)mouseEntered:(NSEvent *)theEvent
{
	//NSLog(@"Mouse Entered");
	[[[self window] animator] setAlphaValue:1];
}
- (void)mouseExited:(NSEvent *)theEvent
{
	//NSLog(@"Mouse Exit");
	BOOL autoAlpha = [[[[NSUserDefaultsController sharedUserDefaultsController] values] valueForKey:@"flashLogAutoAlpha"] intValue] == 1;
	if(autoAlpha)
		[[[self window] animator] setAlphaValue:0.3];
	
	[self createTrackingRect];
}

-(void) createTrackingRect
{
	NSRect trackRect = [self visibleRect];
	//Adding the border of the window
	trackRect.size.height += 20;
	
    [self removeTrackingRect:rectTag];
	rectTag = [self addTrackingRect:trackRect owner:self userData:NULL assumeInside:NO];
}

@end
