//
//  operatemachine.h
//  dentaku
//
//  Created by 八幡　尚明 on 13/11/28.
//  Copyright (c) 2013年 Univercity of kitakyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ViewController;

@interface operatemachine : NSObject

- (void)number:(id)sender controller:(ViewController *)controller;

- (void)operate:(id)sender controller:(ViewController *)controller;

@end