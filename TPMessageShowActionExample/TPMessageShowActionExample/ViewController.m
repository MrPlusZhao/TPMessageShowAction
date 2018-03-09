//
//  ViewController.m
//  TPMessageShowActionExample
//
//  Created by ztp on 2018/3/9.
//  Copyright © 2018年 Mr.Plus. All rights reserved.
//

#import "ViewController.h"
#import "TPMessageShowTools.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [[TPMessageShowTools ShareMessageTool]TPShowMessage:@"" DetailMsg:@"你好" LeftItem:@"OK" RightItem:@"NO" VC:self LeftAction:^{
        NSLog(@"OKOK");
    } RightAction:^{
        NSLog(@"NONO");
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
