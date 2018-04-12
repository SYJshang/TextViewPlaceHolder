//
//  UITextView+SYJText.h
//  TextViewForPlaceHold
//
//  Created by 尚勇杰 on 2018/4/9.
//  Copyright © 2018年 尚勇杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (SYJText)

/**
 *  UITextView+placeholder
 */
@property (nonatomic, copy) NSString *syj_placeHolder;
/**
 *  IQKeyboardManager等第三方框架会读取placeholder属性并创建UIToolbar展示
 */
@property (nonatomic, copy) NSString *placeholder;
/**
 *  placeHolder颜色
 */
@property (nonatomic, strong) UIColor *syj_placeHolderColor;


@end
