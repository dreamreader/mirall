/*
 * Copyright (C) by Daniel Molkentin <danimo@owncloud.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 2 of the License.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * for more details.
 */

#include "mirall/cocoainitializer.h"

#import <Foundation/NSAutoreleasePool.h>
#import <AppKit/NSApplication.h>

namespace Mirall {
namespace Mac {

class CocoaInitializer::Private {
  public:
    NSAutoreleasePool* autoReleasePool;
};

CocoaInitializer::CocoaInitializer() {
  d = new CocoaInitializer::Private();
  NSApplicationLoad();
  d->autoReleasePool = [[NSAutoreleasePool alloc] init];
}

CocoaInitializer::~CocoaInitializer() {
  [d->autoReleasePool release];
  delete d;
}

} // namespace Mac
} // namespace Mirall
