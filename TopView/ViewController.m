//
//  ViewController.m
//  TopView
//
//  Created by 王烨谱 on 15/12/18.
//  Copyright © 2015年 王烨谱. All rights reserved.
//

#import "ViewController.h"
#import "TopView.h"
// 获取设备屏幕的物理尺寸
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
@interface ViewController ()
@property(nonatomic, retain)TopView *topView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __block ViewController * this = self;
    NSArray *arr = @[@"果蔬",@"豆类",@"肉食"];
    _topView = [[TopView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, 40) titleArr:arr backColor:[UIColor colorWithRed:0.980 green:0.978 blue:1.000 alpha:1.000] titleFont:[UIFont systemFontOfSize:14] itmeWidth:0];
    [_topView TapBlcokAction:^(UITapGestureRecognizer *tap) {
        [this tapAction:tap];
    }];
    [self.view addSubview:_topView];

    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark  tapAction
-(void)tapAction : (UITapGestureRecognizer *)tap
{
    CGFloat width = self.view.frame.size.width/3;
    NSInteger i = tap.view.tag;
    [UIView animateWithDuration:.3 animations:^{
        _topView.backImgV.frame = CGRectMake(width * i, 0, width , 40);
        NSInteger tapTag = tap.view.tag;
        
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
