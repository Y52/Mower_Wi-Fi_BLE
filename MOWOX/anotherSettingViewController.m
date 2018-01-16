//
//  anotherSettingViewController.m
//  MOWOX
//
//  Created by Mac on 2017/12/14.
//  Copyright © 2017年 yusz. All rights reserved.
//

#import "anotherSettingViewController.h"
#import "BluetoothDataManage.h"
#import "GeneralsettingLanguageViewController.h"
#import "GeneralsettingTimeViewController.h"
#import "WorkTimeSettingViewController.h"
#import "PincodeSettingViewController.h"
#import "MowerSettingViewController.h"

@interface anotherSettingViewController ()

///@brife 帧数据控制单例
@property (strong,nonatomic) BluetoothDataManage *bluetoothDataManage;


@property (strong, nonatomic)  UIButton *LanguageButton;
@property (strong, nonatomic)  UIButton *TimeButton;
@property (strong, nonatomic)  UIButton *WorktimeButton;
@property (strong, nonatomic)  UIButton *PinButton;
@property (strong, nonatomic)  UIButton *mowerButton;

@end

@implementation anotherSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *backImage = [UIImage imageNamed:@"backgroundnew"];
    self.view.layer.contents = (id)backImage.CGImage;
    self.navigationItem.title = LocalString(@"Setting");
    
    self.bluetoothDataManage = [BluetoothDataManage shareInstance];
    
    [self viewLayoutSet];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewLayoutSet
{
    _LanguageButton = [UIButton buttonWithTitle:@"Language setting" titleColor:[UIColor blackColor]];
    _TimeButton = [UIButton buttonWithTitle:@"Time setting" titleColor:[UIColor blackColor]];
    _WorktimeButton = [UIButton buttonWithTitle:@"Working time setting" titleColor:[UIColor blackColor]];
    _PinButton = [UIButton buttonWithTitle:@"Pin setting" titleColor:[UIColor blackColor]];
    _mowerButton = [UIButton buttonWithTitle:@"Mower setting" titleColor:[UIColor blackColor]];
    [_LanguageButton setButtonStyle1];
    [_TimeButton setButtonStyle1];
    [_WorktimeButton setButtonStyle1];
    [_PinButton setButtonStyle1];
    [_mowerButton setButtonStyle1];
    [_LanguageButton addTarget:self action:@selector(languageSet) forControlEvents:UIControlEventTouchUpInside];
    [_TimeButton addTarget:self action:@selector(timeSet) forControlEvents:UIControlEventTouchUpInside];
    [_WorktimeButton addTarget:self action:@selector(worktimeSet) forControlEvents:UIControlEventTouchUpInside];
    [_PinButton addTarget:self action:@selector(pinSet) forControlEvents:UIControlEventTouchUpInside];
    [_mowerButton addTarget:self action:@selector(mowerSet) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_LanguageButton];
    [self.view addSubview:_TimeButton];
    [self.view addSubview:_WorktimeButton];
    [self.view addSubview:_PinButton];
    [self.view addSubview:_mowerButton];
    
    NSString *deviceType = [UIDevice currentDevice].model;
    
    if([deviceType isEqualToString:@"iPhone"]) {
        //iPhone
        [_LanguageButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(ScreenWidth * 0.82, ScreenHeight * 0.066));
            make.top.equalTo(self.view.mas_top).offset(ScreenHeight * 0.1 + 44);
            make.centerX.equalTo(self.view.mas_centerX);
        }];
    }else if([deviceType isEqualToString:@"iPad"]) {
        //iPad
        [_LanguageButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(ScreenWidth * 0.82, ScreenHeight * 0.066));
            make.top.equalTo(self.view.mas_top).offset(ScreenHeight * 0.05 + 44);
            make.centerX.equalTo(self.view.mas_centerX);
        }];
    }
    
    [_TimeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth * 0.82, ScreenHeight * 0.066));
        make.top.equalTo(self.LanguageButton.mas_bottom).offset(ScreenHeight * 0.05);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    [_WorktimeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth * 0.82, ScreenHeight * 0.066));
        make.top.equalTo(self.TimeButton.mas_bottom).offset(ScreenHeight * 0.05);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    [_mowerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth * 0.82, ScreenHeight * 0.066));
        make.top.equalTo(self.WorktimeButton.mas_bottom).offset(ScreenHeight * 0.05);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    [_PinButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth * 0.82, ScreenHeight * 0.066));
        make.top.equalTo(self.mowerButton.mas_bottom).offset(ScreenHeight * 0.05);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    
}


#pragma mark - ViewController
- (void)languageSet{
    GeneralsettingLanguageViewController *VC = [[GeneralsettingLanguageViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)timeSet{
    GeneralsettingTimeViewController *VC = [[GeneralsettingTimeViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)worktimeSet{
    WorkTimeSettingViewController *VC = [[WorkTimeSettingViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)pinSet{
    PincodeSettingViewController *VC = [[PincodeSettingViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)mowerSet{
    MowerSettingViewController *VC = [[MowerSettingViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}

@end