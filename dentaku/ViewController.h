//
//  ViewController.h
//  dentaku
//
//  Created by 八幡　尚明 on 13/10/17.
//  Copyright (c) 2013年 Univercity of kitakyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *gamen;
@property (weak, nonatomic) IBOutlet UILabel *enzan;

- (IBAction)number:(id)sender;
- (IBAction)Clear:(id)sender;
- (IBAction)operate:(id)sender;

@end
