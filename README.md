# Locus LOTR iOS SDK

## App set up
 - Add capability: Background modes. Enable "Background fetch", "Location updates" and "Remote notifications".
 - Add the following keys in the app's `Info.plist`.
 ```
 NSLocationAlwaysAndWhenInUseUsageDescription
 NSLocationAlwaysUsageDescription
 NSLocationWhenInUseUsageDescription
 ```
 - Request for precise location access. It should be allowed "Always".

## Initialize the SDK
SDK must be initialised before it can be used. This is essential to pass credentials and register delegates.
```
LocusSDK.initialize(
    credentialProvider: credentialProvider,
    delegate: sdkDelegate,
    successBlock: {
        print("Init success")
    },
    failureBlock: { error in
        print("Init error \(error.message)")
    }
)
```
This should correspond to a user logging in to the app.

If the app has already initialised the SDK and hasn't logged out from it, you can re-initialize using locally stored data.
```
LocusSDK.reinitialize(
    credentialProvider: credentialProvider,
    delegate: sdkDelegate,
    successBlock: { print("Re-init success") },
    failureBlock: { error in
        print("Re-init error \(error.message)")
    }
)
```
This should correspond to the app being launched with a user already logged in.

## Use Location tracking
Ensure that the app has "Always" access to precise location.
```
LocusSDK.startTracking(
    successBlock: {print("Successfully started location tracking")},
    failureBlock: {error in print("Error in starting tracking \(error.message)") }
)
```
The SDK will collect locations and keep syncing them in batches to the Locus server.
The app can access the location updates by implementing `LocusSDKDelegate.onLocationUpdated`.
The last known location can be obtained from `LocusSDK.getLastKnownLocation`.
Location tracking can be stopped when it's not required.
```
LocusSDK.stopTracking(
    successBlock: {print("Successfully stopped location tracking")},
    failureBlock: {error in print("Error in stopping tracking \(error.message)") }
)

```

## Logout from the SDK
This should be called just before the user logs out from the app.
```
LocusSDK.logout(
    forceLogout: false,
    successBlock: { print("Logout success") },
    failureBlock: { error in
        print("Logout error \(error.message)")
    }
)
```
