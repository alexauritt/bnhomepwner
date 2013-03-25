//
//  DateChangeViewController.m
//  Homepwner
//
//  Created by Alexander Auritt on 3/23/13.
//  Copyright (c) 2013 Alexander Auritt. All rights reserved.
//

#import "DateChangeViewController.h"
#import "BNRItem.h"


@implementation DateChangeViewController
@synthesize item;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillDisappear:(BOOL)animated
{
  [super viewWillDisappear:animated];
  [item setDateCreated: [selectedDate date]];
//  NSLog(@"the current date is %@", [selectedDate date]);
//
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
