//
//  TPMessageShowTools.h
//  TPMessageShow
//
//  Created by ztp on 2018/3/8.
//  Copyright © 2018年 Mr.Plus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TPMessageShowTools : NSObject

+ (instancetype)ShareMessageTool;

- (void)TPShowMessage:(NSString *)msg
            DetailMsg:(NSString*)detailStr
             LeftItem:(NSString *)leftStr
            RightItem:(NSString*)rightStr
                   VC:(UIViewController*)vc
           LeftAction:(dispatch_block_t)leftAction
          RightAction:(dispatch_block_t)rightAction;


@end
