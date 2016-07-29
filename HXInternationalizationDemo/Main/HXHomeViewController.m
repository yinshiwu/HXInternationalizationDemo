//
//  HXHomeViewController.m
//  HXInternationalizationDemo
//
//  Created by 黄轩 on 16/7/28.
//  Copyright © 2016年 黄轩. All rights reserved.
//

#import "HXHomeViewController.h"
#import "HXPreferenceViewController.h"
#import "HXInternationalizationManager.h"

@interface HXHomeViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *icoImageView;

@end

@implementation HXHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //注册通知，用于接收改变语言的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLanguage) name:ChangeLanguageNotificationName object:nil];

    [self changeLanguage];
}

- (void)gotoPreferenceViewController {
    HXPreferenceViewController *vc = [HXPreferenceViewController new];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self.navigationController presentViewController:nav animated:YES completion:nil];
}

- (void)changeLanguage {
    self.title = kLocalizedString(@"home",@"首页");
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:kLocalizedString(@"preference",@"偏好") style:UIBarButtonItemStyleDone target:self action:@selector(gotoPreferenceViewController)];
    self.navigationItem.rightBarButtonItem = item;
    
    _titleLabel.text = kLocalizedString(@"welcome",@"你好 世界!");
    _icoImageView.image = [kInternationalizationManager ittemInternationalImageWithName:@"details_promotion"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self forKeyPath:ChangeLanguageNotificationName];
}

@end