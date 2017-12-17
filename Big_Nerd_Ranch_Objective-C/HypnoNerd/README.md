예제 프로젝트 3. HypnoNerd
==================

HypnoNerd는 최면을 거는 듯한 View와 최면 기록에 대한 Reminder 기능을 구현한 프로젝트입니다.

#### 도전 과제

* [ ] Draw an Image
* [ ] Shadows and Gradients
* [ ] Another Tab
* [ ] Controller Logic

----------------------------------------------------------------------

### Ch04 Views and the View Hierarchy

* View Basics
* The View Hierarchy
* Subclassing UIView
    * Views and frames
* Custom Drawing in drawRect:
    * Drawing a single circle
    * UIBezierPath
    * Using the developer documentation
    * Drawing concentric circles
* More Developer Documentation
* For the More Curious: Core Graphics

#### 주요 개념

* **UIView** Object
    * A view knows *how to draw itself*
        * It renders itself to its *layer*
            * an instance of **CALayer**
        * The **drawRect:** method
            * the rendering step 
                * where a view draws itself onto its layer
    * A view *handles events*
    * A view exists within *a hierarchy of views*
        * The root of this hierarchy is **the application's window**
            * Every application has **a single instance of UIWindow**
                * to serve as the container for all the views
        * the *superveiw* property
            * a weak reference
  
* Frame vs. Bounds
    * **CGRect**
        * Rectangle Structure (for **coordinate system**)
            * CGSize (size)
                * the view's size
            * CGPoint (origin)
                * the view's position
            * These values are in **points**, not pixels
                * A relative unit of measure
                    * a different number of pixels
                        * depending on *how many pixels there are in the display*
                * Retina display
                    * A point = 2*2 Pixel
                * Non-Retina display
                    * A point = 1*1 pixel
        * A C structure, not an Objective-C object
            * cannot send messages to a CGRect
            * Use **CGRectMake()**
    * **Frame**
        * The rectangle
            * in its *superview's* coordinate system
        * is used during *compositing to lay out the view's layer*
            * relative to the rest of the *view hierarchy*
    * **Bounds**
        * The rectangle
            * in its *own* coordinate system
        * is used during *the rendering step to layout detailed drawing*
            * within the boundaries of the view's layer
  
* Core Graphics
    * a 2D drawing API written in C
    * **graphics context**
        * *CGContextRef*
        * The state of drawing
        * The memory that is being drawn upon
  
#### 참고 자료

