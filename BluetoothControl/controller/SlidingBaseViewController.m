//
//  SlidingBaseViewController.m
//  BluetoothControl
//
//  Created by sdzg on 15/4/23.
//  Copyright (c) 2015年 646767424@qq.com. All rights reserved.
//

#import "SlidingBaseViewController.h"
#import <UIViewController+ECSlidingViewController.h>

@interface SlidingBaseViewController ()

@end

@implementation SlidingBaseViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  [self.navigationController.view
      addGestureRecognizer:self.slidingViewController.panGesture];
  self.navigationItem.leftBarButtonItem =
      [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"home_Left"]
                                       style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector(menuButtonAction:)];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)menuButtonAction:(id)sender {
  [self.slidingViewController anchorTopViewToRightAnimated:YES];
}
@end
