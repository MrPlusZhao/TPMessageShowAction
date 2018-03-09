//
//  TPMessageShowTools.m
//  TPMessageShow
//
//  Created by ztp on 2018/3/8.
//  Copyright © 2018年 Mr.Plus. All rights reserved.
//

#import "TPMessageShowTools.h"

# define iOS9Later ([UIDevice currentDevice].systemVersion.floatValue >= 9.0f)

static TPMessageShowTools * _messageTool = nil;


@interface TPMessageShowTools ()<UIAlertViewDelegate>
{
    dispatch_block_t  _leftActionBlock;
    dispatch_block_t  _rightActionBlock;
}
@end

@implementation TPMessageShowTools


+ (instancetype)ShareMessageTool
{
    static dispatch_once_t once_token;
    dispatch_once(&once_token, ^{
        _messageTool = [[self alloc]init];
    });
    return _messageTool;

}

- (void)TPShowMessage:(NSString *)msg
            DetailMsg:(NSString*)detailStr
             LeftItem:(NSString *)leftStr
            RightItem:(NSString*)rightStr
                   VC:(UIViewController*)vc
           LeftAction:(dispatch_block_t)leftAction
          RightAction:(dispatch_block_t)rightAction
{
    _leftActionBlock = leftAction;
    _rightActionBlock = rightAction;
    
    if (!msg) {
        msg = @"title";
    }
    if (!detailStr) {
        detailStr = @"detail";
    }
    if (!leftStr) {
        leftStr = @"item01";
    }
    if (!rightStr) {
        rightStr = @"item02";
    }
    
    if (iOS9Later) {
        [self AlertControllerCreateForTPShowMessage:msg DetailMsg:detailStr LeftItem:leftStr RightItem:rightStr VC:vc];
    }
    else
    {
        [self AlertCreateForTPShowMessage:msg DetailMsg:detailStr LeftItem:rightStr RightItem:leftStr];
        
    }
}


- (void)AlertCreateForTPShowMessage:(NSString *)msg
                    DetailMsg:(NSString*)detailStr
                    LeftItem:(NSString *)leftStr
                    RightItem:(NSString*)rightStr
{
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:msg message:detailStr delegate:self cancelButtonTitle:leftStr otherButtonTitles:rightStr, nil];
    
    [alert show];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        
        _leftActionBlock();
    }
    if (buttonIndex == 1) {
        _rightActionBlock();
    }
}

- (void)AlertControllerCreateForTPShowMessage:(NSString *)msg
                                    DetailMsg:(NSString*)detailStr
                                     LeftItem:(NSString *)leftStr
                                    RightItem:(NSString*)rightStr
                                           VC:(UIViewController*)vc
{
    if (!vc) {
        return;
    }
    UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:msg message:detailStr preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * action1 = [UIAlertAction actionWithTitle:rightStr style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
       
        if (_rightActionBlock) {
            _rightActionBlock();
        }
    }];
    
    UIAlertAction * action2 = [UIAlertAction actionWithTitle:leftStr style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (_leftActionBlock) {
            _leftActionBlock();
        }
    }];
    
    [alertVC addAction:action1];
    [alertVC addAction:action2];
    [vc presentViewController:alertVC animated:YES completion:nil];
}
@end
