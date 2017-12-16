예제 프로젝트 2. RandomItems
==================

RandomItems는 Objective-C의 문법 학습을 위한 연습 프로젝트입니다.

#### 도전 과제

* [ ] Bug Finding
* [ ] Another Initializer
* [ ] Another Class

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
    * Initializers
        * The designated initializer
            * instancetype
            * id
        * Implementing the designated initializer
            * self
            * super
        * Confirming initialization success
        * Instance variables in initializers
        * Other initializers and the initializer chain
        * Using initializers
    * Class methods
    * Testing your subclass
* More on NSArray and NSMutableArray
* Exceptions and Unrecognized Selectors
* For the More Curious: Class Names
* For the More Curious: #import and @import

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
                * **Class Method**
                    * To create new instances of the class
                    * To retrieve some global property of the class
                    * *Convenience Methods*
                    * In class method, *self* refers to the **class object**
    * Object's Life Cycle
        * Creating
            * Send an **alloc** message to a class
                * The class creates an object in memory (on the heap)
                * and gives you the address of the object
            * And send **an initialization message**
                * **Initializer**
                    * a class has multiple initializers
                    * A chain of initializers
                        * The *designated initializer*
                            * Every instance variable of an object is **valid**
                        * instancetype vs id
                            * instancetype
                                * an instance of the receiving object
                            * id
                                * a pointer to any object
                        * self vs super
                            * self
                                * an implicit local variable
                            * super
                                * the search for the method skips the object's class
                                * and starts at the **superclass**
                    * If an initializer message failes, it will return *nil*
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
    * **isa pointer**
        * Evary object has an instance variable called *isa*
        * The class sets the isa instance variable of the returned object to point back at that class
        * Responding to a message happens at **runtime**
  
* The Class File
    * Header File (Interface File)
    * Implementation File
  
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

> [Programming with Objective-C 자료](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html#//apple_ref/doc/uid/TP40011210)  
> [Objective-C Runtime Programming Guide](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Introduction/Introduction.html)  
> [NSObject 관련 자료](https://developer.apple.com/documentation/objectivec/nsobject?language=objc)  

----------------------------------------------------------------------

### Ch03 Managing Memory with ARC

* The Stack
* The Heap
    * ARC and memory management
* Pointer Variables and Object Ownership
    * How objects lose owners
        * Changing a pointer
        * Setting a pointer to nil
        * The owner is destroyed
        * Removing an object from a collection
    * Ownership chains
* Strong and Weak References
* Properties
    * Declaring properties
    * Property attributes
        * Multi-threading attribute
        * Read/write attribute
        * Memory management attribute
    * Custom accessors with properties
* For the More Curious: Property Synthesis
* For the More Curious: Autorelease Pool and ARC History

#### 주요 개념

* **Stack**
    * The *frame* for method
        * The frame stores the values, *local variable*
            * for variables declared inside the method
  
* **Heap**
    * is where all Objective-C objects live
        * for object's instance variables
            * Primitive type
            * Address type (Pointer)
    * Heap memory were infinite
        * This resource *must be managed*

* ARC (Automatic Reference Counting)
    * **Object Ownership**
        * Pointer variable imply *ownership* of the objects
            * When a method (or function) has a local variable that points to an object
                * that variable is said to *own* the object being pointed to
            * When an object has an instance variable that points to another object
                * the object with the pointer is said to *own* the object being pointed to
        * How objects lose owners
            * Changeing a pointer
            * Setting a pointer to nil
            * The owner is destroyed
            * Removing an object from a collection
        * Ownership chains
            * The destruction of a single object
                * can set off a chain reaction of loss of ownership, object destruction, and freeing up of memory
            * dealloc method
                * be sent to an object just before it is destroyed
    * Strong reference vs weak reference
        * Strong reference
            * A pointer variable points to an object
            * Object has an owner and will stay alive
        * Weak reference
            * A pointer variable *cannot* take ownership of an object that it points to
            * To prevent a problem called a *Strong Reference Cycle* (*retain cycle*)
                * Two or more objects have strong references to each other
        * Strong Reference Cycle
            * Parent-Child Relationship
                * The parent can own its child
                    * but a child should **never own its parent**
    * Manual Reference Counting
        * Ownership changes only happened when you sent an explicit message to an object
            * [anObject release]
            * [anObject retain]
        * **Autorelease Pool**
            * When an object was send the message **autorelease**
                * The autorelease pool would take ownership of an object temporarily
                * It could be returned from the method
                    * that created it without burdening the creator or the receiver with ownership responsibilities
  
* **Property**
    * A convenient alternative to writing out accessor methods
        * To save a lot of typing
        * To make your class files easier to read
    * **Property Attribute**
        * Multi-threading attribute
            * nonatomic
            * atomic (default)
        * Read/write attribute
            * readwrite (default)
                * To implements both a setter and getter
            * readonly
                * To implement a getter
        * Memory management attribute
            * For properties that do not point to objects
                * no need for memory management
                    * **unsafe_unretained** (default value for non-object properties)
                        * direct assignment
                        * Unlike a weak reference,
                            * not automatically set to *nil* when the object that it points to is destroyed
                    * **assign**
            * For properties that manage a pointer to an Objective-C object
                * **strong** (default value for object properties)
                * **weak**
                * **copy**
                    * The copy method returns an immutable object
                        * It if safer to do this for *Immutable Property*
                    * *copy* gives you a strong reference to the object pointed to
                        * The original string is **not modified**
    * Property Synthesis
        * To generate the implementation for the accessor methods
        * To declare and create an instance variable
        * @synthesis propertyName = _iVarName
  
#### 참고 자료

> [Advanced Memory Management Programming Guide](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/MemoryMgmt/Articles/MemoryMgmt.html)  
> [Transitioning to ARC Release Notes](https://developer.apple.com/library/content/releasenotes/ObjectiveC/RN-TransitioningToARC/Introduction/Introduction.html#//apple_ref/doc/uid/TP40011226)  
> [Property 관련 자료](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/EncapsulatingData/EncapsulatingData.html#//apple_ref/doc/uid/TP40011210-CH5-SW2)  

----------------------------------------------------------------------

