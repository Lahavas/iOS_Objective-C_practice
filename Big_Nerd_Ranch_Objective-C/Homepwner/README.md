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

### Ch09 UINavigationController

* UINavigationController
* An Additional UIViewController
* Navigating with UINavigationController
    * Pushing view controllers
    * Passing data between view controllers
    * Appearing and disappearing views
* UINavigationBar

#### 주요 개념

* 
    * 
  
#### 참고 자료

> 