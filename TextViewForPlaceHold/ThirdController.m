//
//  ThirdController.m
//  TextViewForPlaceHold
//
//  Created by 尚勇杰 on 2018/4/9.
//  Copyright © 2018年 尚勇杰. All rights reserved.
//

#import "ThirdController.h"
#import "SYJThirdTextView.h"

@interface ThirdController ()

@end

@implementation ThirdController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [super touchesBegan:touches withEvent:event];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

//    1.自定义UITextView
//    2.给UITextView添加placeholder和placeholderColor属性
//    3.重写initWithFrame方法
//    4.添加通知监听文字改变
//    5.重写drawRect：方法
//    6.重写相关属性的set方法
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    SYJThirdTextView *textView = [[SYJThirdTextView alloc]init];
    [self.view addSubview:textView];
    textView.frame = CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width - 20, 240);
    textView.placeholder = @"相比计较上面两种方法，这种方法可移植性、拓展性更好，这种方法，不仅乐意随意通过我们添加的placeholder属性设置默认文字，还可以通过我们添加的placeholderColor设置默认文字的颜色。今后，我们只需要写好这么一个自定义UITextView，就可以一劳永逸。";
    textView.backgroundColor = [UIColor grayColor];
    //占位符颜色
    textView.placeholderColor = [UIColor lightGrayColor];


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
