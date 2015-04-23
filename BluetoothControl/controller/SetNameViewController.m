//
//  SetNameViewController.m
//  BluetoothControl
//
//  Created by sdzg on 15/4/23.
//  Copyright (c) 2015年 646767424@qq.com. All rights reserved.
//

#import "SetNameViewController.h"
@interface DeviceNameTextField : UITextField

@end

@implementation DeviceNameTextField

//控制文本所在的的位置，左右缩 10
- (CGRect)textRectForBounds:(CGRect)bounds {
  return CGRectInset(bounds, 15, 0);
}

//控制编辑文本时所在的位置，左右缩 10
- (CGRect)editingRectForBounds:(CGRect)bounds {
  return CGRectInset(bounds, 15, 0);
}

@end

@interface SetNameViewController () <UITextFieldDelegate>
@property (nonatomic, weak) IBOutlet UITextField *textName;
@end

@implementation SetNameViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  self.navigationItem.leftBarButtonItem =
      [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"取消", nil)
                                       style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector(cancelAction:)];
  self.navigationItem.rightBarButtonItem =
      [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"保存", nil)
                                       style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector(saveAction:)];
  self.navigationItem.title = NSLocalizedString(@"名字", nil);
  self.textName.delegate = self;
  self.textName.text = self.devicename;
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self.textName becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - UITextField协议
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  [self.textName resignFirstResponder];
  return YES;
}

#pragma mark
- (void)cancelAction:(id)sender {
  [self dismissViewControllerAnimated:YES
                           completion:^{

                           }];
}

- (void)saveAction:(id)sender {
  [self dismissViewControllerAnimated:YES
                           completion:^{

                           }];
}
@end
