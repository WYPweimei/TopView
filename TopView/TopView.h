//
//  TopView.h
//  顶部滑动试图
//
//  Created by 王烨谱 on 15/11/5.
//  Copyright © 2015年 王烨谱. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^TapBlcok) (UITapGestureRecognizer *tap);

@interface TopView : UIScrollView

@property (nonatomic, strong)UIImageView *backImgV;
@property (nonatomic, copy)TapBlcok tapBlock;

- (instancetype)initWithFrame:(CGRect)frame
                     titleArr:(NSArray *)titleArr
                    backColor:(UIColor *)backColor
                    titleFont:(UIFont *)titleFont
                    itmeWidth:(CGFloat)itmeWidth;


-(void)TapBlcokAction:(TapBlcok)block;

@end
