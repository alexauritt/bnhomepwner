//
//  DetailViewController.m
//  Homepwner
//
//  Created by Alexander Auritt on 3/13/13.
//  Copyright (c) 2013 Alexander Auritt. All rights reserved.
//

#import "DetailViewController.h"
#import "DateChangeViewController.h"
#import "BNRItem.h"

@implementation DetailViewController

@synthesize item;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [nameField setText:[item itemName]];
    [serialNumberField setText:[item serialNumber]];
    [valueField setText:[NSString stringWithFormat:@"%d", [item valueInDollars]]];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    [dateLabel setText:[dateFormatter stringFromDate:[item dateCreated]]];
}

- (void)viewWillDisappear:(BOOL)animated
{
  [super viewWillDisappear:animated];
  [[self view] endEditing:YES];
  
  [item setItemName:[nameField text]];
  [item setSerialNumber:[serialNumberField text]];
  [item setValueInDollars:[[valueField text] intValue]];
}

- (void)setItem:(BNRItem *)i
{
  item = i;
  [[self navigationItem] setTitle:[item itemName]];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  if ([valueField isFirstResponder]) {
    [valueField resignFirstResponder];
  }
}

- (IBAction)changeDate:(id)sender
{
    DateChangeViewController *dateChangeViewController = [[DateChangeViewController alloc] init];
    [[self navigationController] pushViewController:dateChangeViewController animated:YES];
}


@end
