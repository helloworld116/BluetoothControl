//
//  DeviceListViewController.m
//  BluetoothControl
//
//  Created by sdzg on 15/4/22.
//  Copyright (c) 2015年 646767424@qq.com. All rights reserved.
//

#import "DeviceListViewController.h"
#import <UIViewController+ECSlidingViewController.h>
#import "MEZoomAnimationController.h"
#import "SetNameViewController.h"
#import <HexColors/HexColor.h>

@interface DeviceListViewController ()
@property (nonatomic, strong)
    MEZoomAnimationController *zoomAnimationController;
@end

@implementation DeviceListViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  // Uncomment the following line to preserve selection between presentations.
  self.navigationItem.title = NSLocalizedString(@"列表", nil);

  self.zoomAnimationController = [[MEZoomAnimationController alloc] init];
  id<ECSlidingViewControllerDelegate> transition = self.zoomAnimationController;
  self.slidingViewController.delegate = transition;
  self.slidingViewController.topViewAnchoredGesture =
      ECSlidingViewControllerAnchoredGestureTapping |
      ECSlidingViewControllerAnchoredGesturePanning;
  self.slidingViewController.customAnchoredGestures = @[];

  UIView *view = [[UIView alloc] init];
  view.backgroundColor = [UIColor clearColor];
  self.tableView.tableFooterView = view;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  // Return the number of sections.
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section {
  // Return the number of rows in the section.
  return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *deviceListCellId = @"deviceListCellId";
  UITableViewCell *cell =
      [tableView dequeueReusableCellWithIdentifier:deviceListCellId
                                      forIndexPath:indexPath];
  return cell;
}

#pragma mark
- (IBAction)onOffAction:(id)sender {
  NSIndexPath *indexPath = [self indexPathWithView:sender];
}

- (IBAction)nameAction:(id)sender {
  NSIndexPath *indexPath = [self indexPathWithView:sender];
  SetNameViewController *nameViewController = [self.storyboard
      instantiateViewControllerWithIdentifier:@"SetNameViewController"];
  nameViewController.devicename = @"小插座";
  UINavigationController *nextVC = [[UINavigationController alloc]
      initWithRootViewController:nameViewController];
  nextVC.navigationBar.barTintColor = [UIColor colorWithHexString:@"3399ff"];
  nextVC.navigationBar.tintColor = [UIColor whiteColor];
  [self presentViewController:nextVC animated:YES completion:nil];
}

- (NSIndexPath *)indexPathWithView:(id)sender {
  CGPoint buttonPosition =
      [sender convertPoint:CGPointZero toView:self.tableView];
  NSIndexPath *indexPath =
      [self.tableView indexPathForRowAtPoint:buttonPosition];
  return indexPath;
}
@end
