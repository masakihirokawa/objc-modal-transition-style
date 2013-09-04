//
//  RootViewController.m
//  ModalTransitionStyleSample
//
//  Created by 廣川政樹 on 2013/09/04.
//  Copyright (c) 2013年 Masaki Hirokawa. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

typedef enum transitionId : NSUInteger {
    TRANS_COVER_VERTICAL  = 1,
    TRANS_FLIP_HORIZONTAL = 2,
    TRANS_PARTICAL_CURL   = 3,
    TRANS_CROSS_DISSOLVE  = 4
} transitionId;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //ボタン配置
    [self setButtons];
}

//ボタン配置
- (void)setButtons
{
    //Transitiion Style: UIModalTransitionStyleCoverVertical
    UIButton *transitionCoverVerticalButton = [DCButton planeButton:CGRectMake(self.view.center.x - (BTN_WIDTH / 2), BTN_MARGIN_Y, BTN_WIDTH, BTN_HEIGHT)
                                                               text:@"UIModalTransitionStyleCoverVertical"
                                                           delegate:self action:@selector(buttonTapEvent:) tag:TRANS_COVER_VERTICAL];
    [self.view addSubview:transitionCoverVerticalButton];
    
    //Transitiion Style: UIModalTransitionStyleFlipHorizontal
    UIButton *transitionFlipHorizontalButton = [DCButton planeButton:CGRectMake(self.view.center.x - (BTN_WIDTH / 2), (BTN_MARGIN_Y * 2), BTN_WIDTH, BTN_HEIGHT)
                                                                text:@"UIModalTransitionStyleFlipHorizontal"
                                                            delegate:self action:@selector(buttonTapEvent:) tag:TRANS_FLIP_HORIZONTAL];
    [self.view addSubview:transitionFlipHorizontalButton];
    
    //Transitiion Style: UIModalTransitionStyleParticalCurl
    UIButton *transitionParticalCurlButton = [DCButton planeButton:CGRectMake(self.view.center.x - (BTN_WIDTH / 2), (BTN_MARGIN_Y * 3), BTN_WIDTH, BTN_HEIGHT)
                                                              text:@"UIModalTransitionStyleParticalCurl"
                                                          delegate:self action:@selector(buttonTapEvent:) tag:TRANS_PARTICAL_CURL];
    [self.view addSubview:transitionParticalCurlButton];
    
    //Transitiion Style: UIModalTransitionStyleCrossDissolve
    UIButton *transitionCrossDissolve = [DCButton planeButton:CGRectMake(self.view.center.x - (BTN_WIDTH / 2), (BTN_MARGIN_Y * 4), BTN_WIDTH, BTN_HEIGHT)
                                                         text:@"UIModalTransitionStyleCrossDissolve"
                                                     delegate:self action:@selector(buttonTapEvent:) tag:TRANS_CROSS_DISSOLVE];
    [self.view addSubview:transitionCrossDissolve];
}

//ボタンタップイベント
- (void)buttonTapEvent:(UIButton *)button
{
    NSUInteger tag = button.tag;
    
    //ViewControllerのインスタンス生成
    UIViewController *secondViewController = [[SecondViewController alloc] init];
    
    //画面遷移アニメーションの指定
    if (tag == TRANS_COVER_VERTICAL) {
        secondViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    } else if (tag == TRANS_FLIP_HORIZONTAL) {
        secondViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    } else if (tag == TRANS_PARTICAL_CURL) {
        secondViewController.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    } else if (tag == TRANS_CROSS_DISSOLVE) {
        secondViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    }
    
    //画面遷移実行
    [self presentViewController:secondViewController animated:YES completion:nil];
}

@end
