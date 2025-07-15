<h3>Badge</h3>
`updateBadge(int value)` and `updateBadgeRequest()` only works with iOS

---



<h4>For Huawei</h4> 

```gradle
buildscript {
    repositories {
        ...
        // Configure the Maven repository address for the HMS Core SDK.
        maven {url 'https://developer.huawei.com/repo/'}
    }
}

allprojects {
    repositories {
        ...
        maven {url 'https://developer.huawei.com/repo/'}
    }
} 

```

<h4>iOS</h4> 

Add this entries to `Info.plist` file before using `requestTrackingAuthorization()` method.

```
<key>NSUserTrackingUsageDescription</key>
<string>I want to trace your activity.</string>
```


`requestTrackingAuthorization()` should be called and response must be `TrackingRequestStatus.authorized`. After then `getIdfa()` method will return ad id.


