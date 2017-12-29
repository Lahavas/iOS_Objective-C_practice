예제 프로젝트 4. Homepwner
======================

Homepwner는 본인의 소유물을 앱에 저장하기 위한 프로젝트입니다.

#### 도전 과제

* [ ] Sections
* [ ] Constant Rows
* [ ] Customizing the Table
* [ ] Renaming the Delete Button
* [ ] Preventing Reordering
* [ ] Really Preventing Reordering
* [ ] Displaying a Number Pad
* [ ] Dismissing a Number Pad
* [ ] Pushing More View Controllers
* [ ] Editing an Image
* [ ] Removing an Image
* [ ] Camera Overlay

----------------------------------------------------------------------

### Ch08 UITableView and UITableViewController

* Beginning the Homepwner Application
* UITableViewController
    * Subclassing UITableViewController
* UITableView's Data Source
    * Creating BNRItemStore
    * Implementing data source methods
* UITableViewCells
    * Creating and retrieving UITableViewCells
    * Reusing UITableViewCells
* Code Snippet Library

#### 주요 개념

* **UITableView**
    * To display a single column of data with a variable method of rows
    * To get the table working
        * A view controller
            * To handle its appearance on the screen
        * **Data Source**
        * **Delegate**
            * To inform other objects of events involving the UITableView
    * **UITableViewController**
        * A subclass of UIViewController
        * root view
            * always *an instance of UITableView*
        * dataSource and delegate instance variables of the  UITableView
            * are automatically set to point at the UITableViewController
        * The designated initializer
            * initWithStyle:
                * UITableViewStylePlain
                * UITableViewStyleGrouped
    * NSIndexPath
        * *section* and *row*
  
* **UITableViewCell**
    * Each row of a table view is a view
    * Subviews
        * *contentView*
            * *The superview for the content of the cell*
        * accessory indicator
            * To show an action-oriented icon
    * Reusing UITableViewCells
        * To preserve the lives of iOS devices everywhere
            * Offscreen cells are put into *a pool of cells* available for reuse
            * The **data source** first checks the poll
        * Every cell has a *reuseIdentifier* property
            * you need to tell the table view *which kind of cell* it should instantiate if there are no cells in the reuse pool
                * *register cell with cell identifier*
  
* *static variable*
    * is not destroyed when the method is done executing
    * is *not kept on the stack*
  
* @class directive
    * To speed up compile times considerably
    * Fewer files have to be recompiled when one file changes
  
#### 참고 자료

> [UITableView 관련 자료](https://developer.apple.com/documentation/uikit/uitableview)  

----------------------------------------------------------------------

### Ch09 Editing UITableView

* Editing Mode
* Adding Rows
* Deleting Rows
* Moving Rows

#### 주요 개념

* Editing Mode
    * UITableView's *editing* property
        * The rows of the table can be manipulated by the user
        * Not to allow the user to edit the *content* of a row
  
#### 참고 자료

> [UITableView 관련 자료](https://developer.apple.com/documentation/uikit/uitableview)  

----------------------------------------------------------------------

### Ch10 UINavigationController

* UINavigationController
* An Additional UIViewController
* Navigating with UINavigationController
    * Pushing view controllers
    * Passing data between view controllers
    * Appearing and disappearing views
* UINavigationBar

#### 주요 개념

* **UINavigationController**
    * Stack of View Controllers
        * *viewControllers* property
            * NSArray Type
        * *rootViewController*
            * the bottom of the stack
        * *topViewController*
            * the top of the stack
            * its *view* is visible
  
* UINavigationBar
    * UINavigationItem
        * Not a subclass of UIView
        * UIBarButtonItem
            * *leftBarButtonItem*
            * *rightBarButtonItem*
        * *titleView*
  
#### 참고 자료

> [UINavigationController 관련 자료](https://developer.apple.com/documentation/uikit/uinavigationcontroller)  
> [UINavigationBar 관련 자료](https://developer.apple.com/documentation/uikit/uinavigationbar?language=objc)  
> [UINavigationItem 관련 자료](https://developer.apple.com/documentation/uikit/uinavigationitem?language=objc)  

----------------------------------------------------------------------

### Ch11 Camera

* Displaying Images and UIImageView
    * Adding a camera button
* Taking Pictures and UIImagePickerController
    * Setting the image picker's sourceType
    * Setting the image picker's delegate
    * Presenting the image picker modally
    * Saving the image
* Creating BNRImageStore
* NSDictionary
* Creating and Using Keys
* Wrapping up BNRImageStore
* Dismissing the Keyboard
* For the More Curious: Navigating Implementation Files
    * #pragma mark
* For the More Curious: Recording Video

#### 주요 개념

* Image Store
    * To store images separately from other data
    * To fetch and cache images as they are needed
    * To flush the cache when memory runs low
  
* UIToolbar
    * a lot like a UINavigationBar
        * add instances of UIBarButtonItem
    * a toolbar has *an array of bar button items*
  
* UIImagePickerController
    * sourceType constant
    * mediaTypes constant
  
#### 참고 자료

> [UIImagePickerController 관련 자료](https://developer.apple.com/documentation/uikit/uiimagepickercontroller?language=objc)  
> [MobileCoreServices 관련 자료](https://developer.apple.com/documentation/mobilecoreservices?language=objc)  

----------------------------------------------------------------------

### Ch

* 

#### 주요 개념

* 
    * 
  
#### 참고 자료

> 