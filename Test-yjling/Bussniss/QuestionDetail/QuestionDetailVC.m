//
//  QuestionDetailVC.m
//  Test-yjling
//
//  Created by 凌永剑 on 2021/12/2.
//

#import "QuestionDetailVC.h"
#import "Macros.h"
#import "QuestionModel.h"
#import <Masonry/Masonry.h>

static CGFloat const kLabelPadding = 15;

@interface QuestionDetailVC ()

@property (nonatomic, strong) QuestionModel *model;

@property (nonatomic, strong) UILabel *questionLabel;
@property (nonatomic, strong) UITextView *answerView;

@end

@implementation QuestionDetailVC

+ (instancetype)vc_controllerWithModel:(id)model
{
    VVParameterAssert(model);
    
    QuestionDetailVC *vc = [[QuestionDetailVC alloc] init];
    vc.model = model;
    return vc;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self vc_setUpUI];
    [self vc_setUpConstraints];
    [self vc_loadInitData];
}

- (void)vc_setUpUI
{
    self.navigationController.navigationBar.translucent = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.title = @"Detail";
    
    self.view.backgroundColor = CNo_f5f7f9;
    
    [self.view addSubview:self.questionLabel];
    [self.view addSubview:self.answerView];
}

- (void)vc_setUpConstraints
{
    [self.questionLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(kLabelPadding);
        make.trailing.mas_equalTo(-kLabelPadding);
        make.top.mas_equalTo(12);
    }];
    
    [self.answerView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(kLabelPadding);
        make.trailing.mas_equalTo(-kLabelPadding);
        make.top.equalTo(self.questionLabel.mas_bottom).offset(12);
        make.bottom.mas_equalTo(0);
    }];
}

- (void)vc_loadInitData
{
    self.questionLabel.text = self.model.question;
    self.answerView.text = self.model.answer;
}

#pragma mark - lazy load
VVLazyload(UILabel, questionLabel, {
    _questionLabel.font = [UIFont boldSystemFontOfSize:18];
    _questionLabel.numberOfLines = 0;
})

VVLazyload(UITextView, answerView, {
    _answerView.font = [UIFont systemFontOfSize:14];
    _answerView.backgroundColor = [UIColor clearColor];
    _answerView.showsVerticalScrollIndicator = NO;
})

@end
