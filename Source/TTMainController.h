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
 * TTMainController.h, created on 2009-Feb-06.
 */

#import <Cocoa/Cocoa.h>


@interface TTMainController : NSObject
{
  NSStatusItem *mStatusItem;
  NSTimeInterval mElapsedTime;
  NSMenuItem *mStartPauseItem;
  NSMenuItem *mResetItem;
  BOOL mRuning;
  NSTimer *mTimer;
}

- (void)readDefaults;
- (void)saveDefaults;
- (void)updateMenu;
- (NSMenu *)createMenu;
- (void)enableTimer:(BOOL)enable;
- (NSString*)elapsedTimeAsString;
- (void)registerAtNotificationCenter;

@end
