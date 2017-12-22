예제 프로젝트 4. Homepwner
======================

Homepwner는 본인의 소유물을 앱에 저장하기 위한 프로젝트입니다.

#### 도전 과제

* [ ] Sections
* [ ] Constant Rows
* [ ] Customizing the Table

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
  
* **UITableViewCell**
    * Each row of a table view is a view
    * Subviews
        * contentView
  
* *static variable*
    * is not destroyed when the method is done executing
    * is *not kept on the stack*
  
* @class directive
    * To speed up compile times considerably
    * Fewer files have to be recompiled when one file changes
  
#### 참고 자료

> 

