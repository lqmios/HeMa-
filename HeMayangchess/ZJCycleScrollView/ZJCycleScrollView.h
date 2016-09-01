//
//  ZJCycleScrollView.h
//  ZJScrollView
//
//  Created by ZJ on 16/3/16.
//  Copyright © 2016年 ZJ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZJCycleScrollView;
typedef enum {
    
    ZJCycleScrollViewPageControlAlignmentRight,
    ZJCycleScrollViewPageControlAlignmentCenter
}ZJCycleScrollViewPageControlAlignment;

@protocol ZJCycleScrollViewDelegate <NSObject>

@optional
-(void)scrollView:(ZJCycleScrollView *)scrollView didSelectItemAtIndex:(int)index;

@end

@interface ZJCycleScrollView : UIView

-(id)initWithFrame:(CGRect)frame imagesGroup:(NSArray *)imagesGroup;
-(id)initWithFrame:(CGRect)frame urlStringGroup:(NSArray *)urlStringGroup placeholderImage:(UIImage *)placeImage;

/**
 清除网络图片缓存
 */
-(void)clearCachesData;

@property (nonatomic,weak)id <ZJCycleScrollViewDelegate> delegate;
/**
  图片数组
*/
@property (nonatomic,retain)NSArray *imagesGroup;

/**
 网络图片，urlString数组
 */
@property (nonatomic,retain)NSArray *urlStringGroup;

/**
 自动滚动时间间隔，默认为2s
 */
@property (nonatomic,assign)float scrollTimeinterval;

/**
 是否显示pagecontrol，默认为yes
 */
@property (nonatomic,assign)BOOL showPageControl;

/**
 pageControl的位置，默认在右侧
 */
@property (nonatomic,assign)ZJCycleScrollViewPageControlAlignment pageControlAlignment;


@end
