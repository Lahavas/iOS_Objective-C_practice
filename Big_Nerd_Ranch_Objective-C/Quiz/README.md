예제 프로젝트 1. Quiz
==================

Quiz는 간단한 퀴즈 게임 프로젝트입니다.

----------------------------------------------------------------------

### Ch01 A Simple iOS Application

* Creating an Xcode Project
* Model-View-Controller
* Designing Quiz
* Creating a View Controller
* Building an Interface
    * Creating view objects
    * Configuring view objects
    * NIB files
    * Making connections
        * Declaring outlets
        * Setting outlets
        * Defining action methods
        * Setting targets and actions
        * Summary of connections
* Creating Model Objects
    * Using code-completion
* Pulling it all Together
    * Implementing action methods
    * Getting the view controller on the screen
* Running on the Simulator
* Deploying an Application
* Application Icons
* Launch Images

#### 주요 개념

* MVC Pattern
    * View Objects
        * To present User Interface
    * Model Objects
        * To hold data
    * Controller Objects
        * To configure the views
        * To make sure that the view and model objects keep in sync
  
* XIB file
    * XML Interface Builder
    * To create and configure **Objects**
        * and Save them into an archive, XIB file
    * **Compile Process**
        * XIB file is compiled into a NIB file
        * NIB file is copied into the application's *bundle*
        * At runtime
            * When NIB file's interface is needed
                * the application will read in. or load
  
* **Connection**
    * A connection lets one object know where another object is in memory to **communicate**
    * **outlet**
        * To point to an object
        * IBOutlet keyword
            * tells XCode that you will see this outlet using Interface Builder
    * **action**
        * A method that gets triggered by some views
  
* Target-Action
    * **Target**
        * The object thet receives the message
    * **Action**
        * The message that is sent
  
* App Delegate
    * the starting point of an application
    * To manage a single top-level UIWindow for the application
  
* Provisioning Process
    * Developer Certificate
        * This file is added to Mac's keychain using Keychain Access
    * App ID
        * must match the *bundle identifier* of your application
    * Device ID (UDID)
    * Provisioning Profile
        * This file is suffixed with .mobileprovision
  
#### 참고 자료

> [Nib Files 관련 자료](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/LoadingResources/CocoaNibs/CocoaNibs.html)  
> [View Programming 관련 자료](https://developer.apple.com/library/content/documentation/WindowsViews/Conceptual/ViewPG_iPhoneOS/Introduction/Introduction.html)  
> [Outlet 관련 자료](https://developer.apple.com/library/content/documentation/General/Conceptual/Devpedia-CocoaApp/Outlet.html)  
> [Target-Action 관련 자료](https://developer.apple.com/library/content/documentation/General/Conceptual/Devpedia-CocoaApp/TargetAction.html#//apple_ref/doc/uid/TP40009071-CH3-SW1)  

----------------------------------------------------------------------

