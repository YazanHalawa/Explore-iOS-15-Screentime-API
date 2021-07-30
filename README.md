# Explore-iOS-15-Screentime-API

In this project I explored the iOS 15 Screentime API announced here:

Through-out the project I encountered several problems running on Xcode 13 beta 4, with an iOS 15 beta 4 device:

- There does not seem to be a way to bring up a FamilyActivityPicker remotely from the parent device for a specific child that has the app that is managing restrictions installed on it. I can only bring this up on the child device which means that the child can change the selection at any point
- The very first time after approving authorization for the app to manage restrictions, If I bring up the Family Activity Picker, it shows categories with no apps listed under them. The second time I bring it up the apps are populated correctly
- Requesting Authorization for managing restrictions doesn't work on an iOS 15 simulator, but only on a real device with iOS 15 installed
- I don't see an Xcode extension template for DeviceActivity Monitor. Also the documentation has no steps on how to create this extension
- Blocking multiplayer gaming doesn't seem to work. I had enabled the blocking from my main app, then tried to open the game "Among us" and use it online multiplayer mode and I was not blocked
- If requesting authorization fails, the errors returned from the failure result on requesting authorization is an NSError object. Shouldn't it be a FamilyControlsError object? 
- Documentation is sometimes not clear when it comes to the errors. For example, the FamilyControlsError type "invalid arguments" had no clear explanation on what it meant. I only realized later on that the issue was trying to request auth on a simulator which doesn't work like I mentioned above.

I filed the issues to Apple's feedback tool. Hopefully a following Beta would address these issues soon.
