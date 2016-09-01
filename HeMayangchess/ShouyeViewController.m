//
//  ShouyeViewController.m
//  HeMayangchess
//
//  Created by lqm on 16/8/4.
//  Copyright © 2016年 LQM. All rights reserved.
//

#import "ShouyeViewController.h"
#import "Masonry.h"
#import "AFNetWork.h"
#import "MJRefreshNormalHeader.h"

#import "UIImageView+WebCache.h"
#import "MyCollectionViewCell.h"
#import "CollectionViewCell2.h"
//tabel
#import "TableViewCell1.h"
#import "TableViewCell2.h"
#import "TableViewCell3.h"
#import "TableViewCell4.h"
#import "TableViewCell5.h"
#import "TableViewCell7.h"
#import "TableViewCell8.h"
#import "TableViewCell12.h"

//modle
#import "Floor1Modle.h"
#import "Floor2Model.h"
#import "Floor3Modle.h"
#import "Floor4Model.h"
#import "Floor6Model.h"
#import "Floor7Model.h"
#import "Floor8Model.h"
//vc
#import "UserModel.h"
#import "CarWash_ViewController.h"
#import "Maintenance_ViewController.h"
#import "Repair_ViewController.h"
#import "FristImage_ViewController.h"
#import "Table7_ViewController.h"
//
#import "ZJCycleScrollView.h"


@interface ShouyeViewController ()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,ZJCycleScrollViewDelegate>
{
    TableViewCell1 *tableViewCell1;
    TableViewCell2 *tableViewCell2;
    TableViewCell3 *tableViewCell3;
    TableViewCell4 *tableViewCell4;
    TableViewCell5 *tableViewCell5;
    TableViewCell7 *tableViewCell7;
    TableViewCell8 *tableViewCell8;
    TableViewCell12 *tableViewCell12;
    
    NSTimer *_timer;
    NSString *imgString;
     NSString *imgString2;
     NSString *imgtext;
      NSString *imgUrl;
    NSMutableArray *mArray;
    NSMutableArray *chunM;
    NSString *titilStr;
    NSString *valueStr;
}

//@property (weak, nonatomic) IBOutlet UITableView *tabelView1;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UITableView *tabelView2;
@property (weak, nonatomic) IBOutlet UITableView *tabelView3;

@property (weak, nonatomic) IBOutlet UITableView *tabelView6;
@property(nonatomic,strong)UITableView *tabelView4;
@property(nonatomic,strong)UITableView *tabelView5;
@property(nonatomic,strong)UITableView *tabelView7;
@property(nonatomic,strong)UITableView *tabelView8;
@property(nonatomic,strong)UITableView *tabelView9;
@property(nonatomic,strong)UITableView *tabelView10;
@property(nonatomic,strong)UITableView *tabelView11;
@property(nonatomic,strong)UITableView *tabelView12;
@property(nonatomic,strong)UITableView *tabelView13;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView2;
//@property(nonatomic,readwrite,strong)UIPageControl *page;

//@property(nonatomic,assign)CGRect mainRect;//当前视图尺寸


@property(nonatomic,strong)NSMutableArray *dataSoure;
@property(nonatomic,strong)NSMutableArray *floor1Array;
@property(nonatomic,strong)Floor1Modle *floor1Model;

@property(nonatomic,strong)NSMutableArray *floor2Array;
@property(nonatomic,strong)Floor2Model *floor2Model;

@property(nonatomic,strong)NSMutableArray *floor3Array;
@property(nonatomic,strong)Floor3Modle *floor3Model;


@property(nonatomic,strong)NSMutableArray *floor4Array;
@property(nonatomic,strong)NSArray *array;
@property(nonatomic,strong)Floor4Model *floor4Model;

@property(nonatomic,strong)NSMutableArray *floor6Array;
@property(nonatomic,strong)Floor6Model *floor6Model;

@property(nonatomic,strong)NSMutableArray *floor7Array;
@property(nonatomic,strong)Floor7Model *floor7Model;

@property(nonatomic,strong)NSMutableArray *floor8Array;
@property(nonatomic,strong)Floor8Model *floor8Model;

@end
#define CellIdendifier @"CellIdendifier"
#define CellIdendifier1 @"CellIdendifier1"

