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
#define ROOT 50
#define EQUAL 100
#define NOTHING 0

@interface ViewController (){
    int answer;
    int right;
    int opnum;
    int innum;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self Clear:nil];
}

- (IBAction)number:(id)sender {
    UIButton *number=sender;
    innum=number.tag;
    [self input];
    NSString *str = [NSString stringWithFormat:@"%d",right];
    self.gamen.text = str;
}


- (IBAction)Clear:(id)sender {
    [[self gamen] setText:@"0"];
    [[self enzan] setText:@""];
    answer=0;
    right=0;
    opnum=NOTHING;
}

- (IBAction)operate:(id)sender {
    UIButton *operate=sender;
    if(answer==0) {
        answer=right;
        right=0;
    }
    
    if(opnum!=NOTHING && right!=0){
        switch (opnum) {
            case PLUS:
                [[self enzan] setText:@"+"];
                break;
            case MINUS:
                [[self enzan]setText:@"-"];
                break;
            case MULTI:
                [[self enzan]setText:@"*"];
                break;
            case DIVIDE:
                [[self enzan]setText:@"/"];
                break;
            case ROOT:
                [[self enzan]setText:@"√"];
                break;
        }
        [self operating1 :(answer) :(right)];
        opnum=NOTHING;
        right=0;
    }
    
    opnum=operate.tag;
    switch (opnum) {
        case PLUS:
            [[self enzan] setText:@"+"];
            break;
        case MINUS:
            [[self enzan]setText:@"-"];
            break;
        case MULTI:
            [[self enzan]setText:@"*"];
            break;
        case DIVIDE:
            [[self enzan]setText:@"/"];
            break;
        case ROOT:
            [[self enzan]setText:@"√"];
            break;
    }
    [self operating2];
    NSString *ans = [NSString stringWithFormat:@"%d",answer];
    self.gamen.text = ans;
}

- (int)input{
    if (right<10000000) {
        right = right*10 + innum;
    }
    return right;
}

- (int)operating1:(int)ans :(int)rig{
    switch (opnum) {
        case PLUS:
            [[self enzan] setText:@"+"];
            answer=ans+rig;
            break;
        case MINUS:
            [[self enzan]setText:@"-"];
            answer=ans-rig;
            break;
        case MULTI:
            [[self enzan]setText:@"*"];
            answer=ans*rig;
            break;
        case DIVIDE:
            [[self enzan]setText:@"/"];
            answer=ans/rig;
            break;
        case ROOT:
            [[self enzan]setText:@"√"];
            answer=sqrt(answer);
            break;
    }
    return answer;
}

- (int)operating2{
    if (opnum==ROOT) {
            answer=sqrt(answer);
    }
    return answer;
}

@end
