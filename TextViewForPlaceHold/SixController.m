//
//  SixController.m
//  TextViewForPlaceHold
//
//  Created by 尚勇杰 on 2018/4/9.
//  Copyright © 2018年 尚勇杰. All rights reserved.
//

#import "SixController.h"
#import "UITextView+SYJText.h"

@interface SixController ()

@end

@implementation SixController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [super touchesBegan:touches withEvent:event];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //利用runtime黑魔法及动态添加属性对textview添加placeHolder属性
    UITextView *text = [[UITextView alloc]initWithFrame:CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width - 20, 240)];
    [self.view addSubview:text];
    text.backgroundColor = [UIColor grayColor];
    //设置大小要在font设置place前边
    text.font = [UIFont boldSystemFontOfSize:16];
    text.syj_placeHolder = @"这个方法更加的友好,只需引入头文件,所有文件就能直接使用占位符,不用集成其他类,建议使用这种方法";
    text.syj_placeHolderColor = [UIColor lightGrayColor];
    
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
