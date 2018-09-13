# DPDeepLayout

```DPDeepLayout``` is a layout that will help you to create depend on ```device-sizes``` screens. You will easily create different layout for usual devices.

### Prerequisites

- iOS 8.0+

### Installing

### CocoaPods

`DPDeepLayout` is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```
pod 'DeepLayout', '~> 0.0'
```

## Getting Started

##### Via code

```swift
import DeepLayout
```

```swift
if DPDevice.size() > .screen4Inch {
// then set constraint as you want
}
```

##### Interface Builder

Use `.storyboard`, set class of `layout` object to DPLayoutConstraint, then you can add new constraints

![demo](https://imgur.com/XK1F84L.png)
![demo2](https://imgur.com/ooADucf.png)

## License

`DPDeepLayout` is released under the MIT license.
See [LICENSE.md](LICENSE.md)for details.