#define taBleIdendifier1 @"taBleIdendifier1"
#define taBleIdendifier2 @"taBleIdendifier2"
#define taBleIdendifier3 @"taBleIdendifier3"
#define taBleIdendifier4 @"taBleIdendifier4"
#define taBleIdendifier5 @"taBleIdendifier5"
#define taBleIdendifier6 @"taBleIdendifier6"
#define taBleIdendifier7 @"taBleIdendifier7"
#define taBleIdendifier8 @"taBleIdendifier8"
#define taBleIdendifier9 @"taBleIdendifier9"
#define taBleIdendifier10 @"taBleIdendifier10"
#define taBleIdendifier11 @"taBleIdendifier11"
#define taBleIdendifier12 @"taBleIdendifier12"
#define taBleIdendifier13 @"taBleIdendifier13"
@implementation ShouyeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self initConstrain];
    [self initcollectionView];
    [self initTabelView];
    [self loadData2];

    
    //去掉多余的cell
    _tabelView3.tableFooterView=[[UIView alloc]init];
     _scrollView.mj_header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerAction:)];
    
 

}
-(void)viewWillAppear:(BOOL)animated
{
    [self loadData];
    
    _floor1Array = [NSMutableArray array];
    _floor2Array = [NSMutableArray array];
    _floor3Array = [NSMutableArray array];
    _floor4Array = [NSMutableArray array];
    _floor6Array = [NSMutableArray array];
    _floor7Array = [NSMutableArray array];
    _floor8Array = [NSMutableArray array];
      mArray = [NSMutableArray array];
    chunM = [NSMutableArray array];
    
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
            if ([[[UIDevice currentDevice] systemVersion] floatValue]>7.0?YES:NO)
            {
                self.edgesForExtendedLayout = UIRectEdgeNone;
            }
    });
    
}
-(void)initConstrain
{
    self.scrollView.backgroundColor = COLOR(238, 238, 238, 1);
    self.contentiew.backgroundColor = COLOR(238, 238, 238, 1);
    //隐藏滚动条
   self.scrollView.showsVerticalScrollIndicator = NO;


}
-(void)initTabelView
{
    [self.tabelView2 registerNib:[UINib nibWithNibName:@"TableViewCell2" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:taBleIdendifier2];
    self.tabelView2.delegate = self;
    self.tabelView2.dataSource = self;
    self.tabelView2.separatorStyle = UITableViewCellSeparatorStyleNone;
    //tabelView3
    [self.tabelView3 registerNib:[UINib nibWithNibName:@"TableViewCell3" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:taBleIdendifier3];
    self.tabelView3.delegate = self;
    self.tabelView3.dataSource = self;
    self.tabelView3.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tabelView6 registerNib:[UINib nibWithNibName:@"TableViewCell5" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:taBleIdendifier6];
    self.tabelView6.delegate = self;
    self.tabelView6.dataSource = self;
    self.tabelView6.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    _tabelView4 = [[UITableView alloc]init];
    [_tabelView4 registerNib:[UINib nibWithNibName:@"TableViewCell4" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:taBleIdendifier4];
    _tabelView4.delegate = self;
    _tabelView4.dataSource = self;
//    _tabelView4.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    _tabelView4.separatorStyle = UITableViewCellSeparatorStyleNone;

    [self.scrollView addSubview:self.tabelView4];
    [_tabelView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tabelView3.mas_bottom).offset(10);
//        make.left.mas_equalTo(self.view.mas_right);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.height.mas_equalTo(120);
       make.width.mas_equalTo(Screen_width/2-0.5);
        
    }];
    
    _tabelView5 = [[UITableView alloc]init];
    [_tabelView5 registerNib:[UINib nibWithNibName:@"TableViewCell4" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:taBleIdendifier5];
    _tabelView5.delegate = self;
    _tabelView5.dataSource = self;
//     _tabelView5.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _tabelView5.separatorStyle = UITableViewCellSeparatorStyleNone;
//    _tabelView5.backgroundColor = [UIColor lightGrayColor];
    [self.scrollView addSubview:self.tabelView5];
    [_tabelView5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tabelView3.mas_bottom).offset(10);
        //        make.left.mas_equalTo(self.view.mas_right);
        make.right.equalTo(self.view.mas_right);
        make.height.mas_equalTo(120);
        make.width.mas_equalTo(Screen_width/2-0.5);

        
    }];
    
    _tabelView7 = [[UITableView alloc]init];
    [self.tabelView7 registerNib:[UINib nibWithNibName:@"TableViewCell7" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:taBleIdendifier7];
    _tabelView7.dataSource = self;
    _tabelView7.delegate = self;
    _tabelView7.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.scrollView addSubview:self.tabelView7];
    [_tabelView7 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.collectionView2.mas_bottom).offset(10);
        make.right.mas_equalTo(self.view.mas_right).offset(0);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.height.mas_equalTo(30);
        
    }];
    
    _tabelView8 = [[UITableView alloc]init];
    _tabelView8.dataSource = self;
    _tabelView8.delegate = self;
    [_tabelView8 registerNib:[UINib nibWithNibName:@"TableViewCell8" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:taBleIdendifier8];
       _tabelView8.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.scrollView addSubview:self.tabelView8];
    
    [_tabelView8 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tabelView7.mas_bottom).offset(1);
        make.left.equalTo(self.view.mas_left);
        make.width.mas_equalTo(Screen_width*2/5);
        make.height.mas_equalTo(150);
        
    }];
    
    _tabelView9 = [[UITableView alloc]init];
    _tabelView9.dataSource = self;
    _tabelView9.delegate = self;
     _tabelView9.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tabelView9 registerNib:[UINib nibWithNibName:@"TableViewCell4" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:taBleIdendifier9];
    [self.scrollView addSubview:self.tabelView9];
    [_tabelView9 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tabelView7.mas_bottom).offset(1);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.left.equalTo(self.tabelView8.mas_right).offset(1);
        make.height.mas_equalTo(70);
        
    }];
    
    _tabelView10 = [[UITableView alloc]init];
    _tabelView10.dataSource = self;
    _tabelView10.delegate = self;
    _tabelView10.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tabelView10 registerNib:[UINib nibWithNibName:@"TableViewCell8" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:taBleIdendifier10];
    [self.scrollView addSubview:self.tabelView10];
    [_tabelView10 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tabelView9.mas_bottom).offset(0);
//        make.right.equalTo(self.tabelView11.mas_right).offset(-1);
        make.left.equalTo(self.tabelView8.mas_right).offset(1);
        make.height.mas_equalTo(79);
        make.width.mas_equalTo((Screen_width*3/5 - 2)/2);
        
    }];
    
    _tabelView11 = [[UITableView alloc]init];
    _tabelView11.dataSource = self;
    _tabelView11.delegate = self;
    _tabelView11.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tabelView11 registerNib:[UINib nibWithNibName:@"TableViewCell8" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:taBleIdendifier11];
    
    [self.scrollView addSubview:self.tabelView11];
    [_tabelView11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tabelView9.mas_bottom).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
//        make.left.equalTo(self.tabelView10.mas_right).offset(1);
        make.height.mas_equalTo(79);
        make.width.mas_equalTo((Screen_width*3/5 - 1)/2);
        
    }];
    _tabelView12 = [[UITableView alloc]init];
    _tabelView12.dataSource = self;
    _tabelView12.delegate = self;
    _tabelView12.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tabelView12 registerNib:[UINib nibWithNibName:@"TableViewCell12" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:taBleIdendifier12];
    [self.scrollView addSubview:self.tabelView12];
    [_tabelView12 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tabelView8.mas_bottom).offset(10);
//        make.right.equalTo(self.view.mas_right).offset(0);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.height.mas_equalTo(120);
        make.width.mas_equalTo(Screen_width/2-0.5);
        
    }];
    
    _tabelView13 = [[UITableView alloc]init];
    _tabelView13.dataSource = self;
    _tabelView13.delegate = self;
    _tabelView13.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tabelView13 registerNib:[UINib nibWithNibName:@"TableViewCell12" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:taBleIdendifier13];
    [self.scrollView addSubview:self.tabelView13];
    [_tabelView13 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tabelView11.mas_bottom).offset(11);
        make.right.equalTo(self.view.mas_right).offset(0);
//        make.left.equalTo(self.view.mas_left).offset(0);
        make.height.mas_equalTo(120);
        make.width.mas_equalTo(Screen_width/2-0.5);
        
    }];
    
}

