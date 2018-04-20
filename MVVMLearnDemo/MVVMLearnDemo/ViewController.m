//
//  ViewController.m
//  MVVMLearnDemo
//
//  Created by Alexander on 2018/4/19.
//  Copyright © 2018年 alexander. All rights reserved.
//

#import "ViewController.h"
#import "SKView.h"
#import "SKViewModel.h"
#import "SKModel.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>


/** 背景 tableview */
@property (nonatomic,strong)UITableView *mainTableView;
/** 数据源数组 */
@property (nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation ViewController


- (NSMutableArray *)dataArray
{
	if (!_dataArray) {
		_dataArray = [NSMutableArray array];
	}
	return _dataArray;

}


- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[self createMainTB];
	[self loadData];
	
}
- (void)createMainTB
{
	
	CGFloat offset = 0;
	
    self.mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0,64, self.view.frame.size.width, self.view.frame.size.height  - offset - 64) style:UITableViewStylePlain];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    self.mainTableView.separatorStyle = UITableViewCellSelectionStyleBlue;
    self.mainTableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.mainTableView];
    
}


// 装在数据
- (void)loadData
{

	// 使用viewModel 进行装载数据
	[SKViewModel loadDataWithSuccessCB:^(id data) {
		
		self.dataArray = (NSMutableArray *)data;
		
		[self.mainTableView reloadData];
	}];

}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
	return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
	
	return 0.01;

}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cellID";
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
	
    if (!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
	
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	
	SKView *view = [[SKView alloc]init];
	view.frame = CGRectMake(100, 15 , 90, 90);
	[cell.contentView addSubview:view];
	
	SKModel *model = self.dataArray[indexPath.row];
	
	view.imgView.image = [UIImage imageNamed:model.imgName];
	
	return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 100;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
