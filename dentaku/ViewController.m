//
//  ViewController.m
//  dentaku
//
//  Created by 八幡　尚明 on 13/10/17.
//  Copyright (c) 2013年 Univercity of kitakyu. All rights reserved.
//

#import "ViewController.h"
#define PLUS 10
#define MINUS 11
#define MULTI 12
#define DIVIDE 13
#define NOTHING 0

@interface ViewController (){
    int before;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    before = 0;
    self.gamen.text = [NSString stringWithFormat:@"%d",before];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

int answer=0,left=0,right=0,opnum=0;

- (IBAction)number:(id)sender {
    
    if (before<10000000) {
        
        UIButton *number=sender;
        
        before = before*10 + number.tag;
        NSString *str = [NSString stringWithFormat:@"%d",before];
        self.gamen.text = str;
        
    }

answer=before;
}


- (IBAction)Clear:(id)sender {
    [[self gamen] setText:@"0"];
    [[self enzan] setText:@""];
    answer=0;
    right=0;
    left=0;
    before=0;
    opnum=0;
}


- (IBAction)rute:(id)sender {
    [[self enzan] setText:@"√"];
    answer=sqrt(before);
    NSString *ans = [NSString stringWithFormat:@"%d",answer];
    self.gamen.text = ans;
}

- (IBAction)operate:(id)sender {
    UIButton *operate=sender;
    if(right==0) {
        right=before;
        self.gamen.text = [NSString stringWithFormat:@"%d",right];
    }
    else{
        left=before;
    }
    before=0;
    if(opnum!=NOTHING){
        switch (opnum) {
            case PLUS:
                right=left+right;
                left=0;
                break;
                
            case MINUS:
                right=right-left;
                left=0;
                break;
                
            case MULTI:
                right=left*right;
                left=0;
                break;
            case DIVIDE:
                right=right/left;
                left=0;
                break;
        }
        opnum=0;
    }
    
    switch (operate.tag) {
        case PLUS:
            [[self enzan] setText:@"+"];
            answer=left+right;
            break;
            
        case MINUS:
            [[self enzan]setText:@"-"];
            answer=right-left;
            break;
            
        case MULTI:
            [[self enzan]setText:@"*"];
            answer=left*right;
            break;
        case DIVIDE:
            [[self enzan]setText:@"/"];
            answer=right;
            break;
    }
    if(answer!=0){
        NSString *str = [NSString stringWithFormat:@"%d",answer];
        self.gamen.text = str;
    }
    opnum=operate.tag;
}


- (IBAction)Equal:(id)sender {
    if(left==0){
        left=before;
    }
    if(left==0){
        left=1;
    }
    switch (opnum) {
        case PLUS:
            [[self enzan] setText:@"+"];
            answer=left+right;
            break;
            
        case MINUS:
            [[self enzan]setText:@"-"];
            answer=right-left;
            break;
            
        case MULTI:
            [[self enzan]setText:@"*"];
            answer=left*right;
            break;
        case DIVIDE:
            [[self enzan]setText:@"/"];
            answer=right/left;
            break;
    }
    opnum=0;
    left=answer;
    
    [[self enzan] setText:@"="];
    
    NSString *ans = [NSString stringWithFormat:@"%d",answer];
    self.gamen.text = ans;
}

@end
