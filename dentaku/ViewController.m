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

int anser=0,left=0,right=0,before=0,x=0;

- (IBAction)number:(id)sender {
    
    if (before<10000000) {
    
    UIButton *number=sender;
    matrix=number.tag;
    before = before*10 + matrix;
    NSString *str = [NSString stringWithFormat:@"%d",before];
    self.gamen.text = str;

    }
    
    else{
        before=before;
    }
    anser=before;
}


- (IBAction)Clear:(id)sender {
    [[self gamen] setText:@"0"];
    [[self enzan] setText:@""];
    anser=0;
    matrix=0;
    right=0;
    left=0;
    before=0;
}


- (IBAction)rute:(id)sender {
    [[self enzan] setText:@"√"];
    anser=sqrt(anser);
    NSString *Anser = [NSString stringWithFormat:@"%d",anser];
    self.gamen.text = Anser;
}

- (IBAction)operate:(id)sender {    
    if (right==0) {
        right=anser;
        matrix=0;
        before=0;
        self.gamen.text = [NSString stringWithFormat:@"%d",right];
        
    }
    else if(left==0){
        left=right;
        right=anser;
        matrix=0;
        before=0;
        self.gamen.text = [NSString stringWithFormat:@"%d",left];
    }
    
    else{
        right=right+anser;
        matrix=0;
        before=0;
        self.gamen.text = [NSString stringWithFormat:@"%d",right];
    }
    
    UIButton *operate=sender;
    switch (operate.tag) {
        case 10:
            [[self enzan] setText:@"+"];
            
            anser=left+right;
            break;
            
        case 11:
            [[self enzan]setText:@"-"];
            
            anser=left-right;
            break;
            
        case 12:
            [[self enzan]setText:@"*"];
            anser=left*right;
            break;
        case 13:
            [[self enzan]setText:@"/"];
            anser=left/right;
            break;
    }
    x=operate.tag;
}


- (IBAction)Equal:(id)sender {
    if (right==0) {
        right=anser;
        matrix=0;
        before=0;
        self.gamen.text = [NSString stringWithFormat:@"%d",right];
        
    }
    else{
        left=right;
        right=anser;
        matrix=0;
        before=0;
        self.gamen.text = [NSString stringWithFormat:@"%d",left];
    }
    switch (x) {
        case 10:            
            anser=left+right;
            break;
            
        case 11:
            anser=left-right;
            break;
            
        case 12:
            anser=left*right;
            break;
        case 13:
            anser=left/right;
            break;
    }
    
    [[self enzan] setText:@"="];
    
    NSString *Anser = [NSString stringWithFormat:@"%d",anser];
    self.gamen.text = Anser;
}

@end