-(void)initcollectionView
{
    [self.collectionView registerNib:[UINib nibWithNibName:@"MyCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:CellIdendifier];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.scrollEnabled =NO;
    [self.collectionView2 registerNib:[UINib nibWithNibName:@"CollectionViewCell2" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:CellIdendifier1];
    self.collectionView2.backgroundColor = [UIColor whiteColor];
    self.collectionView2.dataSource = self;
      self.collectionView2.scrollEnabled =NO;
    self.collectionView2.delegate = self;

    
}
#pragma mark -UITableViewDataSource,UITableViewDelegate-
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSUInteger num = 0;
    if (_floor1Array.count == 0 ) {
        return num;
    }//注意,网络请求的时间差
    if (tableView == self.tabelView2)
    {
        num = 1;
    }
    else if (tableView == self.tabelView3)
    {
        num = 1;
    }
    else if (tableView == _tabelView4)
    {
        num = 2;
    }
    else if (tableView == _tabelView5)
    {
        num = 2;
    }
    else if (tableView == self.tabelView6)
        
    {
        num = 1;
    }
    else if (tableView == _tabelView7)
        
    {
        num = 1;
    }
    else if (tableView == _tabelView8)
        
    {
        num = 1;
    }
    else if (tableView == _tabelView9)
        
    {
        num = 1;
    }
    else if (tableView == _tabelView10)
        
    {
        num = 1;
    }
    else if (tableView == _tabelView11)
        
    {
        num = 1;
    }
    else if (tableView == _tabelView12)
        
    {
        num = 2;
    }
    else if (tableView == _tabelView13)
        
    {
        num = 2;
    }
    return num;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;

    if (tableView == self.tabelView2)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:taBleIdendifier2 forIndexPath:indexPath];
        tableViewCell2 = (TableViewCell2 *)cell;
        //给第一张图片
        _floor3Model = _floor3Array[0];
        NSLog(@"%@",_floor3Model);

        [tableViewCell2.toutiaoImageView sd_setImageWithURL:[NSURL URLWithString:imgString]];
         tableViewCell2.toutiaoImageView.contentMode = UIViewContentModeScaleToFill;
    }
    else if (tableView == self.tabelView3)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:taBleIdendifier3 forIndexPath:indexPath];
        tableViewCell3 = (TableViewCell3 *)cell;
         [tableViewCell3.imageView1 sd_setImageWithURL:[NSURL URLWithString:imgString2]];
        tableViewCell3.label.text = imgtext;
        
    }
    
    else if (tableView == _tabelView4)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:taBleIdendifier4 forIndexPath:indexPath];
        tableViewCell4 = (TableViewCell4 *)cell;
        switch (indexPath.row) {
            case 0:
            {
                NSString *imageString = _floor4Array[0][@"Url"];
                tableViewCell4.headimageView.contentMode = UIViewContentModeScaleToFill;
                [tableViewCell4.headimageView sd_setImageWithURL:[NSURL URLWithString:imageString]];
                UILabel *label = [[UILabel alloc]init];
                label.textColor = [UIColor redColor];
                label.font = [UIFont systemFontOfSize:15];
                label.textAlignment = NSTextAlignmentLeft;
                [tableViewCell4.headimageView addSubview:label];
                [label mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(tableViewCell4.headimageView.mas_top).offset(5);
                    make.height.mas_equalTo(20);
                    make.left.equalTo(tableViewCell4.headimageView.mas_left).offset(8);
                    make.right.equalTo(tableViewCell4.headimageView.mas_right).offset(0);
                }];
                
                UIButton *hotButton = [UIButton buttonWithType:UIButtonTypeCustom];
                hotButton.backgroundColor = [UIColor redColor];
                [hotButton setTitle:@"hot" forState:UIControlStateNormal];
                hotButton.titleLabel.font = [UIFont systemFontOfSize:13];
                [hotButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                
                [tableViewCell4.headimageView addSubview:hotButton];
                [hotButton mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(tableViewCell4.headimageView.mas_top).offset(8);
                    make.height.mas_equalTo(15);
                    make.width.mas_equalTo(25);
                    make.right.equalTo(tableViewCell4.headimageView.mas_right).offset(-65);

                    
                }];
                
                
                
                NSString *string = _floor4Array[0][@"ImgText"];
                //获取从字符串开头到字符串的 to 的位置的字符串内容，不包括to位置，从0算起
                NSString *subString1 = [string substringToIndex:3];
                
                label.text = subString1;
                UILabel *label2 = [[UILabel alloc]init];
                label2.textColor = [UIColor lightGrayColor];
                label2.font = [UIFont systemFontOfSize:10];
                label2.textAlignment = NSTextAlignmentLeft;
                [tableViewCell4.headimageView addSubview:label2];
                [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(label.mas_bottom).offset(1);
                    make.height.mas_equalTo(20);
                    make.left.equalTo(tableViewCell4.headimageView.mas_left).offset(8);
                    make.right.equalTo(tableViewCell4.headimageView.mas_right).offset(0);
                }];
                
                
            NSString *subString2 = [string substringFromIndex:4]; //获取从字符串的from位置到结尾的字符串内容，包含from位置的字符

                label2.text = subString2;
                UIView *lineView = [[UIView alloc]init];
                lineView.backgroundColor = COLOR(238, 238, 238, 1);
                [tableViewCell4.headimageView addSubview:lineView];
                [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.height.mas_equalTo(1);
                    make.left.equalTo(tableViewCell4.mas_left).offset(0);
                    make.right.equalTo(tableViewCell4.mas_right).offset(0);
                    make.bottom.mas_equalTo(tableViewCell4.mas_bottom).offset(-1);
                }];

            }
                break;
            case 1:
            {
                NSString *imageString = _floor4Array[2][@"Url"];
                 tableViewCell4.headimageView.contentMode = UIViewContentModeScaleToFill;
                [tableViewCell4.headimageView sd_setImageWithURL:[NSURL URLWithString:imageString]];
                UILabel *label = [[UILabel alloc]init];
               label.textColor = COLOR(54, 154, 250, 1);
                label.font = [UIFont systemFontOfSize:15];
                label.textAlignment = NSTextAlignmentLeft;
                [tableViewCell4.headimageView addSubview:label];
                [label mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(tableViewCell4.headimageView.mas_top).offset(5);
                    make.height.mas_equalTo(20);
                    make.left.equalTo(tableViewCell4.headimageView.mas_left).offset(8);
                    make.right.equalTo(tableViewCell4.headimageView.mas_right).offset(0);
                    
                }];
                NSString *string = _floor4Array[2][@"ImgText"];
                //获取从字符串开头到字符串的 to 的位置的字符串内容，不包括to位置，从0算起
                NSString *subString1 = [string substringToIndex:3];
                
                label.text = subString1;

                
                UILabel *label2 = [[UILabel alloc]init];
                label2.textColor = [UIColor lightGrayColor];
                label2.font = [UIFont systemFontOfSize:10];
                label2.textAlignment = NSTextAlignmentLeft;
                [tableViewCell4.headimageView addSubview:label2];
                [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(label.mas_bottom).offset(1);
                    make.height.mas_equalTo(20);
                    make.left.equalTo(tableViewCell4.headimageView.mas_left).offset(8);
                    make.right.equalTo(tableViewCell4.headimageView.mas_right).offset(0);
                }];
                
                NSString *subString2 = [string substringFromIndex:4]; //获取从字符串的from位置到结尾的字符串内容，包含from位置的字符
                
                label2.text = subString2;
                

            }
                break;
                
            default:
                break;
        }
    }
    else if (tableView == _tabelView5)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:taBleIdendifier5 forIndexPath:indexPath];
        tableViewCell4 = (TableViewCell4 *)cell;
        switch (indexPath.row) {
            case 0:
            {
                NSString *imageString = _floor4Array[1][@"Url"];
                [tableViewCell4.headimageView sd_setImageWithURL:[NSURL URLWithString:imageString]];
                
                UILabel *label = [[UILabel alloc]init];
                label.textColor = [UIColor redColor];
                label.font = [UIFont systemFontOfSize:15];
                label.textAlignment = NSTextAlignmentLeft;
                [tableViewCell4.headimageView addSubview:label];
                [label mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(tableViewCell4.headimageView.mas_top).offset(5);
                    make.height.mas_equalTo(20);
                    make.left.equalTo(tableViewCell4.headimageView.mas_left).offset(8);
                    make.right.equalTo(tableViewCell4.headimageView.mas_right).offset(0);
                    
                }];
                NSString *string = _floor4Array[1][@"ImgText"];
                //获取从字符串开头到字符串的 to 的位置的字符串内容，不包括to位置，从0算起
                NSString *subString1 = [string substringToIndex:3];
                
                label.text = subString1;
                
                UILabel *label2 = [[UILabel alloc]init];
                label2.textColor = [UIColor lightGrayColor];
                label2.font = [UIFont systemFontOfSize:10];
                label2.textAlignment = NSTextAlignmentLeft;
                [tableViewCell4.headimageView addSubview:label2];
                [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(label.mas_bottom).offset(1);
                    make.height.mas_equalTo(20);
                    make.left.equalTo(tableViewCell4.headimageView.mas_left).offset(8);
                    make.right.equalTo(tableViewCell4.headimageView.mas_right).offset(0);
                }];
                NSString *subString2 = [string substringFromIndex:4]; //获取从字符串的from位置到结尾的字符串内容，包含from位置的字符
                
                label2.text = subString2;
                UIView *lineView = [[UIView alloc]init];
                lineView.backgroundColor = COLOR(238, 238, 238, 1);
                [tableViewCell4.headimageView addSubview:lineView];
                [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.height.mas_equalTo(1);
                    make.left.equalTo(tableViewCell4.mas_left).offset(0);
                    make.right.equalTo(tableViewCell4.mas_right).offset(0);
                    make.bottom.mas_equalTo(tableViewCell4.mas_bottom).offset(-1);
                }];

                
            }
                break;
            case 1:
            {
//                tableViewCell4.titleLabel.text = _floor4Array[3][@"ImgText"];
                NSString *imageString = _floor4Array[3][@"Url"];
                [tableViewCell4.headimageView sd_setImageWithURL:[NSURL URLWithString:imageString]];
                UILabel *label = [[UILabel alloc]init];
                label.textColor = COLOR(54, 154, 250, 1);
                label.font = [UIFont systemFontOfSize:15];
                label.textAlignment = NSTextAlignmentLeft;
                [tableViewCell4.headimageView addSubview:label];
                [label mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(tableViewCell4.headimageView.mas_top).offset(5);
                    make.height.mas_equalTo(20);
                    make.left.equalTo(tableViewCell4.headimageView.mas_left).offset(8);
                    make.right.equalTo(tableViewCell4.headimageView.mas_right).offset(0);
                    
                }];
                NSString *string = _floor4Array[3][@"ImgText"];
                //获取从字符串开头到字符串的 to 的位置的字符串内容，不包括to位置，从0算起
                NSString *subString1 = [string substringToIndex:3];
                
                label.text = subString1;
                UILabel *label2 = [[UILabel alloc]init];
                label2.textColor = [UIColor lightGrayColor];
                label2.font = [UIFont systemFontOfSize:10];
                label2.textAlignment = NSTextAlignmentLeft;
                [tableViewCell4.headimageView addSubview:label2];
                [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(label.mas_bottom).offset(1);
                    make.height.mas_equalTo(20);
                    make.left.equalTo(tableViewCell4.headimageView.mas_left).offset(8);
                    make.right.equalTo(tableViewCell4.headimageView.mas_right).offset(0);
                }];
                NSString *subString2 = [string substringFromIndex:4]; //获取从字符串的from位置到结尾的字符串内容，包含from位置的字符
                
                label2.text = subString2;
                
            }
                break;
                
            default:
                break;
        }


    }
    else if (tableView == self.tabelView6)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:taBleIdendifier6 forIndexPath:indexPath];
        tableViewCell5 = (TableViewCell5 *)cell;
        
        [tableViewCell5.urlImg sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
    }
    else if (tableView == _tabelView7)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:taBleIdendifier7 forIndexPath:indexPath];
        tableViewCell7 = (TableViewCell7 *)cell;
        _floor2Model = _floor2Array[8];
        tableViewCell7.nameLabel.text = _floor2Model.Sort;
        //tableViewCell7.imageView.image = [UIImage imageNamed:@"jiantou"];
    }
    else if (tableView == _tabelView8)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:taBleIdendifier8 forIndexPath:indexPath];
        tableViewCell8 = (TableViewCell8 *)cell;
        _floor7Model = _floor7Array[0];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, Screen_width *2/5, 150)];
        [tableViewCell8 addSubview:imageView];
        NSString *img = _floor7Model.Url;
        [imageView sd_setImageWithURL:[NSURL URLWithString:img]];
        UILabel *label = [[UILabel alloc]init];
        label.textColor = COLOR(225, 92, 25, 1);
        
        label.font = [UIFont systemFontOfSize:15];
        label.textAlignment = NSTextAlignmentLeft;
        [imageView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(imageView.mas_top).offset(5);
            make.height.mas_equalTo(20);
            make.left.equalTo(imageView.mas_left).offset(8);
            make.right.equalTo(imageView.mas_right).offset(0);
            
        }];
