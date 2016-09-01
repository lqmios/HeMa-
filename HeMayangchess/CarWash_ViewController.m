//
//  CarWash_ViewController.m
//  HeMayangchess
//
//  Created by lqm on 16/8/6.
//  Copyright © 2016年 LQM. All rights reserved.
//

#import "CarWash_ViewController.h"
#import "UserModel.h"
//#import "Floor2Model.h"
#import "CollectionViewCell1.h"
#import "UIImageView+WebCache.h"

#define CellIdendifier @"CellIdendifier"
@interface CarWash_ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong)NSMutableArray *floor2Array;
//@property(nonatomic,strong)Floor2Model *floor2Model;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation CarWash_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.title = self.titleString;
    
    [self loadData];
    _floor2Array = [NSMutableArray array];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell1" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:CellIdendifier];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
//    self.collectionView.scrollEnabled =NO;
    _floor2Array = [UserModel sharedUserModel].Floor2;
      NSLog(@"_floor2Array = %@",_floor2Array);


}
-(void)viewWillAppear:(BOOL)animated
{
    [_collectionView reloadData];
}
#pragma mark --UICollectionViewDataSource,UICollectionViewDelegate----
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
 
    return _floor2Array.count;
    
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell1 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdendifier forIndexPath:indexPath];
////    cell.titleLabel.text = _educationData[@"data"][0][@"data"][indexPath.row][@"Title"];
    for (int i  = 0; i < _floor2Array.count; i ++) {
         NSString *imageString = _floor2Array[indexPath.row][@"TowSortImg"];
//        NSLog(@"imageString = %@",imageString);
        [cell.imgeView sd_setImageWithURL:[NSURL URLWithString:imageString]];
        cell.label.text = _floor2Array[indexPath.row][@"TowSort"];
    }
   


    
    return cell;
}


-(void)loadData
{
//   _floor2Array = [UserModel sharedUserModel].Floor2;
//    [_collectionView reloadData];
//    NSLog(@"_floor2Array = %@",_floor2Array);
//    for (int i = 0; i < array.count; i++) {
//        NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithDictionary:array[i]];
//        _floor2Model = [[Floor2Model alloc]initWithDictionary:mDic];
//        [_floor2Array addObject:_floor2Model];
//        NSLog(@"_floor2Model = %@",_floor2Model);
//    }

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
