# TheButterflyHost Android SDK
[![CI Status](https://img.shields.io/travis/avielBS/Butterfly.svg?style=flat)](https://travis-ci.org/avielBS/Butterfly)
[![Version](https://img.shields.io/cocoapods/v/Butterfly.svg?style=flat)](https://cocoapods.org/pods/Butterfly)
[![License](https://img.shields.io/cocoapods/l/Butterfly.svg?style=flat)](https://cocoapods.org/pods/Butterfly)
[![Platform](https://img.shields.io/cocoapods/p/Butterfly.svg?style=flat)](https://cocoapods.org/pods/Butterfly)
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
In order to present the view, ButterflyHostSDK require an the current Activitiy.

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

