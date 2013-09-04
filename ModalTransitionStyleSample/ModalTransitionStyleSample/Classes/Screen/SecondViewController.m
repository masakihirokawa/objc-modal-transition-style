//
//  SecondViewController.m
//  ModalTransitionStyleSample
//
//  Created by 廣川政樹 on 2013/09/04.
//  Copyright (c) 2013年 Masaki Hirokawa. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //背景指定
    self.view.backgroundColor = [UIColor underPageBackgroundColor];
    
    //ボタン配置
    UIButton *backButton = [DCButton planeButton:BACK_BTN_RECT
                                            text:@"Back" delegate:self action:@selector(buttonTapEvent:) tag:0];
    [self.view addSubview:backButton];
}

- (void)buttonTapEvent:(UIButton *)button
{
    //前の画面へ戻る
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
