예제 프로젝트 2. RandomItems
==================

RandomItems는 Objective-C의 문법 학습을 위한 연습 프로젝트입니다.

----------------------------------------------------------------------

### Ch02 Objective-C

* Objects
* Using Instances
    * Creating objects
    * Sending messages
    * Destroying objects
* Beginning RandomItems
    * Creating and populating an array
    * Iterating over an array
    * Format strings
* Subclassing an Objective-C Class
    * Creating an NSObject subclass
    * Instance variables
    * Accessing instance variables
        * Using dot syntax
    * Class vs. instance methods
    * Overriding methods

#### 주요 개념

* Objective-C
    * an *extension* of the C language
    * **Cocoa Touch Frameworks**
        * Collections of Objective-C classes
  
* Objects
    * **Class**
        * Like a blueprint to produce objects
    * **Object**
        * An instance of class
        * **Instance variable**
            * object's attribute
            * iVar
                * puts an underscore at the beginning of the instance variable name
            * **Accessor method**
                * getter and setter
                * without these methods, an object **cannot access the instance variables of another object**
                * **Dot Syntax** (Dot Notation)
        * **Method**
            * like function
            * To access to an object's instance variables
            * To run the method
                * send that object a **message**
            * Class vs. instance method
    * Object's Life Cycle
        * Creating
            * Send an **alloc** message to a class
                * The class creates an object in memory (on the heap)
                * and gives you the address of the object
            * And send **an initialization message**
        * Sending message
            * Message Anatomy
                * **Receiver**
                    * A pointer to the object being asked to execute a method
                * **selector**
                    * The name of the method to be executed
                * **arguments**
                    * The values to be supplied as the parameters to the method
                    * each argument is paired with the appropriate **label**
        * Be destroyed
            * when it is no longer needed
                * Set the variable that points to it to **nil**
                    * A message sent to nil is *ignored*
  
* The class file
    * Header file (Interface file)
    * Implementation file
  
* **NSObject**
    * The root class of the entire hierarchy
    * To implement the basic behavior of every object in Cocoa Touch

* Fast Enumeration
    * For iterating ober an array
    * Cannot use it if you need to add or remove objects

* Format String
    * format specification
        * corresponds to an argument
        * Description method
            * a method on the NSObject class
            * To return an instance of NSString that replaces the token
  
#### 참고 자료

>  

----------------------------------------------------------------------

