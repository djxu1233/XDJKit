//
//  UIScrollView+MJ.h
//  TransformDemo
//
//  Created by DJ on 2018/12/5.
//  Copyright © 2018年 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh/MJRefresh.h>

@interface UIScrollView (MJ)

/** 自动刷新头部*/
- (void)dj_onceHeaderBeginRefreshing;
/** 自动刷新底部*/
- (void)dj_onceFooterBeginRefreshing;

/** 判断是否正在刷新*/
- (BOOL)dj_isRefreshing;
/** 添加下拉刷新*/
- (void)dj_addHeaderWithRefreshingBlock:(void (^)(void))block;
/** 添加上拉加载*/
- (void)dj_addFooterWithRefrshingBlock:(void (^)(void))block;

/** 结束下拉刷新*/
- (void)dj_headerEndRefreshing;
/** 结束上拉加载*/
- (void)dj_footerEndRefreshing;

/** 是否隐藏头部*/
- (void)dj_hiddenHeader:(BOOL)hidden;
/** 是否隐藏底部*/
- (void)dj_hiddenFooter:(BOOL)hidden;

/** 显示没有更多数据*/
- (void)dj_refreshEndWithNoMoreData;

@end

