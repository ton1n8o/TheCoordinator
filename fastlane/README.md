fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew cask install fastlane`

# Available Actions
## iOS
### ios certificates
```
fastlane ios certificates
```
Sync all keys, certificates and profiles for all targets
### ios test
```
fastlane ios test
```
Runs all the tests
### ios stage
```
fastlane ios stage
```
Submit a new Alpha Build to Crashlitycs
### ios beta
```
fastlane ios beta
```
Submit a new Beta Build to Crashlitycs
### ios release
```
fastlane ios release
```
Deploy a release candidate to the App Store
### ios internal
```
fastlane ios internal
```
Deploy an internal build to Test Flight

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
