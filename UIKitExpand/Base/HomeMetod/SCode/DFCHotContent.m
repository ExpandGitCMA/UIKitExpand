#import "DFCHotContent.h"
#import "HotContentCell.h"
#import "SportsColorHeader.h"
#import "SportsBallFile.h"
@interface DFCHotContent ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,copy)NSArray*hotSearch;
@property(assign,nonatomic)NSInteger isCurrentSelect;
@property(nonatomic,strong)UIView  *line;
@property(nonatomic,strong)UICollectionView *collectionView;
@end
static int const content = 50;
@implementation DFCHotContent
-(instancetype)initWithFrame:(CGRect)frame HotSearch:(NSArray*)hotSearch{
    if (self = [super initWithFrame:frame]) {
        _hotSearch = hotSearch;
        [self setUpView];
    }
    return self;
}
-(void)setUpView{
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, content) collectionViewLayout:flowLayout];
    _collectionView.dataSource=self;
    _collectionView.delegate=self;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.backgroundColor=[UIColor whiteColor];
    [_collectionView registerClass:[HotContentCell class] forCellWithReuseIdentifier:@"cell"];
    [self addSubview:_collectionView];
    _line = [[UIView alloc] init];
    _line.frame=CGRectMake(0, content, self.frame.size.width, 0.5);
    _line.backgroundColor= kUIColorFromRGB(LineColore);
    [self addSubview:_line];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _hotSearch.count;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HotContentCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell"forIndexPath:indexPath];
    cell.titleLabel.text = [_hotSearch objectAtIndex:indexPath.row];
    [cell sizeForCell:cell.titleLabel.text];
    if (_isCurrentSelect == indexPath.row) {
        [cell setSelectCell:YES];
    }else{
        [cell setSelectCell:NO];
    }
    return cell;
}
#pragma mark 设置选中状态
-(void)setSelectStatus:(NSIndexPath *)indexPath{
    _isCurrentSelect = indexPath.row;
    [_collectionView selectItemAtIndexPath:indexPath animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
    [_collectionView reloadData];
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(selectStatus:page:)]) {
        [self.delegate selectStatus:self page:indexPath.row];
    }
    [self setSelectStatus:indexPath];
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
      CGFloat defutMaxWidth =  [self itemCelBounds:[_hotSearch objectAtIndex:indexPath.row]];
      return CGSizeMake(defutMaxWidth, content);
}
-(CGFloat)itemCelBounds:(NSString *)tring{
    CGSize maxSize = [tring sizeWithAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFang-SC-Medium" size:20.0f]}];
    return ceilf(maxSize.width);
}
- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 15, 0,15); 
}
-(void)reloadData:(NSInteger)index{
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
    [self setSelectStatus:indexPath];
}
@end