//        label.text = _floor7Model.ImgText;
        
        UILabel *label2 = [[UILabel alloc]init];
        label2.textColor = [UIColor lightGrayColor];
        
        label2.font = [UIFont systemFontOfSize:11];
        label2.textAlignment = NSTextAlignmentLeft;
        [imageView addSubview:label2];
        [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(label.mas_bottom).offset(0);
            make.height.mas_equalTo(20);
            make.left.equalTo(imageView.mas_left).offset(8);
            make.right.equalTo(imageView.mas_right).offset(0);
            
        }];
        
        NSString *string = _floor7Model.ImgText;
        NSString *subString1 = [string substringToIndex:5];
        label.text = subString1;
        NSString *subString2 = [string substringFromIndex:6]; //获取从字符串的from位置到结尾的字符串内容，包含from位置的字符
        NSString *string2 = @"¥";
        NSString *string3 = subString2;
        NSString *myString = [NSString stringWithFormat:@"%@%@",string2,string3];
        label2.text = myString;
        
    }
    else if (tableView == _tabelView9)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:taBleIdendifier9 forIndexPath:indexPath];
        tableViewCell4 = (TableViewCell4 *)cell;
        _floor7Model = _floor7Array[1];
        NSString *img = _floor7Model.Url;
        [tableViewCell4.headimageView sd_setImageWithURL:[NSURL URLWithString:img]];
        
        UILabel *label = [[UILabel alloc]init];
        label.textColor = COLOR(43, 151, 202, 1);
        label.font = [UIFont systemFontOfSize:15];
        label.textAlignment = NSTextAlignmentLeft;
        [tableViewCell4.headimageView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(tableViewCell4.headimageView.mas_top).offset(5);
            make.height.mas_equalTo(20);
            make.left.equalTo(tableViewCell4.headimageView.mas_left).offset(8);
            make.right.equalTo(tableViewCell4.headimageView.mas_right).offset(0);
            
        }];