> [UIView 관련 자료](https://developer.apple.com/documentation/uikit/uiview?language=objc)  
> [UIBezierPath 관련 자료](https://developer.apple.com/documentation/uikit/uibezierpath)  
> [Core Graphics 관련 자료](https://developer.apple.com/documentation/coregraphics?language=objc)  
> [Drawing and Printing Guide for iOS](https://developer.apple.com/library/content/documentation/2DDrawing/Conceptual/DrawingPrintingiOS/Introduction/Introduction.html#//apple_ref/doc/uid/TP40010156-CH1-SW1)  

----------------------------------------------------------------------

### Ch05 Views: Redrawing and UIScrollView

* The Run Loop and Redrawing Views
* Class Extensions
* Using UIScrollView
    * Panning and paging

#### 주요 개념

* **The Run Loop**
    * To listen for events
        * When an event occurs
            * The run loop finds the appropriate handler methods
                * and those handler methods call other methods
                * all of the methods have completed, *control* returns to the run loop
            * When the run loop regains control
                * it checks a list of **dirty views**
                    * that need to be re-rendered
            * Then sends the **drawRect:** message to the views in this list
    * *Batching* the redrawing of views at the end of a run loop cycle
    * **setNeedsDisplay** method
        * To get a view on the list of dirty views
        * The subclasses of UIView send themselves **setNeedsDisplay**
            * *whenever their content changes*
        * To mark only a portion of a view as needing to be redrawn
            * **setNeedsDisplayInRect:** method
  
* Class Extensions
    * To hide implementation details
        * do not need to be visible outside of the class
  
#### 참고 자료

> [CustomView 관련 자료](https://developer.apple.com/library/content/documentation/WindowsViews/Conceptual/ViewPG_iPhoneOS/CreatingViews/CreatingViews.html#//apple_ref/doc/uid/TP40009503-CH5-SW23)  
> [Category and Class Extension 관련 자료](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/CustomizingExistingClasses/CustomizingExistingClasses.html#//apple_ref/doc/uid/TP40011210-CH6-SW1)  
> [UIScrollView 관련 자료](https://developer.apple.com/documentation/uikit/uiscrollview)  

----------------------------------------------------------------------

### Ch06 View Controllers

* Subclassing UIViewCOntroller
    * The view of a view controller
    * Creating a view programmatically
    * Setting the root view controller
* Another UIViewCOntroller
    * Creating a view in Interface Builder
        * Creating view objects
        * Loading a NIB file
        * Connecting to File's Owner
* UITabBarController
    * Tab bar items
* UIViewController Initializers
* Adding a Local Notification
* Loaded and Appearing Views
    * Accessing subviews
* Interacting with View Controllers and Their Views
* For the More Curious: Key-Value Coding
* For the More Curious: Retina Display

#### 주요 개념

* **View Controller**
    * For creating view objects that make up the hierarchy
    * For handling events associated with the view objects in its hierarchy
    * For adding its hierarchy to the window
    * As a subclass of UIViewController
        * **view** property
            * The **root** of the view controller's view hierarchy
            * **lazy loading**
                * To conserve memory and improve performance
        * Creating a view programmatically
            * When a view controller is created
                * its *view* property is *nil*
                * If a view controller is asked for its *view*
                    * If its *view* is nil
                        * The view controller is sent the **loadView** message
            * **loadView** method
                * To create an instance of UIView or its subclass
                * To set it as the *view* of the view controller
            * **viewDidLoad** method
                * When a view controller finishes loading its view
                * Override this method
                    * if the configuration only needs to be done *once* during the run of the app
            * **viewWillAppear** method
                * just before its view is added to the window
                * Override this method
                    * if the configuration only needs to be done and *redone* every time the view controller appears on screen
        * Creating a view in Interface Builder
            * Creating view objects
            * Loading a NIB file
                * The default implementation of **loadView**
                    * knows how to handle loading a NIB file
            * Connecting to **File's Owner**
        * Setting the root view controller
            * UIWIndow's object
                * rootViewController property
                    * adds that view controller's *view* as a subview of the window
                    * automatically resizes the view to be the same size as the window
    * UIViewController Initializers
        * initWithNibName:bundle: method
            * the designated initializer
        * init method
            * calls initWithNibName:bundle:
            * and passes *nil* for both arguments
                * *nil* as its NIB name
                    * it searches for a NIB file with *the name of the class*
                * *nil* as the bundle
                    * it look in the *main application bundle*
  
* File's Owner
    * A placeholder
        * a hole intentionally left in the XIB file
    * When loading a NIB
        * Instantiate all of the objects archived in the XIB
        * Drop the object that is loading the NIB into the File's Owner hole
            * and establish the prepared connection
    * A view controller's *view* was *automatically* destroyed any time
        * that system memory was low
        * and then was recreated lated if needed
  
* UITabBarController
    * To keep an array of view controllers
    * Tab Bar Items
        * To display a title and an image
  
* Key-Value Coding
    * a set of methods defined in NSObject
        * To set and get *the values of properties by name*
    * when the NIB file is being loaded, the outlets are set using **setValue:forKey:**
    * **Using the accessor method naming conventions**
  
#### 참고 자료

> [View Controller Programming Guide for iOS](https://developer.apple.com/library/content/featuredarticles/ViewControllerPGforiPhoneOS/)  
> [UIViewController 관련 자료](https://developer.apple.com/documentation/uikit/uiviewcontroller)  
> [Nib File 관련 자료](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/LoadingResources/CocoaNibs/CocoaNibs.html)  
> [Key-Value Coding Programming Guide](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/KeyValueCoding/index.html)  

----------------------------------------------------------------------
