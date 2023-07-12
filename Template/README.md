#Libraries using in project:

# Update template: because R.swift not good when build, I change to using Swiftgen
# And to easy in coordinator manager I change to using XCoordinator
# I will refactor project, and dont use Cocoapod, change project dependencies to SPM
# To manage scretkey I change to use SwiftScretKeys
# I will intergrate others tools and refactor Appdeletate using Plugable to lightweith AppDelegate
# This will take more times
# Because Internet not good, I use make file to generate swiftgen file

* R.swift to manage resource project
* DebugToolKit support debug
* SwiftEntryKit to custom dialog
* Use cocoapods-keys to store secret key
* Use ObjectMapper to mapping json
* Swiftlint

--

#Coding convension using in project:
using raywenderlich coding convension 

* https://github.com/raywenderlich/swift-style-guide

--

#Distribution:
- Suggest using distribution google, fastlane

--
#Refrences: 

* https://demirciy.medium.com/mvvm-in-ios-development-with-protocol-closure-reactive-programming-rxswift-d0933b235235
* https://medium.com/nerd-for-tech/mvvm-coordinators-ios-architecture-tutorial-fb27eaa36470
* https://medium.com/getpulse/adaptive-ui-for-multiple-screen-sizes-in-ios-fd8c6999a0a3
* https://github.com/tristanhimmelman/ObjectMapper
* https://github.com/huri000/SwiftEntryKit
* https://github.com/kukushi/SideMenu
