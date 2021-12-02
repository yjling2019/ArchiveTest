//
//  ViewControllerProtocol.h
//  Test-yjling
//
//  Created by 凌永剑 on 2021/12/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ViewControllerProtocol <NSObject>

@optional
+ (instancetype)vc_controller;

- (void)vc_setUpUI;
- (void)vc_setUpConstraints;
- (void)vc_bindUIActions;
- (void)vc_loadInitData;
- (void)vc_refreshUI;

@end

NS_ASSUME_NONNULL_END
