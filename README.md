# CTLCubeContainerViewController

[![CI Status](https://img.shields.io/travis/Linh/CTLCubeContainerViewController.svg?style=flat)](https://travis-ci.org/Linh/CTLCubeContainerViewController)
[![Version](https://img.shields.io/cocoapods/v/CTLCubeContainerViewController.svg?style=flat)](https://cocoapods.org/pods/CTLCubeContainerViewController)
[![License](https://img.shields.io/cocoapods/l/CTLCubeContainerViewController.svg?style=flat)](https://cocoapods.org/pods/CTLCubeContainerViewController)
[![Platform](https://img.shields.io/cocoapods/p/CTLCubeContainerViewController.svg?style=flat)](https://cocoapods.org/pods/CTLCubeContainerViewController)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

Swift 5

## Installation

CTLCubeContainerViewController is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```swift
pod 'CTLCubeContainerViewController'
```
import this in your viewcontroller 

```swift
import CubeContainer
```

##Useage

**Init CTLCubeContainerViewController**

```swift
let cubeContainViewController = CTLCubeContainerViewController(viewControllers: listVC)
```

**Modifier interface**

```swift
// 
//true : pan by UIPanGestureRecognizer. false : UIScreenEdgePanGestureRecognizer
    public var  panWithoutScreen = true
    
    public var isHiddenNavigationBar = true
```

**Add Button for next and prev**

```swift
// set isHiddenNavigationBar = false before
cubeContainViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .rewind, target: cubeContainViewController, action: #selector(CTLCubeContainerViewController.navigateToPreviousViewController))
        cubeContainViewController.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .fastForward, target: cubeContainViewController, action: #selector(CTLCubeContainerViewController.navigateToNextViewController))
        
```


**data source**

Called to fetch the next view controller when there are no more view controllers in the 'future view controllers' stack. return nil if you dont need it.

```swift
func cubeContainerViewController(_ cubeContainerViewController: CTLCubeContainerViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return  nil
}
```

## Author

Linh, linhcanthai@vccorp.vn

## License

CTLCubeContainerViewController is available under the MIT license. See the LICENSE file for more info.
