//
//  HHLoopView.m
//  HHLoopView
//
//  Created by hehai on 2018/7/31.
//

#import "HHLoopView.h"
#import "HHLoopViewCell.h"
#import "NSTimer+HHExt.h"

static const int HHMaxSectionCount = 50;
static const NSTimeInterval HHLoopViewKeepTime = 3;

@interface HHLoopView ()
<
UICollectionViewDelegate,
UICollectionViewDataSource
>

/// 主列表
@property (nonatomic, strong) UICollectionView *mainCollectionView;

/// 点击的block(仅为针对图片)
@property (nonatomic, copy) void(^clickBlock)(int intIndex);
/// 图片数组(支持：UIImage、NSString、NSURL，前边三者都不是时的处理)
@property (nonatomic, strong) NSArray *imageList;
/// 点击的图片序号
@property (nonatomic, assign) int touchedIndex;
/// 定时器
@property (nonatomic, strong) NSTimer *timer;

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
    [_mainCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:HHMaxSectionCount/2] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}

- (UICollectionView *)mainCollectionView {
    if (!_mainCollectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.itemSize = CGSizeMake(self.frame.size.width, self.frame.size.height);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _mainCollectionView = [[UICollectionView alloc] initWithFrame:self.frame collectionViewLayout:layout];
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

#pragma mark - UICollectionView DataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return HHMaxSectionCount;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _imageList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HHLoopViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[HHLoopViewCell cellID] forIndexPath:indexPath];
    NSString *strName = _imageList[indexPath.item];
    cell.imageName = strName;
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

#pragma mark - Timer

- (void)addTimer {
    
    __weak typeof(self) weakSelf = self;
    _timer = [NSTimer hh_timerwithTimeInterval:HHLoopViewKeepTime block:^{
        [weakSelf nextPage];
    } repeat:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)removeTimer {
    [self.timer invalidate];
    self.timer = nil;
}

- (void)nextPage {
    
    NSIndexPath *currentIndexPath = [[_mainCollectionView indexPathsForVisibleItems] lastObject];
    
    NSIndexPath *currentIndexPathRest = [NSIndexPath indexPathForItem:currentIndexPath.item inSection:HHMaxSectionCount/2];
    [_mainCollectionView scrollToItemAtIndexPath:currentIndexPathRest atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
    NSInteger nextItem = currentIndexPathRest.item + 1;
    NSInteger nextSection = currentIndexPathRest.section;
    if (nextItem == _imageList.count) {
        nextItem = 0;
        nextSection++;
    }
    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:nextItem inSection:nextSection];
    
    [_mainCollectionView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}

#pragma mark - dealloc

#if DEBUG

- (void)dealloc {
    NSLog(@"---%s被销毁了---", __FUNCTION__);
}

#endif

@end
