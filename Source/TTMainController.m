/*
 * Copyright (C) 2009 Torsten Becker <torsten.becker@gmail.com>.
 * All rights reserved.
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to
 * deal in the Software without restriction, including without limitation the
 * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
 * sell copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER 
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 * TTMainController.m, created on 2009-Feb-06.
 */

#import "TTMainController.h"


@implementation TTMainController


#pragma mark NSObject

- (id)init
{
  if((self = [super init]))
  {
    mElapsedTime = 0.0;
  }
  return self;
}


#pragma mark NSApplication Delegate


- (void) applicationDidFinishLaunching:(NSNotification *)pNotification
{
  [self readDefaults];
  
  NSMenu *menu = [self createMenu];

  mStatusItem = [[[NSStatusBar systemStatusBar]
    // statusItemWithLength:55.0] retain];
    statusItemWithLength:NSSquareStatusItemLength] retain];

  [mStatusItem setMenu:menu];
  [mStatusItem setHighlightMode:YES];
  [mStatusItem setToolTip:@"TimeTrack"];
  // [mStatusItem setTitle:@"00:00"];
  [mStatusItem setImage:[NSImage imageNamed:@"mono"]];
  [mStatusItem setAlternateImage:[NSImage imageNamed:@"mono-inverted"]];

  [menu release];
}


- (void)readDefaults
{
  NSUserDefaults *defs = [NSUserDefaults standardUserDefaults];
  
  NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
    @"ElapsedTime", [NSNumber numberWithDouble:0.0], nil];
  
  [defs registerDefaults:dict];
  
  mElapsedTime = [[defs objectForKey:@"ElapsedTime"] doubleValue];
}

- (void)saveDefaults
{
  [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)quitAction:(id)pSender
{
  [NSApp terminate:pSender];
}

- (void)startOrPauseTimer:(id)pSender
{
}

- (NSMenu *)createMenu
{
  NSMenu *menu = [[NSMenu alloc] init];
  NSMenuItem *menuItem;

  mStartPauseItem = [menu addItemWithTitle:@"Start"
    action:@selector(startOrPauseTimer:)
    keyEquivalent:@""];
  [mStartPauseItem setTarget:self];
  [mStartPauseItem retain];
  
  mResetItem = [menu addItemWithTitle:@"Reset"
    action:@selector(resetTimer:)
    keyEquivalent:@""];
  [mResetItem setTarget:self];
  [mResetItem retain];
  
  // Add Separator
  [menu addItem:[NSMenuItem separatorItem]];
  
  // Add Quit Action
  menuItem = [menu addItemWithTitle:@"Quit TimeTrack"
    action:@selector(quitAction:)
    keyEquivalent:@""];
  [menuItem setTarget:self];
  
  return menu;
}



@end
