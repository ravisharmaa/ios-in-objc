//
//  ListCollectionViewController.m
//  ObjectiveCApp
//
//  Created by Ravi Bastola on 10/29/20.
//

#import "ListCollectionViewController.h"
#import "CustomCollectionViewCell.h"

@interface ListCollectionViewController () <UICollectionViewDelegate>

@end

@implementation ListCollectionViewController

typedef NS_ENUM(int, Section) {
    main
};

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    
    [self configureCollectionView];
    
    [self.view addSubview:_collectionView];
    
    _collectionView.delegate = self;
    _collectionView.backgroundColor = [UIColor systemBackgroundColor];
    
    [_collectionView registerClass: CustomCollectionViewCell.class forCellWithReuseIdentifier:@"reuseMe"];
    
    
    _collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [_collectionView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = YES;
    [_collectionView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor].active = YES;
    [_collectionView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor].active = YES;
    [_collectionView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor].active = YES;
    

    [self configureDataSource];
    
    
}

- (void) configureCollectionView {
    
    NSCollectionLayoutDimension *itemWidth = [NSCollectionLayoutDimension fractionalWidthDimension:1.0];
    
    NSCollectionLayoutDimension *itemHeight = [NSCollectionLayoutDimension absoluteDimension:80];
    
    NSCollectionLayoutSize *itemSize = [NSCollectionLayoutSize sizeWithWidthDimension:itemWidth heightDimension:itemHeight];
    
    NSCollectionLayoutItem *item = [NSCollectionLayoutItem itemWithLayoutSize:itemSize];
    
    item.contentInsets = NSDirectionalEdgeInsetsMake(5, 10, 0, 10);
    
    NSCollectionLayoutDimension *widthDimension = [NSCollectionLayoutDimension fractionalWidthDimension:1.0];
    
    NSCollectionLayoutDimension *heightDimension = [NSCollectionLayoutDimension absoluteDimension:100];
    
    NSCollectionLayoutSize *groupSize = [NSCollectionLayoutSize sizeWithWidthDimension:widthDimension heightDimension:heightDimension];
    
    NSArray *items = [[NSArray alloc] initWithObjects:item, nil];
    
    NSCollectionLayoutGroup *group = [NSCollectionLayoutGroup horizontalGroupWithLayoutSize:groupSize subitems:items];
    
    NSCollectionLayoutSection *section = [NSCollectionLayoutSection sectionWithGroup:group];
    
    UICollectionViewCompositionalLayout *layout = [[UICollectionViewCompositionalLayout alloc] initWithSection:section];
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
}

- (void) configureDataSource {
    _dataSource = [[UICollectionViewDiffableDataSource alloc] initWithCollectionView:_collectionView cellProvider:^UICollectionViewCell * _Nullable(UICollectionView * collectionView, NSIndexPath * indexPath, id identifier) {
        CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"reuseMe" forIndexPath:indexPath];
        
        return cell;
    }];
    
    
    
}


- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}


@end
