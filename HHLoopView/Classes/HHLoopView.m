//
//  HHLoopView.m
//  HHLoopView
//
//  Created by hehai on 2018/7/31.
//  Copyright © 2018 riversea2015. All rights reserved.
//

#import "HHLoopView.h"
#import "HHLoopViewCell.h"
#import "NSTimer+HHExt.h"

static const int HHMaxSectionCount = 50;
static const NSTimeInterval HHLoopViewKeepTime = 3;
static const int HHDotWidth = 10;

@interface HHLoopView ()
<
UICollectionViewDelegate,
UICollectionViewDataSource
>

@property (nonatomic, strong) UICollectionView *mainCollectionView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) NSArray *imageList;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, copy) void(^clickBlock)(int intIndex);
@property (nonatomic, assign) int touchedIndex;

@end

@implementation HHLoopView

#pragma mark - init Views

- (instancetype)initWithFrame:(CGRect)frame images:(NSArray *)imgArr clickAction:(void (^)(int))clickAction {
    return [self initWithFrame:frame images:imgArr customViews:nil clickAction:clickAction];
}

- (instancetype)initWithFrame:(CGRect)frame images:(NSArray *)imgArr customViews:(NSArray *)customViews clickAction:(void (^)(int))clickAction {
    self = [super initWithFrame:frame];
    if (self) {
        _imageList = imgArr;
        _clickBlock = clickAction;
        
        [self setupViews];
        [self addTimer];
    }
    return self;
}

- (void)setupViews {
    [self addSubview:self.mainCollectionView];
    [self addSubview:self.pageControl];
    
    if (!HH_Arr_Is_Valid(_imageList) || _imageList.count <= 1) {
        return;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.mainCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:HHMaxSectionCount/2]
                                        atScrollPosition:UICollectionViewScrollPositionLeft
                                                animated:NO];
    });
}

- (UICollectionView *)mainCollectionView {
    if (!_mainCollectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.itemSize = CGSizeMake(self.frame.size.width, self.frame.size.height);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _mainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)
                                                 collectionViewLayout:layout];
        _mainCollectionView.backgroundColor = [UIColor whiteColor];
        _mainCollectionView.showsHorizontalScrollIndicator = NO;
        _mainCollectionView.showsVerticalScrollIndicator = NO;
        _mainCollectionView.pagingEnabled = YES;
        _mainCollectionView.dataSource = self;
        _mainCollectionView.delegate = self;
        
        [HHLoopViewCell registerToCollectionView:_mainCollectionView];
    }
    return _mainCollectionView;
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        CGFloat pageWidth = _imageList.count * HHDotWidth;
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake((HHScreenW-pageWidth)/2, CGRectGetMaxY(self.bounds)-30, pageWidth, 30)];
        _pageControl.hidesForSinglePage = YES;
        _pageControl.numberOfPages = _imageList.count;
    }
    
    return _pageControl;
}

#pragma mark - UICollectionView DataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return (_imageList.count == 1) ? 1 : HHMaxSectionCount;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _imageList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HHLoopViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[HHLoopViewCell cellID] forIndexPath:indexPath];
    
    NSString *strName = _imageList[indexPath.item];
    cell.image = strName;
    
    return cell;
}

#pragma mark - UICollectionView Delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (_clickBlock) {
        _clickBlock((int)indexPath.row);
    }
}

#pragma mark - UIScrollView Delegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self removeTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self addTimer];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int page = (int)(scrollView.contentOffset.x/scrollView.frame.size.width + 0.5)%_imageList.count;
    self.pageControl.currentPage = page;
}

#pragma mark - Add or Remove Timer

- (void)addTimer {
    
    if (!HH_Arr_Is_Valid(_imageList) || _imageList.count <= 1) {
        return;
    }
    
    __weak typeof(self) weakSelf = self;
    _timer = [NSTimer hh_timerwithTimeInterval:HHLoopViewKeepTime block:^{
        [weakSelf nextPage];
    } repeat:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)removeTimer {
    
    if (!HH_Arr_Is_Valid(_imageList) || _imageList.count <= 1) {
        return;
    }
    
    [self.timer invalidate];
    self.timer = nil;
}

- (void)nextPage {
    
    NSIndexPath *currentIndexPath = [[_mainCollectionView indexPathsForVisibleItems] lastObject];
    NSIndexPath *currentIndexPathRest = [NSIndexPath indexPathForItem:currentIndexPath.item inSection:HHMaxSectionCount/2];
    [_mainCollectionView scrollToItemAtIndexPath:currentIndexPathRest
                                atScrollPosition:UICollectionViewScrollPositionLeft
                                        animated:NO];
    
    NSInteger nextItem = currentIndexPathRest.item + 1;
    NSInteger nextSection = currentIndexPathRest.section;
    if (nextItem == _imageList.count) {
        nextItem = 0;
        nextSection++;
    }
    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:nextItem inSection:nextSection];
    
    [_mainCollectionView scrollToItemAtIndexPath:nextIndexPath
                                atScrollPosition:UICollectionViewScrollPositionLeft
                                        animated:YES];
    
    self.pageControl.currentPage = nextItem;
}

#pragma mark - dealloc

#if DEBUG

- (void)dealloc {
    NSLog(@"--- (＾－＾) %s (＾－＾) ---", __FUNCTION__);
}

#endif

@end
