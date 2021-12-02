//
//  ViewController.m
//  Test-yjling
//
//  Created by 凌永剑 on 2021/12/2.
//

#import "QuestionListVC.h"
#import "Macros.h"
#import "QuestionListCell.h"
#import "QuestionModel.h"
#import "QuestionDetailVC.h"
#import <Masonry/Masonry.h>

static NSString * const kQuestionListCellIdentifier = @"QuestionListCell";

//请认真读题。
//用命令行创建一个以CocoaPods管理的项目【Test-你的姓名拼音】，完成以下题目
//将下面的问题在一个UITabView里面列出所有问题，单击每一行进入一个新的页面，里面是问题和答案。
//
//1.ARC下对象的property属性修饰词有哪些？不显式指定任何修饰词时，默认的修饰词是什么？
//2.浅复制、深复制的区别是什么？
//3.ARC下__block和__weak修饰符有什么区别？分别用来做什么？
//4.网络框架用的哪一个？为什么？
//5.社会化分享如何实现分享完成后返回到当前App的？
//6.简述SDWebImage的实现原理(缓存+视图)。
//7.谈谈对响应链的理解。
//8.如果对App进行性能优化，你会怎么做？

@interface QuestionListVC () <UITableViewDelegate, UITableViewDataSource, UINavigationBarDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *questions;

@end

@implementation QuestionListVC

#pragma mark - life circle
+ (instancetype)vc_controller
{
    return [[[self class] alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self vc_setUpUI];
    [self vc_setUpConstraints];
}

- (void)vc_setUpUI
{
    self.navigationController.navigationBar.delegate = self;
    
    
//    NSLog(@"%@", self.navigationController.navigationBar.delegate);
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        NSLog(@"%@", self.navigationController.navigationBar.delegate);
//    });
    
    self.navigationController.navigationBar.translucent = NO;
    
    self.title = @"Questions";
    
    self.view.backgroundColor = CNo_f5f7f9;
    [self.view addSubview:self.tableView];
}

- (void)vc_setUpConstraints
{
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

- (void)vc_loadInitData
{
    
}

#pragma mark - tableview datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
    return self.questions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QuestionListCell *cell = [tableView dequeueReusableCellWithIdentifier:kQuestionListCellIdentifier];
    [cell updateWithModel:[self.questions vv_objectWithIndex:indexPath.row]];
    return cell;
}

#pragma mark - tableview delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    QuestionDetailVC *vc = [QuestionDetailVC vc_controllerWithModel:[self.questions vv_objectWithIndex:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UINavigationBarDelegate
- (UIBarPosition)positionForBar:(id<UIBarPositioning>)bar
{
    return UIBarPositionTopAttached;
}

#pragma mark - lazy load
VVLazyload(UITableView, tableView, {
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;

    [_tableView registerClass:[QuestionListCell class] forCellReuseIdentifier:kQuestionListCellIdentifier];
})

@end
