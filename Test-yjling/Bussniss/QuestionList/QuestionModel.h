//
//  QuestionModel.h
//  Test-yjling
//
//  Created by 凌永剑 on 2021/12/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QuestionModel : NSObject

@property (nonatomic, copy) NSString *question_id;
@property (nonatomic, copy) NSString *question;
@property (nonatomic, copy) NSString *answer;

@end

NS_ASSUME_NONNULL_END
