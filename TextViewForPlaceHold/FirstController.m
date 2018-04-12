//
//  FirstController.m
//  TextViewForPlaceHold
//
//  Created by 尚勇杰 on 2018/4/9.
//  Copyright © 2018年 尚勇杰. All rights reserved.
//

#import "FirstController.h"

@interface FirstController ()<UITextViewDelegate>

@end

@implementation FirstController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [super touchesBegan:touches withEvent:event];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    1.把UITextView的文本属性当成“placeholder”使用
//    2.在开始编辑的代理方法里清除“placeholder”
//    3.在结束编辑的代理方法里根据条件设置“placeholder”。
    
    // 创建textView
    UITextView *textView =[[UITextView alloc]initWithFrame:CGRectMake(20,70,[UIScreen mainScreen].bounds.size.width-40,200)];
    textView.backgroundColor= [UIColor grayColor];
    textView.text = @"这种方法的特点是，当用户点击了TextView的，占位符占位文字就会立马消失，官方的占位符是当系统监听到用户输入了文字后占位符才会消失";
    textView.textColor = [UIColor lightGrayColor];
    textView.delegate = self;
    [self.view addSubview:textView];

}

#pragma mark - UITextViewDelegate
- (void)textViewDidEndEditing:(UITextView *)textView
{
    if(textView.text.length < 1){
        textView.text = @"这种方法的特点是，当用户点击了TextView的，占位符占位文字就会立马消失，官方的占位符是当系统监听到用户输入了文字后占位符才会消失";
        textView.textColor = [UIColor grayColor];
    }
}
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if([textView.text isEqualToString:@"这种方法的特点是，当用户点击了TextView的，占位符占位文字就会立马消失，官方的占位符是当系统监听到用户输入了文字后占位符才会消失"]){
        textView.text=@"";
        textView.textColor=[UIColor blackColor];
    }
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
