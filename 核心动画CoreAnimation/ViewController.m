//
//  ViewController.m
//  核心动画CoreAnimation
//
//  Created by 杨波 on 2018/12/27.
//  Copyright © 2018 杨波. All rights reserved.
//

#import "ViewController.h"
#import "CABasicViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray     *titArray;
@end
static NSString *tableViewCellId = @"tableViewCellId";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

/* lazy */
- (NSArray *)titArray{
    if (!_titArray) {
        _titArray = @[@"CABasicAnimation"];
    }
    return _titArray;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc]init];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:tableViewCellId];
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.titArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewCellId forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.titArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        CABasicViewController *vc = [[CABasicViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
@end
