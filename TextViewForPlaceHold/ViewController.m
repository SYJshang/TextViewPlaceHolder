//
//  ViewController.m
//  TextViewForPlaceHold
//
//  Created by 尚勇杰 on 2018/4/9.
//  Copyright © 2018年 尚勇杰. All rights reserved.
//

#import "ViewController.h"
#import "FirstController.h"
#import "SecondController.h"
#import "ThirdController.h"
#import "FourController.h"
#import "FiveController.h"
#import "SixController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)first:(UIButton *)sender {
    
    [self presentViewController:[FirstController new] animated:YES completion:nil];
    
}
- (IBAction)second:(UIButton *)sender {
    
    [self presentViewController:[SecondController new] animated:YES completion:nil];

    
}
- (IBAction)third:(UIButton *)sender {
    
    [self presentViewController:[ThirdController new] animated:YES completion:nil];

    
}
- (IBAction)fouth:(UIButton *)sender {
    
    [self presentViewController:[FourController new] animated:YES completion:nil];
    
}

- (IBAction)five:(UIButton *)sender {
    
    [self presentViewController:[FiveController new] animated:YES completion:nil];

    
}

- (IBAction)six:(UIButton *)sender {
    
    [self presentViewController:[SixController new] animated:YES completion:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