//        label.text = _floor7Model.ImgText;;
        
        UILabel *label2 = [[UILabel alloc]init];
        label2.textColor = [UIColor lightGrayColor];
        label2.font = [UIFont systemFontOfSize:11];
        label2.textAlignment = NSTextAlignmentLeft;
        [tableViewCell4.headimageView addSubview:label2];
        [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(label.mas_bottom).offset(0);
            make.height.mas_equalTo(20);
            make.left.equalTo(tableViewCell4.headimageView.mas_left).offset(8);
            make.right.equalTo(tableViewCell4.headimageView.mas_right).offset(0);
        }];
        NSString *string = _floor7Model.ImgText;
        NSString *subString1 = [string substringToIndex:5];
        label.text = subString1;
        NSString *subString2 = [string substringFromIndex:6]; //获取从字符串的from位置到结尾的字符串内容，包含from位置的字符
        NSString *string2 = @"¥";
        NSString *string3 = subString2;
        NSString *myString = [NSString stringWithFormat:@"%@%@",string2,string3];
        label2.text = myString;

        
    }
    else if (tableView == _tabelView10)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:taBleIdendifier10 forIndexPath:indexPath];
        tableViewCell8 = (TableViewCell8 *)cell;
        _floor7Model = _floor7Array[2];
        UIImageView *imageView = [[UIImageView alloc]init];
        [tableViewCell8 addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.edges.mas_equalTo(tableViewCell8);
        }];
        
        NSString *img = _floor7Model.Url;
        NSLog(@"img = %@",img);
        [imageView sd_setImageWithURL:[NSURL URLWithString:img]];
        UILabel *label = [[UILabel alloc]init];
        label.textColor = COLOR(192, 0, 100, 1);
        
        label.font = [UIFont systemFontOfSize:15];
        label.textAlignment = NSTextAlignmentLeft;
        [imageView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(imageView.mas_top).offset(5);
            make.height.mas_equalTo(20);
            make.left.equalTo(imageView.mas_left).offset(8);
            make.right.equalTo(imageView.mas_right).offset(0);
            
        }];
//        label.text = _floor7Model.ImgText;
        
        UILabel *label2 = [[UILabel alloc]init];
        label2.textColor = [UIColor lightGrayColor];
        
        label2.font = [UIFont systemFontOfSize:11];
        label2.textAlignment = NSTextAlignmentLeft;
        [imageView addSubview:label2];
        [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(label.mas_bottom).offset(0);
            make.height.mas_equalTo(20);
            make.left.equalTo(imageView.mas_left).offset(8);
            make.right.equalTo(imageView.mas_right).offset(0);
            
        }];
        NSString *string = _floor7Model.ImgText;
        NSString *subString1 = [string substringToIndex:5];
        label.text = subString1;
        NSString *subString2 = [string substringFromIndex:6]; //获取从字符串的from位置到结尾的字符串内容，包含from位置的字符
        NSString *string2 = @"¥";
        NSString *string3 = subString2;
        NSString *myString = [NSString stringWithFormat:@"%@%@",string2,string3];
        label2.text = myString;
    }
    else if (tableView == _tabelView11)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:taBleIdendifier11 forIndexPath:indexPath];
        tableViewCell8 = (TableViewCell8 *)cell;
        _floor7Model = _floor7Array[3];
        UIImageView *imageView = [[UIImageView alloc]init];
        [tableViewCell8 addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.mas_equalTo(tableViewCell8);
        }];
        
        NSString *img = _floor7Model.Url;
        NSLog(@"img = %@",img);
        [imageView sd_setImageWithURL:[NSURL URLWithString:img]];
        UILabel *label = [[UILabel alloc]init];
        label.textColor = COLOR(50, 185, 129, 1);
        
        label.font = [UIFont systemFontOfSize:15];
        label.textAlignment = NSTextAlignmentLeft;
        [imageView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(imageView.mas_top).offset(5);
            make.height.mas_equalTo(20);
            make.left.equalTo(imageView.mas_left).offset(8);
            make.right.equalTo(imageView.mas_right).offset(0);
            
        }];

        UILabel *label2 = [[UILabel alloc]init];
        label2.textColor = [UIColor  lightGrayColor];
        label2.font = [UIFont systemFontOfSize:11];
        label2.textAlignment = NSTextAlignmentLeft;
        [imageView addSubview:label2];
        [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(label.mas_bottom).offset(0);
            make.height.mas_equalTo(20);
            make.left.equalTo(imageView.mas_left).offset(8);
            make.right.equalTo(imageView.mas_right).offset(0);
            
        }];
        NSString *string = _floor7Model.ImgText;
        NSString *subString1 = [string substringToIndex:6];
        label.text = subString1;
        NSString *subString2 = [string substringFromIndex:7]; //获取从字符串的from位置到结尾的字符串内容，包含from位置的字符
        NSString *string2 = @"¥";
        NSString *string3 = subString2;
        NSString *myString = [NSString stringWithFormat:@"%@%@",string2,string3];
        label2.text = myString;
    }
    else if (tableView == _tabelView12)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:taBleIdendifier12 forIndexPath:indexPath];
        tableViewCell12 = (TableViewCell12 *)cell;
