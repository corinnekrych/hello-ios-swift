# Use FH iOS SDK in Swift projects

> This template app is deprecated use [helloworld-ios-app](https://github.com/feedhenry-templates/helloworld-ios/tree/swift) instead.
> 
If you have a Swift based project and you would like to use the FH iOS SDK, here is the steps you should follow:

1. Add the FH iOS SDK

  Add FH.framework to the project as usual

2. Add the Bridging Header

  To do this, you should create a new Objective-C file in the project, and XCode will prompt if you want to configure your project with a bridging header. Select "Yes".

3. Import the FH SDK in the Bridging Header

  Once the bridging header file is added, you can delete the object-c file you just created. Then copy the following code to the bridging header file:

  ```objc
  //frameworks used by the FH ios SDK
  #import <Foundation/Foundation.h>
  #import <AdSupport/AdSupport.h>
  #import <MobileCoreServices/MobileCoreServices.h>
  #import <SystemConfiguration/SystemConfiguration.h>
  #import <CFNetwork/CFNetwork.h>
  #import <CoreGraphics/CoreGraphics.h>
  #import <UIKit/UIKit.h>

  //import FH iOS SDK
  #import <FH/FH.h>
  #import <FH/FHResponse.h>
  ```

4. Link Libraries

  You also need to link these two libraries in your project (via General -> Linked Frameworks and Libraries -> Add):

  * libz.dylib
  * libxml2.dylib

Then you can start using FH SDK in your Swift classes. See this [example](HelloSwift/HelloSwift/ViewController.swift).