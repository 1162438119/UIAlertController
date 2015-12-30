//
//  ViewController.m
//  example
//
//  Created by mac on 15/12/30.
//  Copyright © 2015年 dqy. All rights reserved.
//

#import "ViewController.h"
#import "ZLPhotoActionSheet.h"
@interface ViewController ()

@property (nonatomic, strong) UIView * baseView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 0, 100, 40);
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    self.baseView = [[UIView alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, 400)];
    [self.view addSubview:self.baseView];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)btnAction {
    
    ZLPhotoActionSheet *actionSheet = [[ZLPhotoActionSheet alloc] init];
    //设置照片最大选择数
    actionSheet.maxSelectCount = 5;
    //设置照片最大预览数
    actionSheet.maxPreviewCount = 20;
    [actionSheet showWithSender:self animate:YES completion:^(NSArray<UIImage *> * _Nonnull selectPhotos) {
        [self.baseView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        
        CGFloat width = [UIScreen mainScreen].bounds.size.width/4-2;
        for (int i = 0; i < selectPhotos.count; i++) {
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(i%4*(width+2), i/4*(width+2), width, width)];
            imgView.image = selectPhotos[i];
            [self.baseView addSubview:imgView];
        }
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
