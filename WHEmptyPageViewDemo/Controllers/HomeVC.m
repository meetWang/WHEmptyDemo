//
//  HomeVC.m
//  WHEmptyPageViewDemo
//
//  Created by 王红 on 2018/1/30.
//  Copyright © 2018年 王红. All rights reserved.
//
//屏幕高
#define kSCREENH [UIScreen mainScreen].bounds.size.height
//屏幕宽
#define kSCREENW [UIScreen mainScreen].bounds.size.width

#import "UIView+WHEmpty.h"

#import "HomeVC.h"

@interface HomeVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView           * tbvMain;
@property (nonatomic, strong) NSMutableArray        * arrDataSource;

@end

@implementation HomeVC
#pragma mark - VC生命周期

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"无数据";
    [self baseSetup:PageGobackTypeNone];
    [self createView];
    [self setUpDataSource];
    
    //展示数据(请求数据的过程中 用一句话 调用 )
    [self showTipViewWithData:_arrDataSource withFrame:self.tbvMain.frame];
  

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc{
    //delegate 置为nil
    
    //删除通知
}



#pragma mark - View创建与设置
- (void)createView {
    
    [self configTbvMain];
    //    [self setUpDataSource];
    //    [self.tbvMain reloadData];
    
}

- (void)configTbvMain{
    
    _arrDataSource = [NSMutableArray array];
    
    _tbvMain = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kSCREENW, kSCREENH ) style:UITableViewStyleGrouped];
    _tbvMain.delegate = self;
    _tbvMain.dataSource = self;
    _tbvMain.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    [self.view addSubview:_tbvMain];
}


#pragma mark - 初始化数据源
- (void)setUpDataSource{
    _arrDataSource = [NSMutableArray arrayWithObjects:
                      @{@"txt":@"1"},@{@"txt":@"2"},@{@"txt":@"2"},@{@"txt":@"2"},@{@"txt":@"2"},@{@"txt":@"2"},@{@"txt":@"2"},
                      nil];
}

#pragma mark - UITableView DataSource
- (NSInteger)numberOfSectionsIntableView:(UITableView *)tableView {
    //    return self.arrDataSource.count;
    return 1;
    //    return self.arrDataSource.count;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrDataSource.count;
    //    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellId = @"tableId";
    UITableViewCell *cell  = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:cellId];
    }
  
    if (_arrDataSource.count > 0) {
        cell.detailTextLabel.text = _arrDataSource[indexPath.row][@"txt"];
    }
    return cell;
}



#pragma mark - UITableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
