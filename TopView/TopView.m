
//
//  TopView.m
//  顶部滑动试图
//
//  Created by 王烨谱 on 15/11/5.
//  Copyright © 2015年 王烨谱. All rights reserved.
//

#import "TopView.h"
#import "NSString+InputCheck.h"

@interface TopView()<UIScrollViewDelegate>
@property(nonatomic, strong)NSArray *titleArr;
@property(nonatomic, strong)UIColor *backColor;
@property(nonatomic, strong)UIFont *titleFont;
@property(nonatomic, assign)CGFloat itmeWidth;

@end
@implementation TopView

- (instancetype)initWithFrame:(CGRect)frame
                     titleArr:(NSArray *)titleArr
                    backColor:(UIColor *)backColor
                    titleFont:(UIFont *)titleFont
                    itmeWidth:(CGFloat)itmeWidth
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = backColor;
        self.titleFont = titleFont;
        self.titleArr = titleArr;
        self.itmeWidth = itmeWidth;
        
        self.bounces = NO;
        self.delegate = self;
        
        [self makeViews];
        
        self.contentSize = CGSizeMake(itmeWidth * titleArr.count, 0);
        
        [self addTap];
        
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    CGFloat smallW;
    CGFloat smallH;
    CGFloat width = self.frame.size.width/_titleArr.count;
    CGFloat height = self.frame.size.height;
    CGContextRef context = UIGraphicsGetCurrentContext();
    for (int i = 0 ; i < _titleArr.count; i ++) {
        CGContextSetLineWidth(context, 1.0);
        CGContextSetRGBFillColor (context, 0.5, 0.5, 0.5, 0.5);
        UIFont  *font = _titleFont;
        NSString *text = _titleArr[i];
        smallW = [text calculateWidthFont:_titleFont].width;
        smallH = [text calculateHeightWithFont:_titleFont labelWidth:smallW].size.height;
        [text drawInRect:CGRectMake(width * i + (width - smallW)/2, (height - smallH)/2, width, height) withAttributes:@{NSFontAttributeName : font}];
    }
}
-(void)makeViews
{
    
    
    _backImgV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width/_titleArr.count, self.frame.size.height)];
    _backImgV.image = [UIImage imageNamed:@"chose_icon"];
    [self addSubview:_backImgV];
    
}
-(void)addTap
{
    UITapGestureRecognizer* singleRecognizer;
    singleRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(SingleTap:)];
    //点击的次数
    singleRecognizer.numberOfTapsRequired = 1; // 单击
    //给self.view添加一个手势监测；
    [self addGestureRecognizer:singleRecognizer];
}

-(void)SingleTap:(UITapGestureRecognizer *)tap
{
    CGFloat width = self.frame.size.width/_titleArr.count;
    CGFloat height = self.frame.size.height;
    CGPoint P = [tap locationInView:self];
    for (int i = 0; i < _titleArr.count; i ++) {
        BOOL isRect = CGRectContainsPoint(CGRectMake(width * i, 0, width, height), P);
        if (isRect) {
            tap.view.tag = i;
        }
    }
    self.tapBlock(tap);

}
-(void)TapBlcokAction:(TapBlcok)block
{
    self.tapBlock = block;
}

@end
