예제 프로젝트 3. HypnoNerd
==================

HypnoNerd는 최면을 거는 듯한 View와 최면 기록에 대한 Reminder 기능을 구현한 프로젝트입니다.

#### 도전 과제

* [ ] Draw an Image
* [ ] Shadows and Gradients

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

