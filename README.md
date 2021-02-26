# TheButterflyHost iOS SDK
[![Version](https://img.shields.io/cocoapods/v/ButterflyHostSDK.svg?style=flat)](https://cocoapods.org/pods/ButterflyHostSDK)
[![License](https://img.shields.io/cocoapods/l/ButterflyHostSDK.svg?style=flat)](https://cocoapods.org/pods/ButterflyHostSDK)
[![Platform](https://img.shields.io/cocoapods/p/ButterflyHostSDK.svg?style=flat)](https://cocoapods.org/pods/ButterflyHostSDK)


TheButterflyHost help you app to take part in the fight against domestic violent.


## Installation
### 🔌 & ▶️

### Install via CocoaPods


You want to add pod 'ButterflyHostSDK' similar to the following to your Podfile:

```
target 'MyApp' do
  pod 'ButterflyHostSDK', '0.8.0'
end

```

Then run a pod install in your terminal, or from CocoaPods app.


## Usage

To recognize your app in ButterflyHostSDK servers you need an application key, you can set it via code.
In order to present the view, ButterflyHostSDK require an the current UIViewController.

#### Example

```Objective - c
// import the pod
#import <ButterflyHostSDK/ButterflyHost.h>

   ButterflyHost* butterflyHost = [ButterflyHost shared];
   [butterflyHost grabReportInViewController:self usingKey:@"YOUR_API_KEY"];

```

```Swift
// import the pod
import ButterflyHost

    ButterflyHost.getInstance().grabReportInViewController(UIViewController, usingKey:"YOUR_API_KEY")


```

## Comments

* If you don't have CocoaPods In your project, visit here : https://cocoapods.org/
* check out Localization suuport and add it to your project !
