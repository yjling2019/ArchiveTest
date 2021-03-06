//
//  QuestionListCell.m
//  Test-yjling
//
//  Created by 凌永剑 on 2021/12/2.
//

#import "QuestionListCell.h"
#import "Macros.h"
#import "QuestionModel.h"
#import <Masonry/Masonry.h>

static CGFloat const kLabelPadding = 15;

@interface QuestionListCell ()

@property (nonatomic, strong) UILabel *topLabel;
@property (nonatomic, strong) UILabel *bottomLabel;

@end

@implementation QuestionListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpUI];
        [self setUpConstraints];
    }
    return self;
}

- (void)setUpUI
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self.contentView addSubview:self.topLabel];
    [self.contentView addSubview:self.bottomLabel];
}

- (void)setUpConstraints
{
    [self.topLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(kLabelPadding);
        make.trailing.mas_equalTo(-kLabelPadding);
        make.height.mas_equalTo(26);
        make.top.mas_equalTo(10);
    }];
    
    [self.bottomLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(kLabelPadding);
        make.trailing.mas_equalTo(-kLabelPadding);
        make.top.equalTo(self.topLabel.mas_bottom).offset(8);
        make.bottom.mas_equalTo(-14);
    }];
}

- (void)updateWithModel:(QuestionModel *)model
{
    VVAssertReturnVoid(model && [model isKindOfClass:[QuestionModel class]], @"model error");
    
    self.topLabel.text = [NSString stringWithFormat:@"Question %@", model.question_id];
    self.bottomLabel.text = model.question;
}

#pragma mark - lazy load
VVLazyload(UILabel, topLabel, {
    _topLabel.font = [UIFont boldSystemFontOfSize:20];
})

VVLazyload(UILabel, bottomLabel, {
    _bottomLabel.font = [UIFont systemFontOfSize:14];
    _bottomLabel.numberOfLines = 0;
})

@end
