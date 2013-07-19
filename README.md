mobileFugitive
===========

## Overview

mobileFugitive is a drop-in class that dynamically detects whether the iOS device your app is running on has been jailbroken or not and if this device can install cracked apps or not.

## Install

**Clone this repo:** git clone git@github.com:unlucio/mobileFugitive.git
* Copy "mobileFugitive.m" and "mobileFugitive.h" in your project
* Add "mobileFugitive.m" to Build Phases --> Compile Sources in your project's target.

## Usage:

* Import Lib
```smalltalk
#import "mobileFugitive.h"
```

* Init an object
```smalltalk
MobileFugitive *jbDetector = [MobileFugitive alloc] init];
```

* Check for Jailbreak
```smalltalk
[jbDetector isJailbroken];
```

* Check if can install cracked apps
```smalltalk
[jbDetector isCracked];
```

**Inspired by:** https://github.com/diwu/ios-jail-break-detector

## LICENSE - "MIT License"

Copyright (c) 2013-2012 Luciano Colosio (@unlucio)

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
