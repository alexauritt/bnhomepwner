//
//  DateChangeViewController.h
//  Homepwner
//
//  Created by Alexander Auritt on 3/23/13.
//  Copyright (c) 2013 Alexander Auritt. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BNRItem;

@interface DateChangeViewController : UIViewController
{
  __weak IBOutlet UIDatePicker *selectedDate;
}
@property (nonatomic, strong) BNRItem *item;

@end
