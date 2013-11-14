//
//  ViewController.m
//  dentaku
//
//  Created by 八幡　尚明 on 13/10/17.
//  Copyright (c) 2013年 Univercity of kitakyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    int matrix;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    matrix = 0;
    self.gamen.text = [NSString stringWithFormat:@"%d",matrix];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
int before=0;
- (IBAction)number:(id)sender {
    
    UIButton *number=sender;
    matrix=number.tag;
    matrix = before*10 + matrix;
    NSString *str = [NSString stringWithFormat:@"%8d",matrix];
    self.gamen.text = str;

    before=matrix;
    
}

- (IBAction)botandot:(id)sender {
    [[self gamen] setText:@"."];
}


- (IBAction)Equal:(id)sender {
    [[self enzan] setText:@"="];
}

- (IBAction)Clear:(id)sender {
    [[self gamen] setText:@"0"];
    [[self enzan] setText:@""];
    before=0;
}


- (IBAction)rute:(id)sender {
    [[self enzan] setText:@"√"];
}


- (IBAction)Plus:(id)sender {
    [[self enzan] setText:@"+"];
}

- (IBAction)Minus:(id)sender {
    [[self enzan] setText:@"-"];
}

- (IBAction)Multi:(id)sender {
    [[self enzan] setText:@"*"];
}

- (IBAction)Devide:(id)sender {
    [[self enzan] setText:@"/"];
}


@end
