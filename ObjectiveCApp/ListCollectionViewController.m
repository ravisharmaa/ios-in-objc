//
//  ListCollectionViewController.m
//  ObjectiveCApp
//
//  Created by Ravi Bastola on 10/29/20.
//

#import "ListCollectionViewController.h"
#import "CustomCollectionViewCell.h"

@interface ListCollectionViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation ListCollectionViewController

@synthesize collectionView = _collectionView;
@synthesize dataSource = _dataSource;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    
    [self configureCollectionView];
    
    [self.view addSubview:_collectionView];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor systemBackgroundColor];
    
    [_collectionView registerClass: CustomCollectionViewCell.class forCellWithReuseIdentifier:@"reuseMe"];
    
    
    _collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [_collectionView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = YES;
    [_collectionView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor].active = YES;
    [_collectionView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor].active = YES;
    [_collectionView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor].active = YES;
    
    
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


- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CustomCollectionViewCell *cell = [ collectionView dequeueReusableCellWithReuseIdentifier:@"reuseMe" forIndexPath:indexPath ];
    
    cell.backgroundColor = [UIColor redColor];
    
    cell.layer.cornerRadius = 8;
    
    cell.clipsToBounds = YES;
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}


@end
