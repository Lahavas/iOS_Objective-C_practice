//
//  ItemsViewController.m
//  Homepwner
//
//  Created by USER on 2017. 12. 21..
//  Copyright © 2017년 USER. All rights reserved.
//

#import "ItemsViewController.h"
#import "ItemStore.h"
#import "Item.h"

@interface ItemsViewController ()

#pragma mark - Private IBOutlet Property

@property (strong, nonatomic) IBOutlet UIView *headerView;

@end

@implementation ItemsViewController

#pragma mark - Initialization

- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    
    if (self) {
        for (int i = 0; i < 5; i++) {
            [[ItemStore sharedStore] createItem];
        }
    }
    
    return self;
}

- (instancetype)init {
    return [self initWithStyle:UITableViewStylePlain];
}

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
    
    UIView *header = self.headerView;
    [self.tableView setTableHeaderView:header];
}

#pragma mark - Accessor Methods

- (UIView *)headerView {
    if (!_headerView) {
        [[NSBundle mainBundle] loadNibNamed:@"HeaderView"
                                      owner:self
                                    options:nil];
    }
    
    return _headerView;
}

#pragma mark - IBAction

- (IBAction)addNewItem:(id)sender {
    
}

- (IBAction)toggleEditingMode:(id)sender {
    if (self.isEditing) {
        [sender setTitle:@"Edit"
                forState:UIControlStateNormal];
        [self setEditing:NO
                animated:YES];
    } else {
        [sender setTitle:@"Done"
                forState:UIControlStateNormal];
        [self setEditing:YES
                animated:YES];
    }
}

#pragma mark - Table View Data Source

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return [[ItemStore sharedStore] allItems].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                                            forIndexPath:indexPath];
    
    NSArray *items = [[ItemStore sharedStore] allItems];
    Item *item = items[indexPath.row];
    
    [cell.textLabel setText:[item description]];
    
    return cell;
}

@end
