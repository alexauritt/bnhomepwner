//
//  ItemsViewController.m
//  Homepwner
//
//  Created by Alexander Auritt on 3/5/13.
//  Copyright (c) 2013 Alexander Auritt. All rights reserved.
//

#import "ItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"

@implementation ItemsViewController

- (id)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
      UINavigationItem *n = [self navigationItem];
      [n setTitle:@"Homepwner"];
      
      UIBarButtonItem *bbi = [[UIBarButtonItem alloc]
                              initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                              target:self
                              action:@selector(addNewItem:)];
      [[self navigationItem] setRightBarButtonItem:bbi];
      [[self navigationItem] setLeftBarButtonItem:[self editButtonItem]];
    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[BNRItemStore sharedStore] allItems] count] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
    cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
  
    BNRItem *p;
    NSString *labelText;
  
    if ([indexPath row] != ([tableView numberOfRowsInSection:0] - 1)) {
      p = [[[BNRItemStore sharedStore] allItems] objectAtIndex:[indexPath row]];
      labelText = [p description];
    }
    else {
      labelText = @"No more items!";
      cell.textLabel.font = [UIFont systemFontOfSize:20.0];
    }
  
    [[cell textLabel] setText:labelText];
    return cell;
  
}


- (NSString *)tableView:(UITableView *)tv titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* myStr = @"Remove";
    return myStr;
}


- (void)tableView:(UITableView *)tableView
    commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        BNRItemStore *ps = [BNRItemStore sharedStore];
        NSArray *items = [ps allItems];
        BNRItem *p = [items objectAtIndex:[indexPath row]];
        [ps removeItem:p];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(IBAction)addNewItem:(id)sender
{
    BNRItem *newItem = [[BNRItemStore sharedStore] createItem];
    int lastRow = [[[BNRItemStore sharedStore] allItems] indexOfObject:newItem];
    
    NSIndexPath *ip = [NSIndexPath indexPathForRow:lastRow inSection:0];
    [[self tableView] insertRowsAtIndexPaths:[NSArray arrayWithObject:ip] withRowAnimation:UITableViewRowAnimationTop];
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [[BNRItemStore sharedStore] moveItemAtIndex:[sourceIndexPath row] toIndex:[destinationIndexPath row]];
}

- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
  int lastRow = [tableView numberOfRowsInSection:0] - 1;
  if ([sourceIndexPath row] == lastRow) {
    return sourceIndexPath;
  }
  if ([proposedDestinationIndexPath row] == lastRow) {
    return sourceIndexPath;
  }
  return proposedDestinationIndexPath;
}

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  if ([indexPath row] == [aTableView numberOfRowsInSection:0] - 1) {
    return;
  }
  DetailViewController *detailViewController = [[DetailViewController alloc] init];

  NSArray *items = [[BNRItemStore sharedStore] allItems];
  BNRItem *selectedItem = [items objectAtIndex:[indexPath row]];
  
  [detailViewController setItem:selectedItem];

  [[self navigationController] pushViewController:detailViewController animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  [[self tableView] reloadData];
}
@end
