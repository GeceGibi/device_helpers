
## Getting Started

`updateBadge(int value)` and `updateBadgeRequest()` only works with ios.

Add this entries to `Info.plist` file before using `requestTrackingAuthorization()` method.
```
<key>NSUserTrackingUsageDescription</key>
<string>I want to trace your activity.</string>
```
