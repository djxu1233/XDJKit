//
//  UIScrollView+MJ.m
//  TransformDemo
//
//  Created by DJ on 2018/12/5.
//  Copyright © 2018年 MAC. All rights reserved.
//

#import "UIScrollView+MJ.h"

@implementation UIScrollView (MJ)

/** 自动刷新头部*/
- (void)dj_onceHeaderBeginRefreshing {
    [self.mj_header beginRefreshing];
}
/** 自动刷新底部*/
- (void)dj_onceFooterBeginRefreshing {
    [self.mj_footer beginRefreshing];
}

/** 判断是否正在刷新*/
- (BOOL)dj_isRefreshing {
    if ([self.mj_header isRefreshing] || [self.mj_footer isRefreshing]) {
        return YES;
    } else {
        return NO;
    }
}

/** 添加下拉刷新*/
- (void)dj_addHeaderWithRefreshingBlock:(void (^)(void))block {
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:block];
    header.automaticallyChangeAlpha = YES;
    // 设置文字
    //    [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    //    [header setTitle:@"释放更新" forState:MJRefreshStatePulling];
    //    [header setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
    //
    //    header.arrowView.image = imageNamed(@"MJ_arrow");
    //    // 设置字体
    //    header.stateLabel.font = [UIFont systemFontOfSize:14];
    //    header.lastUpdatedTimeLabel.hidden = YES;
    self.mj_header = header;//[MJRefreshNormalHeader headerWithRefreshingBlock:block];
    self.mj_header.backgroundColor = [UIColor clearColor];
}

/** 添加上拉加载*/
- (void)dj_addFooterWithRefrshingBlock:(void (^)(void))block {
    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:block];
    //     footer.stateLabel.font = [UIFont systemFontOfSize:14];
    footer.automaticallyChangeAlpha = YES;
    [footer setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
    self.mj_footer = footer;
    self.mj_footer.backgroundColor=[UIColor clearColor];
}

/** 结束下拉刷新*/
- (void)dj_headerEndRefreshing {
    [self.mj_header endRefreshing];
}

/** 结束上拉加载*/
- (void)dj_footerEndRefreshing {
    [self.mj_footer endRefreshing];
}

/** 是否隐藏头部*/
- (void)dj_hiddenHeader:(BOOL)hidden {
    self.mj_header.hidden = hidden;
}

/** 是否隐藏底部*/
- (void)dj_hiddenFooter:(BOOL)hidden {
    self.mj_footer.hidden = hidden;
}

/** 显示没有更多数据*/
- (void)dj_refreshEndWithNoMoreData {
    [self.mj_footer endRefreshingWithNoMoreData];
}


@end
