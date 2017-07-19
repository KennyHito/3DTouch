//
//  ViewController.m
//  3DTouch
//
//  Created by apple on 16/12/1.
//  Copyright © 2016年 KennyHito. All rights reserved.
//

#import "ViewController.h"
#import "OneViewController.h"
#import "twoViewController.h"

@interface ViewController ()

@property (nonatomic,strong) OneViewController * oneVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"V";
    
    _oneVC = [[OneViewController alloc]init];
    
    [self registerNotification];
    
    
    NSArray * titleArr = @[@"分享App",@"首页"];
    NSArray * typeArr = @[@"ONE",@"TWO"];
    NSMutableArray * dataArr = [[NSMutableArray alloc]init];
    for (int i = 0; i<titleArr.count; i++) {
        // 创建标签的ICON图标。
        UIApplicationShortcutIcon *icon;
        if (i==0) {
            icon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeShare];
        }else if(i==1){
            icon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeHome];
        }
        // 创建一个标签，并配置相关属性。
        UIApplicationShortcutItem *item = [[UIApplicationShortcutItem alloc] initWithType:typeArr[i] localizedTitle:titleArr[i] localizedSubtitle:nil icon:icon userInfo:nil];
        [dataArr addObject:item];
    }
    
    // 将标签添加进Application的shortcutItems中。
    [UIApplication sharedApplication].shortcutItems = dataArr;

}

- (void)registerNotification{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onesNotification) name:@"ONES" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(twpsNotification) name:@"TWOS" object:nil];
}

/**跳转页面一*/
- (void)onesNotification{
    [self.navigationController pushViewController:_oneVC animated:YES];
}
/**跳转页面二*/
- (void)twpsNotification{
    [self.navigationController pushViewController:[twoViewController new] animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
