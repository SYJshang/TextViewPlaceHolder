//
//  UITextView+SYJText.m
//  TextViewForPlaceHold
//
//  Created by 尚勇杰 on 2018/4/9.
//  Copyright © 2018年 尚勇杰. All rights reserved.
//

#import "UITextView+SYJText.h"
#import <objc/message.h>

static const void *syj_placeHolderKey;
@interface UITextView ()
@property (nonatomic, readonly) UILabel *syj_placeHolderLabel;
@end

@implementation UITextView (SYJText)

+(void)load{
    [super load];
    
    //方法交换
    method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"layoutSubviews")),
                                   class_getInstanceMethod(self.class, @selector(SYJPlaceHolder_swizzling_layoutSubviews)));
    method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"dealloc")),
                                   class_getInstanceMethod(self.class, @selector(SYJPlaceHolder_swizzled_dealloc)));
    method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"setText:")),
                                   class_getInstanceMethod(self.class, @selector(SYJPlaceHolder_swizzled_setText:)));
}

#pragma mark - swizzling

- (void)SYJPlaceHolder_swizzled_dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self SYJPlaceHolder_swizzled_dealloc];
}

- (void)SYJPlaceHolder_swizzling_layoutSubviews{
    if (self.syj_placeHolder) {
        UIEdgeInsets textContainerInset = self.textContainerInset;
        CGFloat lineFragmentPadding = self.textContainer.lineFragmentPadding;
        CGFloat x = lineFragmentPadding + textContainerInset.left + self.layer.borderWidth;
        CGFloat y = textContainerInset.top + self.layer.borderWidth;
        CGFloat width = CGRectGetWidth(self.bounds) - x - textContainerInset.right - 2*self.layer.borderWidth;
        CGFloat height = [self.syj_placeHolderLabel sizeThatFits:CGSizeMake(width, 0)].height;
        self.syj_placeHolderLabel.frame = CGRectMake(x, y, width, height);
    }
    [self SYJPlaceHolder_swizzling_layoutSubviews];
}
- (void)SYJPlaceHolder_swizzled_setText:(NSString *)text{
    [self SYJPlaceHolder_swizzled_setText:text];
    if (self.syj_placeHolder) {
        [self updatePlaceHolder];
    }
}
#pragma mark - associated

//动态添加属性
//绑定syj_placeHolder属性,作为textview的占位符
-(NSString *)syj_placeHolder{
    return objc_getAssociatedObject(self, &syj_placeHolderKey);
}
-(void)setSyj_placeHolder:(NSString *)syj_placeHolder{
    objc_setAssociatedObject(self, &syj_placeHolderKey, syj_placeHolder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self updatePlaceHolder];
}
-(UIColor *)syj_placeHolderColor{
    return self.syj_placeHolderLabel.textColor;
}
-(void)setSyj_placeHolderColor:(UIColor *)syj_placeHolderColor{
    self.syj_placeHolderLabel.textColor = syj_placeHolderColor;
}
-(NSString *)placeholder{
    return self.syj_placeHolder;
}
-(void)setPlaceholder:(NSString *)placeholder{
    self.syj_placeHolder = placeholder;
}

#pragma mark - update
- (void)updatePlaceHolder{
    if (self.text.length) {
        [self.syj_placeHolderLabel removeFromSuperview];
        return;
    }
    self.syj_placeHolderLabel.font = self.font?self.font:self.cacutDefaultFont;
    self.syj_placeHolderLabel.textAlignment = self.textAlignment;
    self.syj_placeHolderLabel.text = self.syj_placeHolder;
    [self insertSubview:self.syj_placeHolderLabel atIndex:0];
}

#pragma mark - lazzing
-(UILabel *)syj_placeHolderLabel{
    UILabel *placeHolderLab = objc_getAssociatedObject(self, @selector(syj_placeHolderLabel));
    if (!placeHolderLab) {
        placeHolderLab = [[UILabel alloc] init];
        placeHolderLab.numberOfLines = 0;
        placeHolderLab.textColor = [UIColor lightGrayColor];
        objc_setAssociatedObject(self, @selector(syj_placeHolderLabel), placeHolderLab, OBJC_ASSOCIATION_RETAIN);
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updatePlaceHolder) name:UITextViewTextDidChangeNotification object:self];
    }
    return placeHolderLab;
}
- (UIFont *)cacutDefaultFont{
    static UIFont *font = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UITextView *textview = [[UITextView alloc] init];
        textview.text = @" ";
        font = textview.font;
    });
    return font;
}


@end
