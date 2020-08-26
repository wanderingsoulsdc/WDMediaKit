//
//  WDMediaViewController.m
//  WDMediaKit-demo
//
//  Created by 祁云 on 2020/8/20.
//  Copyright © 2020 祁云. All rights reserved.
//

#import "WDMediaViewController.h"

@interface WDMediaViewController ()
@property (strong, nonatomic) WDMediaPlayer    *mediaPlayer;
@end

@implementation WDMediaViewController


- (void)dealloc {
    [self.mediaPlayer.preview removeFromSuperview];
    self.mediaPlayer = nil;
}


- (void)viewDidLoad {
    // Do any additional setup after loading the view.
    

    NSString *file = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"mp4"];
    NSString *file2 = [[NSBundle mainBundle] pathForResource:@"test2" ofType:@"mov"];
    NSString *file3 = [[NSBundle mainBundle] pathForResource:@"test3" ofType:@"mp4"];
    NSString *file4 = [[NSBundle mainBundle] pathForResource:@"test4" ofType:@"mov"];
    
    self.mediaPlayer = [[WDMediaPlayer alloc] initWithURLsArray:@[[NSURL fileURLWithPath:file], [NSURL fileURLWithPath:file2], [NSURL fileURLWithPath:file3], [NSURL fileURLWithPath:file4]]];
    self.mediaPlayer.preview.frame = self.view.bounds;
    [self.view addSubview:self.mediaPlayer.preview];
    
    self.textureProcessing = self.mediaPlayer.textureProcessing;
    [super viewDidLoad];
}



@end
