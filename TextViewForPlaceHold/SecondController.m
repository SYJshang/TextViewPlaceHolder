//
//  SecondController.m
//  TextViewForPlaceHold
//
//  Created by 尚勇杰 on 2018/4/9.
//  Copyright © 2018年 尚勇杰. All rights reserved.
//

#import "SecondController.h"

@interface SecondController ()<UITextViewDelegate>

@property(nonatomic, weak)UITextView *textView;

@property(nonatomic, weak)UILabel *placeHolder;

@end

@implementation SecondController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [super touchesBegan:touches withEvent:event];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    1.创建textView
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 74, [UIScreen mainScreen].bounds.size.width - 20, 200)];
    textView.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:textView];
    self.textView = textView;
    self.textView.delegate = self;
    
    textView.contentInset = UIEdgeInsetsMake(-30, 0, 0, 0);

//    2.给textView添加一个UILabel子控件，作为占位符
    UILabel *placeHolder = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, [UIScreen mainScreen].bounds.size.width - 50, 200)];
    self.placeHolder = placeHolder;
    placeHolder.text = @"该方法同样也可以实现类似于占位符的功能相比较方法一，方法二可以实现动态监听文本的改变，并非弹出键盘就立即清除占位符，只有当用户开始输入文本的时候.placeholder才会消失。同样，当用户清空文本的时候，占位符又会重新显示出来。";
    placeHolder.textColor = [UIColor lightGrayColor];
    placeHolder.numberOfLines = 0;
    placeHolder.contentMode = UIViewContentModeTop;
    [self.textView addSubview:placeHolder];
    
//    3.在文本改变的代理方法里面显示/隐藏UILabel
    //在弹出的键盘上面加一个view来放置退出键盘的Done按钮
    UIToolbar * topView = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    [topView setBarStyle:UIBarStyleDefault];
    UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem * doneButton = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(dismissKeyBoard)];
    NSArray * buttonsArray = [NSArray arrayWithObjects:btnSpace, doneButton, nil];
    
    [topView setItems:buttonsArray];
    [textView setInputAccessoryView:topView];
}


#pragma mark - UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView
{
    if (!textView.text.length) {
        self.placeHolder.alpha = 1;
    } else {
        self.placeHolder.alpha = 0;
    }
}

//关闭键盘
-(void) dismissKeyBoard{
    [self.textView resignFirstResponder];
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
