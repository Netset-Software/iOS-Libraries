# Shiemmer Effect
An easy way to add a shimmering effect to any table view , Collection View and custom view with just single line of code. It is useful as an unobtrusive loading indicator. This is a network request waiting for the framework, the framework to increase the dynamic effect, convenient and fast, a line of code can be used.


## Output

<table>
<tr>
<td>
<img src="https://github.com/Netset-Software/iOS-Libraries/blob/Shimmer-Effect/Screenshots/List.gif" width="330" height="330">
</td>
<td><img src="https://github.com/Netset-Software/iOS-Libraries/blob/Shimmer-Effect/Screenshots/Collection.gif" width="330" height="330"></td>
  </tr>
  
  <td>
<img src="https://github.com/Netset-Software/iOS-Libraries/blob/Shimmer-Effect/Screenshots/CustomView.gif" width="330" height="330">
</td>
  
  </table>



## Requirements
- iOS 12.0 or later
- Swift 4 or above
- Xcode 12 or above

## Installation
Just drag the `AMShimmer.swift` files into your project.

## Usage
For Start -
swift
AMShimmer.start(for: view)

For Stop -
swift
AMShimmer.stop(for: view)


For Customization -
```swift
AMShimmer.start(for: self.view,except: [outletname,outletname],isToLastView: false)
