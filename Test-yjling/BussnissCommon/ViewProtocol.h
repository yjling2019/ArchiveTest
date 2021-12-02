//
//  ViewProtocol.h
//  Test-yjling
//
//  Created by 凌永剑 on 2021/12/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ViewProtocol <NSObject>

- (void)setUpUI;
- (void)setUpConstraints;
- (void)bindUIActions;

- (void)updateWithModel:(id)model;

@end

NS_ASSUME_NONNULL_END
