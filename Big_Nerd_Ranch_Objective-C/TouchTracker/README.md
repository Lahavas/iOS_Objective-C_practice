예제 프로젝트 5. TouchTracker
======================

TouchTracker는 Touch Event와 Gesture 관련 학습을 위한 Project입니다.

#### 도전 과제

* [ ] Saving and Loading
* [ ] Colors
* [ ] Circles
* [ ] Mysterious Lines
* [ ] Speed and Size
* [ ] Colors

----------------------------------------------------------------------

### Ch12 Touch Events and UIResponder

* Touch Events
* Creating the TouchTracker Application
* Drawing with BNRDrawView
* Turning Touches into Lines
    * Handling multiple touches
* For the More Curious: The Responder Chain
* For the More Curious: UIControl

#### 주요 개념

* Touch Events
    * A touch event is added to a queue of events
        * that the **UIApplication** object manages
    * The delivery of touch events involves sending *one of the **UIResponder** messages* to the view
        * about touch event's methods
        * When a finger touches the screen
            * an instance of **UITouch** is created
                * *One UITouch corresponds to one finger on the screen*
                * If a touch begins on a view
                    * then *that view owns the touch* for the life of the touch
                * The application will give you access to a touch object *when it changes state*
                    * You don't have to keep a reference to a **UITouch** object
  
* The Responder Chain
    * A **UIResponder** can receive touch events
        * Every UIResponder has a pointer called *nextResponder*
            * and together these objects make up the **responder chain**
                * The *nextResponder* of a view
                    * its **UIViewController** or its superview
                * The *nextResponder* of a view controller
                    * its view's superview
                    * The top-most superview is the *window*
                * The window's *nextResponder*
                    * the singleton instance of **UIApplication**
    * **UIControl**
        * control event
            * A target reegistered for this control event
                * will only receive its action message
            * **sendActionsForControlEvents:** method
                * looks at all of the target-action pairs the control has
                * if any of then are registered for the control event passed as the argument
                    * those targets are sent an action message
        * Controls can also have *nil-targeted actions*
            * the UIApplication finds the first responder of its UIWindow
            * and sends the action message to it
  
#### 참고 자료

> [UITouch 관련 자료](https://developer.apple.com/documentation/uikit/uitouch?language=objc)  
> [UIResponder 관련 자료](https://developer.apple.com/documentation/uikit/uiresponder?language=objc)  
> [UIControl 관련 자료](https://developer.apple.com/documentation/uikit/uicontrol?language=objc)  

----------------------------------------------------------------------

### Ch13 UIGestureRecognizer and UIMenuController

* UIGestureRecognizer Subclasses
* Detecting Taps with UITapGestureRecognizer
* Multiple Gesture Recognizers
* UIMenuController
* UILongPressGestureRecognizer
* UIPanGestureRecognizer and Simultaneous Recognizers
* For the More Curious: UIMenuController and UIResponderStandardEditActions
* For the More Curious: More on UIGestureRecognizer

#### 주요 개념

* 
    * 
  
#### 참고 자료

> 