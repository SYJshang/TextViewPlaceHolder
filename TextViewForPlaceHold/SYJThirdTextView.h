//
//  SYJThirdTextView.h
//  TextViewForPlaceHold
//
//  Created by 尚勇杰 on 2018/4/9.
//  Copyright © 2018年 尚勇杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SYJThirdTextView : UITextView

//    1.自定义UITextView
//    2.给UITextView添加placeholder和placeholderColor属性
//    3.重写initWithFrame方法
//    4.添加通知监听文字改变
//    5.重写drawRect：方法
//    6.重写相关属性的set方法

/** 占位文字 */
@property (nonatomic, copy) NSString *placeholder;
/** 占位文字颜色 */
@property (nonatomic, strong) UIColor *placeholderColor;


@end
