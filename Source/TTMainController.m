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


#pragma mark NSApplication Delegate


- (void) openWebsite:(id)sender {
  NSURL *url = [NSURL URLWithString:@"http://th30z.netsons.org"];
  [[NSWorkspace sharedWorkspace] openURL:url];
  [url release];
}

- (void) openFinder:(id)sender {
  [[NSWorkspace sharedWorkspace] launchApplication:@"Finder"];
}

- (void) actionQuit:(id)sender {
  [NSApp terminate:sender];
}

- (NSMenu *) createMenu {
  NSZone *menuZone = [NSMenu menuZone];
  NSMenu *menu = [[NSMenu allocWithZone:menuZone] init];
  NSMenuItem *menuItem;

  // Add To Items
  menuItem = [menu addItemWithTitle:@"Open Website"
    action:@selector(openWebsite:)
    keyEquivalent:@""];
  [menuItem setTarget:self];

  menuItem = [menu addItemWithTitle:@"Open Finder"
    action:@selector(openFinder:)
    keyEquivalent:@""];
  [menuItem setTarget:self];

  // Add Separator
  [menu addItem:[NSMenuItem separatorItem]];

  // Add Quit Action
  menuItem = [menu addItemWithTitle:@"Quit"
    action:@selector(actionQuit:)
    keyEquivalent:@""];
  [menuItem setToolTip:@"Click to Quit this App"];
  [menuItem setTarget:self];

  return menu;
}

- (void) applicationDidFinishLaunching:(NSNotification *)pNotification
{
  NSMenu *menu = [self createMenu];

  _statusItem = [[[NSStatusBar systemStatusBar]
    statusItemWithLength:55.0] retain];
  [_statusItem setMenu:menu];
  [_statusItem setHighlightMode:YES];
  [_statusItem setToolTip:@"Test Tray"];
  // [_statusItem setImage:[NSImage imageNamed:@"trayIcon"]];
  [_statusItem setTitle:@"02:45"];

  [menu release];
}


@end
