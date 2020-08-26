//
//  WDBaseViewController.m
//  WDMediaKit-demo
//
//  Created by 祁云 on 2020/8/20.
//  Copyright © 2020 祁云. All rights reserved.
//

#import "WDBaseViewController.h"
#import <Photos/Photos.h>

@interface WDBaseViewController ()

@end

@implementation WDBaseViewController



- (NSArray *)effects {
    return @[@"原图",
             @"马赛克", @"灵魂出窍",  @"抖动", @"毛刺",
             @"幻觉", @"素描", @"上下分镜", @"左右分镜",
             @"四分镜", @"网格化", @"淡入", @"淡出",
             @"闪白", @"水彩画", @"油画", @"卡通"];
}

- (NSArray *)filters {
    return @[@"LUT-原图", @"LUT-冷酷", @"LUT-城市01", @"LUT-城市02",
             @"LUT-平衡", @"LUT-鲜艳", @"LUT-高亮", @"LUT-深秋",
             @"LUT-日落", @"LUT-明亮", @"LUT-樱花", @"LUT-橘色",
             @"LUT-温暖", @"LUT-相机", @"LUT-绿色", @"LUT-全彩",
             @"LUT-古典", @"LUT-寒冬", @"LUT-恐怖红", @"LUT-恐怖蓝",
             @"LUT-真实", @"LUT-深蓝", @"LUT-淡蓝", @"LUT-照明"];
}

- (NSArray *)overlays {
    return @[@"贴图-单张-png", @"贴图-多张-gif", @"多张png序列图"];
}


- (NSArray *)gifts {
    return @[@"1", @"2", @"3", @"4", @"5", @"6",
             @"7", @"8", @"9", @"10", @"11", @"12",
             @"13", @"14", @"15",
    ];
}


- (NSArray *)arrayOfTag:(int64_t)tag {
    switch (tag) {
        case 10:
            return [self effects];
            break;
        case 11:
            return [self filters];
            break;
        case 12:
            return [self overlays];
            break;
        case 13:
            return [self gifts];
            break;
            
        default:
            break;
    }
    return nil;
}


- (NSString *)createTempFileWithFormat:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd-HH-mm-ss"];
    NSString *dateTime = [formatter stringFromDate:[NSDate date]];
    NSString *fileName = [NSString stringWithFormat:@"%ld-%@.%@", random() % 10^5, dateTime, format];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *file = [paths.firstObject stringByAppendingPathComponent:fileName];
    if ([[NSFileManager defaultManager] fileExistsAtPath:file]) {
        [[NSFileManager defaultManager] removeItemAtPath:file error:nil];
    }
    return file;
}



- (void)dealloc {
    
    [_textureProcessing cleanup];
    _textureProcessing = nil;
}


- (WDGLTextureProcessing *)textureProcessing {
    if (!_textureProcessing) {
        _textureProcessing = [[WDGLTextureProcessing alloc] init];
        _textureProcessing.effectId = 16;
    }
    return _textureProcessing;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSArray *titles = @[@"特效", @"滤镜", @"贴图", @"融合"];
    [titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setBackgroundColor:[UIColor whiteColor]];
        [button setFrame:CGRectMake(20 + (idx % 2) * 100, 120 + (idx / 2) * 60, 60, 30)];
        [button setTitle:obj forState:UIControlStateNormal];
        [button addTarget:self action:@selector(showAlertView:) forControlEvents:UIControlEventTouchUpInside];
        [button setTag:idx + 10];
        [self.view addSubview:button];
    }];
    
    UIBarButtonItem *save = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(savaSnapshotImage:)];
    self.navigationItem.rightBarButtonItem = save;
}



- (void)showAlertView:(UIButton *)sender
{
    // 1.创建UIAlertController
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"选择一种效果"
                                                                             message:@"实时作用到当前画面"
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];
    
    [[self arrayOfTag:sender.tag] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIAlertAction *elementAction = [UIAlertAction actionWithTitle:obj style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"Cancel Action");
            switch (sender.tag) {
                case 10:
                    [self.textureProcessing setEffectId:idx];
                    break;
                case 11:
                    [self.textureProcessing setFilterId:idx];
                    break;
                case 12:
                {
                    NSString *path;
                    if (idx == 0) {
                        path = [[NSBundle mainBundle] pathForResource:@"abc" ofType:@"png"];
                        [self.textureProcessing addOverlayToPosition:CGRectMake(100, 20, 90, 160) path:path imagesAngle:180 identifier:@"1" intervalTime:0];
                    } else if (idx == 1) {
                        path = [[NSBundle mainBundle] pathForResource:@"15" ofType:@"gif"];
                        [self.textureProcessing addOverlayToPosition:CGRectMake(100, 200, 90, 160) path:path imagesAngle:0 identifier:@"2" intervalTime:0];
                    }else if (idx == 2) {
                        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
                        NSString *path = [paths.firstObject stringByAppendingPathComponent:@"3010000002"];
                        [self.textureProcessing addOverlayToPosition:CGRectMake(100, 400, 90, 160) path:path imagesAngle:90 identifier:@"3" intervalTime:100];
                    }
                }
                    break;
                case 13:
                {
                    NSString *path1 = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",obj] ofType:@"gif"];
                    [self.textureProcessing setMixResourceOfPath:path1];
                }
                    break;
                default:
                    break;
            }
        }];
        [alertController addAction:elementAction];
    }];
    
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"OK Action");
    }];
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}


- (void)savaSnapshotImage:(UIBarButtonItem *)item {
    
    UIImage *image = [self.textureProcessing snapshotImage];
    
    [[PHPhotoLibrary sharedPhotoLibrary]performChanges:^{
           [PHAssetChangeRequest creationRequestForAssetFromImage:image];
       } completionHandler:^(BOOL success, NSError * _Nullable error) {
           if (error) {
               NSLog(@"%@",@"保存失败");
           } else {
               NSLog(@"%@",@"保存成功");
           }
       }];
}


@end
