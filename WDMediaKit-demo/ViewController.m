//
//  ViewController.m
//  WDMediaKit-demo
//
//  Created b/Users/qiyun/Documents/WDMediaKit/WDMediaKit-demo/WDMediaKit-demoy 祁云 on 2020/7/31.
//  Copyright © 2020 祁云. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () < UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView   *tableView;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        
    [self.view addSubview:self.tableView];
}


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}


- (NSArray *)controlNames {
    return @[@"WDMediaViewController",
             @"WDCaptureViewController",
             @"WDCaptureRecordViewController",
             @"WDBackgroundRenderVewController",
    ];
}


- (NSArray *)cellForTitles {
    return @[@"视频播放",
             @"摄像头拍摄",
             @"视频录制",
             @"后台处理",
    ];
}


#pragma mark    -   UITableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Class cls = NSClassFromString([self controlNames][indexPath.row]);
    if (cls) {
        UIViewController *obj = (UIViewController *)[[cls alloc] init];
        if (obj) {
            obj.title = [self cellForTitles][indexPath.row];
            [self.navigationController pushViewController:obj animated:YES];
        }
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self cellForTitles].count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    if (cell) {
        cell.textLabel.text = [self cellForTitles][indexPath.row];
    }
    return cell;
}


@end
