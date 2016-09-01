//
//  ZJCycleScrollView.m
//  ZJScrollView
//
//  Created by ZJ on 16/3/16.
//  Copyright © 2016年 ZJ. All rights reserved.
//

#import "ZJCycleScrollView.h"
#import "ZJScrollCell.h"
#import "ZJImageDownloadManager.h"
@interface ZJCycleScrollView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,retain)UICollectionView *collectionView;
@property (nonatomic,retain)UIPageControl *pageControl;
@property (nonatomic,assign)NSInteger itemsCount;
@property (nonatomic,weak)NSTimer *timer;
@property (nonatomic,retain)UIImage *placeholderImage;
@end

@implementation ZJCycleScrollView
-(id)initWithFrame:(CGRect)frame imagesGroup:(NSArray *)imagesGroup;

{
    ZJCycleScrollView *cycleScrollView = [self initWithFrame:frame];
    cycleScrollView.imagesGroup = [NSArray arrayWithArray:imagesGroup];
    return cycleScrollView;
}
-(id)initWithFrame:(CGRect)frame urlStringGroup:(NSArray *)urlStringGroup placeholderImage:(UIImage *)placeImage
{
    ZJCycleScrollView *cycleScrollView = [self initWithFrame:frame];
    self.placeholderImage = placeImage;
    cycleScrollView.urlStringGroup = [NSArray arrayWithArray:urlStringGroup];
    
    return cycleScrollView;
}
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self initialization];
        [self setUpView];
    }
    return self;
}
-(void)initialization
{
    _scrollTimeinterval = 2;
    _showPageControl = YES;
    _pageControlAlignment = ZJCycleScrollViewPageControlAlignmentRight;
}
-(void)setUpView
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(self.bounds.size.width, self.bounds.size.height);
    flowLayout.scrollDirection =UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 0;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
    collectionView.backgroundColor = [UIColor clearColor];
    collectionView.pagingEnabled = YES;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.showsVerticalScrollIndicator = NO;
    [collectionView registerClass:[ZJScrollCell class] forCellWithReuseIdentifier:@"ZJScrollCell"];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [self addSubview:collectionView];
    self.collectionView = collectionView;
    
}
-(void)clearCachesData
{
    [ZJImageDownloadManager clearData];
}
#pragma mark -- set方法
-(void)setImagesGroup:(NSArray *)imagesGroup
{
    _imagesGroup = imagesGroup;
    self.itemsCount = imagesGroup.count *50;
    if(imagesGroup.count==1)
    {
        self.collectionView.scrollEnabled = NO;
    }
    else
    {
        [self setUpTimer];
    }
    [self setUpPageControl];
    [self.collectionView reloadData];
}
-(void)setUrlStringGroup:(NSArray *)urlStringGroup
{
    _urlStringGroup = urlStringGroup;
    NSMutableArray *mutableArray =[NSMutableArray array] ;
    [urlStringGroup enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if(self.placeholderImage)
        {
            [mutableArray addObject:self.placeholderImage];
        }
        else
        {
            [mutableArray addObject:[[UIImage alloc]init] ];
        }
    }];
    
    self.imagesGroup = mutableArray;
    
    [_urlStringGroup enumerateObjectsUsingBlock:^(NSString *urlString, NSUInteger idx, BOOL * _Nonnull stop) {
        [ZJImageDownloadManager loadImageWithUrlstringArray:urlString completionBlock:^(UIImage *image) {
            if(image)
            {
               [mutableArray setObject:image atIndexedSubscript:idx];
            }
            [self.collectionView reloadData];
        }];
    }];
}
-(void)setPlaceholderImage:(UIImage *)placeholderImage
{
    _placeholderImage = placeholderImage;
}
-(void)setScrollTimeinterval:(float)scrollTimeinterval
{
    _scrollTimeinterval = scrollTimeinterval;
    [_timer invalidate];
    _timer = nil;
    [self setUpTimer];
}
-(void)setPageControlAlignment:(ZJCycleScrollViewPageControlAlignment)pageControlAlignment
{
    _pageControlAlignment = pageControlAlignment;
    [self setUpPageControl];
}
-(void)setShowPageControl:(BOOL)showPageControl
{
    _showPageControl = showPageControl;
    _pageControl.hidden = !showPageControl;
}
#pragma mark -- privateMethod
-(void)setUpPageControl
{
    if(_pageControl)
    {
        [_pageControl removeFromSuperview];
    }
    if(self.imagesGroup.count==1)
    {
        return;
    }
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.numberOfPages = self.imagesGroup.count;
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    [self addSubview:pageControl];
    self.pageControl = pageControl;
    CGSize size;
    size.width = self.imagesGroup.count *20;
    switch (self.pageControlAlignment)
    {
        case ZJCycleScrollViewPageControlAlignmentRight:
            pageControl.center = CGPointMake(self.bounds.size.width*4/5, self.bounds.size.height*5/6);
            pageControl.bounds = CGRectMake(0, 0, size.width, 20);
            break;
        case ZJCycleScrollViewPageControlAlignmentCenter:
            pageControl.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height*5/6);
            pageControl.bounds = CGRectMake(0, 0, size.width, 20);
            break;
        default:
            break;
    }
}
-(void)setUpTimer
{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:self.scrollTimeinterval target:self selector:@selector(timeScroll) userInfo:nil repeats:YES];
    self.timer = timer;
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}
-(void)timeScroll
{
    NSIndexPath *currrentIndexPath = [[self.collectionView indexPathsForVisibleItems] lastObject];
    NSInteger nextItem = currrentIndexPath.item + 1;
    if(nextItem==self.itemsCount)
    {
        nextItem = 0;
         [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:nextItem inSection:currrentIndexPath.section] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    }
    
    NSIndexPath *nextPath = [NSIndexPath indexPathForItem:nextItem inSection:currrentIndexPath.section];
    
    [self.collectionView scrollToItemAtIndexPath:nextPath atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
}
#pragma mark --UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.itemsCount;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZJScrollCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZJScrollCell" forIndexPath:indexPath];
    long itemIndex = indexPath.item%self.imagesGroup.count;
    UIImage *image = self.imagesGroup[itemIndex];
    cell.imageView.image = image;
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    int m = (int)indexPath.item%self.imagesGroup.count;
    if([_delegate respondsToSelector:@selector(scrollView:didSelectItemAtIndex:)])
    {
        [_delegate scrollView:self didSelectItemAtIndex:m];
    }
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    if(self.collectionView.contentOffset.x==0&&_imagesGroup.count!=0)
    {
        int nextItem = self.itemsCount *0.5;
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:nextItem inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    }
}

- (void)dealloc {
    _collectionView.delegate = nil;
    _collectionView.dataSource = nil;
}
- (void)willMoveToSuperview:(UIView *)newSuperview
{
    if (!newSuperview) {
        [_timer invalidate];
        _timer = nil;
    }
}
#pragma mark --scrollViewDelagate
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if(!_timer)
    {
        [self setUpTimer];
    }
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [_timer invalidate];
    _timer = nil;
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self scrollViewDidEndDecelerating:scrollView];
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
   
    int itemIndex = scrollView.contentOffset.x/self.collectionView.bounds.size.width;
    int currentPage = itemIndex%self.imagesGroup.count;
    self.pageControl.currentPage = currentPage;
}
@end
