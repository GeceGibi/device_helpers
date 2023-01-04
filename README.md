<h3>Badge</h3>
`updateBadge(int value)` and `updateBadgeRequest()` only works with ios

---

<h3>Ads Tracking</h3>

<h4>Android</h4> 

Should add do `android/app/build.gradle` to

```gradle
dependencies {
    ...
    implementation 'com.google.android.gms:play-services-ads-identifier:18.0.1' // GMS
    implementation 'com.huawei.hms:ads-identifier:3.4.56.300' // HMS

}
```

<h4>For huawei</h4> 

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