//        _floor7Model = _floor7Array[3];
        UIImageView *imageview = [[UIImageView alloc]init];
        imageview.image = [UIImage imageNamed:@"jt"];
        [tableViewCell12 addSubview:imageview];
        UILabel *label = [[UILabel alloc]init];
        label.text = @"会员洗车入口";
        label.textAlignment = NSTextAlignmentRight;
        label.textColor = COLOR(255, 106, 35, 1);
        label.font = [UIFont systemFontOfSize:11];
                [tableViewCell12 addSubview:label];
        
        [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(tableViewCell12.imageV.mas_bottom).offset(4);
            make.size.mas_equalTo(CGSizeMake(10, 10));
            make.right.mas_equalTo(tableViewCell12.mas_right).offset(-35);
            
        }];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(tableViewCell12.imageV.mas_bottom).offset(4);
//            make.size.mas_equalTo(CGSizeMake(10, 10));
            make.right.mas_equalTo(imageview.mas_left).offset(-2);
            make.left.mas_equalTo(tableViewCell12.mas_left).offset(0);
            make.height.mas_equalTo(10);
            
        }];
        switch (indexPath.row) {
            case 0:
            {
                _floor8Model = _floor8Array[0];
                NSString *img = _floor8Model.Url;
                [tableViewCell12.imageV sd_setImageWithURL:[NSURL URLWithString:img]];
            }
                break;
            case 1:
            {
                _floor8Model = _floor8Array[2];
                NSString *img = _floor8Model.Url;
                [tableViewCell12.imageV sd_setImageWithURL:[NSURL URLWithString:img]];
            }
                break;
                
            default:
                break;
        }

    }
    else if (tableView == _tabelView13)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:taBleIdendifier13 forIndexPath:indexPath];
        tableViewCell12 = (TableViewCell12 *)cell;
        UIImageView *imageview = [[UIImageView alloc]init];
        imageview.image = [UIImage imageNamed:@"jt"];
        [tableViewCell12 addSubview:imageview];
        UILabel *label = [[UILabel alloc]init];
        label.text = @"会员洗车入口";
        label.textAlignment = NSTextAlignmentRight;
        label.textColor = COLOR(255, 106, 35, 1);
        label.font = [UIFont systemFontOfSize:11];
        [tableViewCell12 addSubview:label];
        
        [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(tableViewCell12.imageV.mas_bottom).offset(4);
            make.size.mas_equalTo(CGSizeMake(10, 10));
            make.right.mas_equalTo(tableViewCell12.mas_right).offset(-35);
            
        }];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(tableViewCell12.imageV.mas_bottom).offset(4);
            //            make.size.mas_equalTo(CGSizeMake(10, 10));
            make.right.mas_equalTo(imageview.mas_left).offset(-2);
            make.left.mas_equalTo(tableViewCell12.mas_left).offset(0);
            make.height.mas_equalTo(10);
        
        }];
        switch (indexPath.row) {
            case 0:
            {
                _floor8Model = _floor8Array[1];
                NSString *img = _floor8Model.Url;
                [tableViewCell12.imageV sd_setImageWithURL:[NSURL URLWithString:img]];
            }
                break;
            case 1:
            {
                _floor8Model = _floor8Array[3];
                NSString *img = _floor8Model.Url;
                [tableViewCell12.imageV sd_setImageWithURL:[NSURL URLWithString:img]];
               
            }
                break;
                
            default:
                break;
        }

    }

   //取消cell点击闪一下的状态
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CGFloat height;
//    if (tableView == self.tabelView1) {
//        height = 150;
//    }
     if (tableView == self.tabelView2)
    {
        height = 45;
    }
    else if (tableView == self.tabelView3)
    {
        height = 45;
    }
    else if (tableView == self.tabelView4 )
    {
        height = 60;
    }
    else if (tableView == self.tabelView5 )
    {
//        self.tabelView5.estimatedRowHeight = 60;
        height = 60;
    }
    else if (tableView == self.tabelView6 )
    {
        height = 60;
    }
    else if (tableView == self.tabelView7 )
    {
        height = 30;
    }
    else if (tableView == self.tabelView8 )
    {
        height = 150;
    }
    else if (tableView == self.tabelView9 )
    {
        height = 70;
    }
    else if (tableView == self.tabelView10 )
    {
        height = 79;
    }
    else if (tableView == self.tabelView11 )
    {
        height = 79;
    }
    else if (tableView == self.tabelView12 )
    {
        height = 60;
    }
    else if (tableView == self.tabelView13 )
    {
        height = 60;
    }
    return height;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取消选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (tableView ==_tabelView7) {
        
        Table7_ViewController *table7VC = [[Table7_ViewController alloc]init];
        [self.navigationController pushViewController:table7VC animated:YES];
        
        _floor2Model = _floor2Array[8];
        [UserModel sharedUserModel].Floor2 = _floor2Model.TowSort;
        table7VC.titleString = _floor2Model.Sort;
        
    }
    
}

