//
//  BNRItem.h
//  RandomPossessions
//
//  Created by Alexander Auritt on 1/10/13.
//  Copyright (c) 2013 Alexander Auritt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject
@property (nonatomic, strong) BNRItem *containedItem;
@property (nonatomic, weak) BNRItem *container;

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly, strong) NSDate *dateCreated;


+ (id)randomItem;

- (id)initWithItemName:(NSString *)name serialNumber:(NSString *)sNumber;

- (id)initWithItemName:(NSString *)name
        valueInDollars:(int)value
          serialNumber:(NSString *)sNumber;


@end
