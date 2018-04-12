//
//  FiveController.m
//  TextViewForPlaceHold
//
//  Created by 尚勇杰 on 2018/4/9.
//  Copyright © 2018年 尚勇杰. All rights reserved.
//

#import "FiveController.h"
#import <objc/message.h>

@interface FiveController ()

@end

@implementation FiveController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [super touchesBegan:touches withEvent:event];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    通过runtime，我们发现，UITextView内部有一个名为“_placeHolderLabel”的私有成员变量。大家知道，Objective-C没有绝对的私有变量，因为我们可以通过KVC来访问私有变量。

    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width -20, 240)];
    [textView setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:textView];
    
    // _placeholderLabel
    UILabel *placeHolderLabel = [[UILabel alloc] init];
    placeHolderLabel.text = @"相对于上面的4种方法，这种方法更加取巧，虽然Apple官方没有给我们开发者提供类似于placeholder的属性，但是通过运行时，我们遍历出了一个placeHolderLabel的私有变量。这种方法简单易懂，代码量少，推荐大家使用这种方法。";
    placeHolderLabel.numberOfLines = 0;
    placeHolderLabel.textColor = [UIColor lightGrayColor];
    [placeHolderLabel sizeToFit];
    [textView addSubview:placeHolderLabel];
    
    // same font
    textView.font = [UIFont systemFontOfSize:13.f];
    placeHolderLabel.font = [UIFont systemFontOfSize:13.f];
    
    [textView setValue:placeHolderLabel forKey:@"_placeholderLabel"];
                
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