#pragma mark --UICollectionViewDataSource,UICollectionViewDelegate----
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger num;
    if (collectionView == _collectionView) {
        num =  _floor2Array.count - 1;
    }
    else if (collectionView == _collectionView2)
    {
        num = _floor6Array.count;
    }
    
    
    return num;
    
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
        UICollectionViewCell *cell;
    
    
    if (collectionView == _collectionView)
    {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdendifier forIndexPath:indexPath];
        MyCollectionViewCell *myCell = (MyCollectionViewCell *)cell;
        
        _floor2Model = _floor2Array[indexPath.row];
        myCell.nameLabel.text = _floor2Model.Sort;
        NSString *imageString = _floor2Model.SortImg;
        [myCell.imageView sd_setImageWithURL:[NSURL URLWithString:imageString]];
    }
    else if (collectionView == _collectionView2)
    {
        
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdendifier1 forIndexPath:indexPath];
        CollectionViewCell2 *cell2 = (CollectionViewCell2 *)cell;
        _floor6Model = _floor6Array[indexPath.row];
        NSString *imgstring = _floor6Model.Url;
        [cell2.imageView sd_setImageWithURL:[NSURL URLWithString:imgstring]];
        UILabel *label = [[UILabel alloc]init];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:15];
        label.textAlignment = NSTextAlignmentCenter;
        [cell2.imageView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(cell2.imageView.mas_top).offset(2);
            make.height.mas_equalTo(20);
            make.left.equalTo(cell2.imageView.mas_left).offset(0);
            make.right.equalTo(cell2.imageView.mas_right).offset(0);
            
        }];
//        label.text = _floor6Model.ImgText;
        NSString *string = _floor6Model.ImgText;
        //获取从字符串开头到字符串的 to 的位置的字符串内容，不包括to位置，从0算起
        
        UILabel *lanbel2 = [[UILabel alloc]init];
        lanbel2.textColor = [UIColor whiteColor];
        lanbel2.font = [UIFont systemFontOfSize:11];
        lanbel2.textAlignment = NSTextAlignmentCenter;
        [cell2.imageView addSubview:lanbel2];
        [lanbel2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(label.mas_bottom).offset(1);
            make.height.mas_equalTo(18);
            make.left.equalTo(cell2.imageView.mas_left).offset(0);
            make.right.equalTo(cell2.imageView.mas_right).offset(0);
        }];
    
       
        switch (indexPath.row) {
            case 0:
            {
                NSString *subString1 = [string substringToIndex:5];
                label.text = subString1;
                NSString *subString2 = [string substringFromIndex:6]; //获取从字符串的from位置到结尾的字符串内容，包含from位置的字符
                lanbel2.text = subString2;
            }
                break;
            case 1:
            {
                NSString *subString1 = [string substringToIndex:4];
                label.text = subString1;
                NSString *subString2 = [string substringFromIndex:5]; //获取从字符串的from位置到结尾的字符串内容，包含from位置的字符
                lanbel2.text = subString2;
            }
                break;
            case 2:
            {
                NSString *subString1 = [string substringToIndex:5];
                label.text = subString1;
                NSString *subString2 = [string substringFromIndex:6]; //获取从字符串的from位置到结尾的字符串内容，包含from位置的字符
                lanbel2.text = subString2;
            }
                break;
            default:
                break;
        }
        
    }

    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView == _collectionView)
    {
                
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        _floor2Model = _floor2Array[indexPath.row];
        switch (indexPath.row) {
            case 0:
            {
                CarWash_ViewController *carWashVC = [storyboard instantiateViewControllerWithIdentifier:@"CarWash_ViewController"];
                [self.navigationController pushViewController:carWashVC animated:YES];
                carWashVC.titleString = _floor2Model.Sort;
                [UserModel sharedUserModel].Floor2 = _floor2Model.TowSort;
                
                
            }
                break;
            case 1:
            {
                Maintenance_ViewController *maintenanceVC = [storyboard instantiateViewControllerWithIdentifier:@"Maintenance_ViewController"];
                [self.navigationController pushViewController:maintenanceVC animated:YES];
                maintenanceVC.titleString = _floor2Model.Sort;
                [UserModel sharedUserModel].Floor2 = _floor2Model.TowSort;
            }
                break;
                
            case 2:
            {
                Repair_ViewController *repairVC = [storyboard instantiateViewControllerWithIdentifier:@"Repair_ViewController"];
//                [self.navigationController pushViewController:repairVC animated:YES];
                repairVC.titleString = _floor2Model.Sort;
                [UserModel sharedUserModel].Floor2 = _floor2Model.TowSort;
            }
                break;
                
            case 3:
            {
                
            }
                break;
                
            case 4:
            {
                
            }
                break;
                
            case 5:
            {
                
            }
                break;
                
            case 6:
            {
                
            }
                break;
            case 7:
            {
                
            }
                break;
                
                
            default:
                break;
        }
        

        
    }
    
    
    

}

