//
//  MenuViewController.m
//  BluetoothControl
//
//  Created by sdzg on 15/4/23.
//  Copyright (c) 2015年 646767424@qq.com. All rights reserved.
//

#import "MenuViewController.h"
#import <UIViewController+ECSlidingViewController.h>
#import <HexColors/HexColor.h>

@interface MenuCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *lblTitle;
@property (nonatomic, weak) IBOutlet UIImageView *imgVIcon;
@end

@implementation MenuCell
@end

@interface MenuViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *menus;
@property (nonatomic, strong) NSArray *images;

@property (nonatomic, strong)
    UINavigationController *transitionsNavigationController;
@end

@implementation MenuViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  self.menus = @[
    NSLocalizedString(@"主界面", nil),
    NSLocalizedString(@"设置", nil),
    NSLocalizedString(@"帮助", nil),
    NSLocalizedString(@"关于我们", nil)
  ];
  self.images =
      @[ @"home_icon", @"setting_icon", @"faq_icon", @"aboutUs_icon" ];
  self.transitionsNavigationController =
      (UINavigationController *)self.slidingViewController.topViewController;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section {
  // Return the number of rows in the section.
  return self.menus.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *menuCellId = @"menuCellId";
  MenuCell *cell = [tableView dequeueReusableCellWithIdentifier:menuCellId
                                                   forIndexPath:indexPath];
  cell.lblTitle.text = self.menus[indexPath.row];
  cell.imgVIcon.image = [UIImage imageNamed:self.images[indexPath.row]];
  return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  self.slidingViewController.topViewController.view.layer.transform =
      CATransform3DMakeScale(1, 1, 1);
  if (indexPath.row == 0) {
    self.slidingViewController.topViewController =
        self.transitionsNavigationController;
  } else {
    UIViewController *nextViewController;
    switch (indexPath.row) {
      case 1:
        nextViewController = [self.storyboard
            instantiateViewControllerWithIdentifier:@"SettingViewController"];
        break;
      case 2:
        nextViewController = [self.storyboard
            instantiateViewControllerWithIdentifier:@"HelpViewController"];
        break;
      case 3:
        nextViewController = [self.storyboard
            instantiateViewControllerWithIdentifier:@"AboutUsViewController"];
        break;
      default:
        nextViewController = [self.storyboard
            instantiateViewControllerWithIdentifier:@"SettingViewController"];
        break;
    }
    UINavigationController *nextNavController = [[UINavigationController alloc]
        initWithRootViewController:nextViewController];
    nextNavController.navigationBar.barTintColor =
        [UIColor colorWithHexString:@"3399ff"];
    nextNavController.navigationBar.translucent = NO;
    self.slidingViewController.topViewController = nextNavController;
  }
  [self.slidingViewController resetTopViewAnimated:YES];
}
@end
