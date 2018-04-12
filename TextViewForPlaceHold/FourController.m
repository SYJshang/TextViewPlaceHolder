//
//  FourController.m
//  TextViewForPlaceHold
//
//  Created by 尚勇杰 on 2018/4/9.
//  Copyright © 2018年 尚勇杰. All rights reserved.
//

#import "FourController.h"
#import "SYJFourTextView.h"

@interface FourController ()<UITextViewDelegate>

@end

@implementation FourController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    SYJFourTextView *textView = [[SYJFourTextView alloc] initWithFrame:CGRectMake(10, 80, self.view.frame.size.width - 20, 240)];
    textView.backgroundColor = [UIColor grayColor];
    textView.placeholder = @"这个方法的和方法三很相似，只是没有利用通知来监听文本的改变，需要配合textViewDidChanged:这个文本改变的代理方法使用。";
    textView.placeholderColor = [UIColor lightGrayColor];
    textView.delegate = self;
    [self.view addSubview:textView];
    // textView.text = @"试试会不会调用文本改变的代理方法";
    
    
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    [self dismissViewControllerAnimated:YES completion:nil];
    
    // self.textView = textView;
}

#pragma mark - UITextViewDelegate
- (void)textViewDidChange:(SYJFourTextView *)textView // 此处取巧，把代理方法参数类型直接改成自定义的SYJFourTextView类型，为了可以使用自定义的placeholder属性，省去了通过给控制器SYJFourTextView类型属性这样一步。
{
    if (textView.hasText) { // textView.text.length
        textView.placeholder = @"";
        
    } else {
        textView.placeholder = @"这个方法的和方法三很相似，只是没有利用通知来监听文本的改变，需要配合textViewDidChanged:这个文本改变的代理方法使用";
        
    }
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