-(void)loadData
{
    AFNetWork *afnetWork = [[AFNetWork alloc]init];
    [afnetWork getDataRequesetWithUrl:@"http://120.24.75.234:7080/API/1.0/Json/Liuqi/Hema_NewHome" WithParmeters:nil];
    [afnetWork setBlock:^(id info){
        NSDictionary *dic = info[@"Body"];
      
        NSMutableArray *floor1Arrary = dic[@"Floor1"];
        titilStr = floor1Arrary[0][@"ImgText"];
         valueStr = floor1Arrary[0][@"Value"];
        for (int i = 0; i < floor1Arrary.count ; i++)
        {
            NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithDictionary:floor1Arrary[i]];
            
            _floor1Model = [[Floor1Modle alloc]initWithDictionary:mDic];
            [_floor1Array addObject:_floor1Model];
            //                        NSLog(@"_floor1Array = %@",_floor1Array);
            NSString *urlStr = floor1Arrary[i][@"Url"];
            [mArray addObject:urlStr];
//            NSLog(@"mArray = －－＝＝ %@",mArray);
            NSString *valueStr = floor1Arrary[i][@"Value"];
//            [chunM addObject:valueStr];
        }

#pragma mark －－－ZJCycleScrollView－－－－
        self.automaticallyAdjustsScrollViewInsets = NO;
        ZJCycleScrollView *scrollView = [[ZJCycleScrollView alloc] initWithFrame:CGRectMake(0, 0, Screen_width, 150) urlStringGroup:mArray placeholderImage:[UIImage imageNamed:@"placeholder"]];
        scrollView.delegate = self;
        scrollView.scrollTimeinterval = 3;
        scrollView.showPageControl = YES;
        [self.scrollView addSubview:scrollView];
#pragma mark
        
        NSMutableArray *floor2Arrary = dic[@"Floor2"];
//        NSArray *towSortArray = floor2Arrary[8][@"TowSort"];
//        [UserModel alloc]
        
        
//        NSLog(@"towSortArray = %@",towSortArray);
       
        for (int i = 0; i < floor2Arrary.count; i ++)
        {
            NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithDictionary:floor2Arrary[i]];
            _floor2Model = [[Floor2Model alloc]initWithDictionary:mDic];
            [_floor2Array addObject:_floor2Model];
        }
//        [_collectionView reloadData];
        [_tabelView7 reloadData];
        
        NSMutableArray *floor3Arrary = dic[@"Floor3"];
        imgString = floor3Arrary[0][@"Url"];
        imgString2 = floor3Arrary[1][@"Url"];
//        NSString *sting3 = floor3Arrary[2][@"Url"];

        imgtext = floor3Arrary[1][@"ImgText"];
//        NSLog(@"imgString = %@",imgtext);
        for (int i = 0; i < floor3Arrary.count; i ++)
        {
            NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithDictionary:floor3Arrary[i]];
            //              NSLog(@"mDic = %@",mDic);
            _floor3Model = [[Floor3Modle alloc]initWithDictionary:mDic];
            [_floor3Array addObject:_floor3Model];
//            NSLog(@"_floor3Array =%@",_floor3Array);
        }
        [_tabelView2 reloadData];
        [_tabelView3 reloadData];
        
        NSMutableArray *floor4Arrary = dic[@"Floor4"];
//        [_floor4Array addObject:floor4Arrary];
//          NSLog(@"_floor4Array = %@",_floor4Array);
        for (int i = 0; i < floor4Arrary.count; i ++)
        {
            NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithDictionary:floor4Arrary[i]];
//            _floor4Model = [[Floor4Model alloc]initWithDictionary:mDic];
            [_floor4Array addObject:mDic];
//             NSLog(@"_floor4Array = %@",_floor4Array);
        }
        [_tabelView4 reloadData];
        [_tabelView5 reloadData];
        
        
        NSMutableDictionary *floor5Mdic = dic[@"Floor5"];
        imgUrl = floor5Mdic[@"Url"];
        
//                 NSLog(@"imgUrl = %@",imgUrl);
        [_tabelView6 reloadData];

        
        NSMutableArray *floor7Arrary = dic[@"Floor7"];
        for (int i = 0; i < floor7Arrary.count; i ++)
        {
            NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithDictionary:floor7Arrary[i]];
            
            _floor7Model = [[Floor7Model alloc]initWithDictionary:mDic];
            [_floor7Array addObject:_floor7Model];
//              NSLog(@"_floor7Array = %@",_floor7Array);
            
        }
        //         NSLog(@"Floor7Arrary = %@",Floor7Arrary);
        
        NSMutableArray *floor8Arrary = dic[@"Floor8"];
        for (int i = 0; i < floor8Arrary.count; i ++)
        {
            NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithDictionary:floor8Arrary[i]];
            
            _floor8Model = [[Floor8Model alloc]initWithDictionary:mDic];
            [_floor8Array addObject:_floor8Model];
//            NSLog(@"_floor8Array = %@",_floor8Array);
            
        }
        [_tabelView8 reloadData];
        [_tabelView9 reloadData];
        [_tabelView10 reloadData];
        [_tabelView11 reloadData];
        [_tabelView12 reloadData];
        [_tabelView13 reloadData];
        
        //         NSLog(@"Floor8Arrary = %@",Floor8Arrary);
        
    }];
    
//    [self weekdaysStringFromdate:_dateStr];
      [_scrollView.mj_header endRefreshing];
    
    
}
-(void)loadData2
{
    AFNetWork *afnetWork = [[AFNetWork alloc]init];
    [afnetWork getDataRequesetWithUrl:@"http://120.24.75.234:7080/API/1.0/Json/Liuqi/Hema_NewHome" WithParmeters:nil];
    [afnetWork setBlock:^(id info){
        NSDictionary *dic = info[@"Body"];
        
        NSMutableArray *floor2Arrary = dic[@"Floor2"];
        
        for (int i = 0; i < floor2Arrary.count; i ++)
        {
            NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithDictionary:floor2Arrary[i]];
            _floor2Model = [[Floor2Model alloc]initWithDictionary:mDic];
            [_floor2Array addObject:_floor2Model];
        }
        [_collectionView reloadData];
//        [_tabelView7 reloadData];
 
        NSMutableArray *floor6Arrary = dic[@"Floor6"];
        for (int i = 0; i < floor6Arrary.count; i ++)
        {
            NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithDictionary:floor6Arrary[i]];
            
            _floor6Model = [[Floor6Model alloc]initWithDictionary:mDic];
            [_floor6Array addObject:_floor6Model];
            
        }
        [_collectionView2 reloadData];
        
    }];
    
    
}



#pragma mark ----下拉刷新----
-(void)headerAction:(UITableView *)sender
{
    [self currentTime];
    [self loadData];
    
}

-(void)currentTime
{
    NSDate *currentDate=[NSDate date];
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"hh:mm"];
    self.dateStr=[ dateFormatter stringFromDate:currentDate];
    NSString *str=@"上次更新于 ";
    self.dateStr=[str stringByAppendingFormat:@"%@",self.dateStr];
    NSLog(@"%@",self.dateStr);
};
#pragma mark ----headimgeView----
-(void)scrollView:(ZJCycleScrollView *)scrollView didSelectItemAtIndex:(int)index
{
    NSLog(@"你点击了第%d个图片",index);
    if (index == 0) {
        FristImage_ViewController *friImageVC = [[FristImage_ViewController alloc]init];
//        [self.navigationController pushViewController:friImageVC animated:YES];
//        [UserModel sharedUserModel].Floor1 = chunM[0];
        friImageVC.titleString = titilStr;
        friImageVC.ValueString = valueStr;
    }
     NSLog(@"valueStr = －－＝＝ %@",valueStr);

    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
