# TheButterflyHost iOS SDK
[![CI Status](https://img.shields.io/travis/avielBS/ButterflyHostSDK.svg?style=flat)](https://travis-ci.org/avielBS/ButterflyHostSDK)
[![Version](https://img.shields.io/cocoapods/v/ButterflyHostSDK.svg?style=flat)](https://cocoapods.org/pods/ButterflyHostSDK)
[![License](https://img.shields.io/cocoapods/l/ButterflyHostSDK.svg?style=flat)](https://cocoapods.org/pods/ButterflyHostSDK)
[![Platform](https://img.shields.io/cocoapods/p/ButterflyHostSDK.svg?style=flat)](https://cocoapods.org/pods/ButterflyHostSDK)


TheButterflyHost help you app to take part in the fight against domestic violent.


## Installationa
### 🔌 & ▶️

### Install via CocoaPods


#### Using the plain and common maven

#### Using "jitpack.io"

You want to add pod 'ButterflyHostSDK' similar to the following to your Podfile:

```
target 'MyApp' do
  pod 'ButterflyHostSDK', '0.3.0'
end

```

Then run a pod install in your terminal, or from CocoaPods app.


## Usage

To recognize your app in ButterflyHostSDK servers you need an application key, you can set it via code.
In order to present the view, ButterflyHostSDK require an the current UIViewController.

#### Example

```Objective - c
// import the pod
#import <ButterflyHostSDK/ButterflyHostController.h>

   ButterflyHostController* butterflyHostContoller = [ButterflyHostController getInstance];
   [butterflyHostContoller OnGrabReportRequested:UIViewController* andKey:@"YOUR_API_KEY"];

```

```Swift
// import the pod
import ButterflyHost

    ButterflyHostController.getInstance().onGrabReportRequeste(UIViewController, andKey:"YOUR_API_KEY")


```

## Comments

If you don't have CocoaPods In your project, visit here : https://cocoapods.org/
