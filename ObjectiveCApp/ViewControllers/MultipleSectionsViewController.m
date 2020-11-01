//
//  MultipleSectionsViewController.m
//  ObjectiveCApp
//
//  Created by Ravi Bastola on 11/1/20.
//

#import "MultipleSectionsViewController.h"
#import "CustomCollectionViewCell.h"
#import "Section.h"

@interface MultipleSectionsViewController ()

@property (nonatomic, strong) NSMutableArray<Section *> *sectionArray;
@property (nonatomic, strong) NSCollectionLayoutDimension *itemHeight;
@property (nonatomic, strong) NSCollectionLayoutDimension *itemWidth;
@property (nonatomic, strong) NSCollectionLayoutDimension *groupHeight;
@property (nonatomic, strong) NSCollectionLayoutDimension *groupWidth;
@property (nonatomic, strong) NSCollectionLayoutGroup *group;

@end

@implementation MultipleSectionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    
    [self configureCollectionView];
    
    self.collectionView.backgroundColor = [UIColor systemBackgroundColor];
    
    [self.collectionView registerClass:CustomCollectionViewCell.class forCellWithReuseIdentifier:@"reuseMe"];
    self.collectionView.showsVerticalScrollIndicator = NO;
    
    [self configureDataSource];
    
    
}

- (void) configureCollectionView {
    
    UICollectionViewCompositionalLayout *layout = [[UICollectionViewCompositionalLayout alloc] initWithSectionProvider:^NSCollectionLayoutSection * _Nullable(NSInteger section, id<NSCollectionLayoutEnvironment> environment) {
        
        if (section == 0) {
            self->_itemWidth = [NSCollectionLayoutDimension fractionalWidthDimension:1.0];
            
            self->_itemHeight = [NSCollectionLayoutDimension fractionalHeightDimension:1.0];
            
            self->_groupWidth = [NSCollectionLayoutDimension fractionalWidthDimension:0.9];
            self->_groupHeight = [NSCollectionLayoutDimension absoluteDimension:300];
        
        }  else {
            self->_itemWidth = [NSCollectionLayoutDimension fractionalWidthDimension:1.0];
            
            self->_itemHeight = [NSCollectionLayoutDimension fractionalHeightDimension:0.3];
            
            self->_groupWidth = [NSCollectionLayoutDimension fractionalWidthDimension:0.9];
            self->_groupHeight = [NSCollectionLayoutDimension absoluteDimension:330];
        }
         
        
        NSCollectionLayoutSize *itemSize = [NSCollectionLayoutSize sizeWithWidthDimension:self->_itemWidth heightDimension:self->_itemHeight];
        
        NSCollectionLayoutItem *item = [NSCollectionLayoutItem itemWithLayoutSize:itemSize];
        
        item.contentInsets = NSDirectionalEdgeInsetsMake(5, 5, 5, 5);
        
        
        NSCollectionLayoutSize *groupSize = [NSCollectionLayoutSize sizeWithWidthDimension:self->_groupWidth heightDimension:self->_groupHeight];
        
        NSArray *items = [[NSArray alloc] initWithObjects:item, nil];
        
        if (section == 0) {
            self->_group =  [NSCollectionLayoutGroup horizontalGroupWithLayoutSize:groupSize subitems:items];
        } else {
            self->_group =  [NSCollectionLayoutGroup verticalGroupWithLayoutSize:groupSize subitems:items];
        }
        
        NSCollectionLayoutSection *collectionSection = [NSCollectionLayoutSection sectionWithGroup:self->_group];
        
        collectionSection.orthogonalScrollingBehavior = UICollectionLayoutSectionOrthogonalScrollingBehaviorGroupPaging;
        
        return  collectionSection;
    }];
    
    UICollectionViewCompositionalLayoutConfiguration *config = [[UICollectionViewCompositionalLayoutConfiguration alloc] init];
    
    config.interSectionSpacing = 20;
    
    layout.configuration = config;
    
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    
    [self.view addSubview:self.collectionView];
    
    
    self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.collectionView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = YES;
    [self.collectionView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.collectionView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [self.collectionView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
}

- (void) configureDataSource {
    _dataSource = [[UICollectionViewDiffableDataSource alloc] initWithCollectionView:_collectionView cellProvider:^UICollectionViewCell * _Nullable(UICollectionView * collectionView, NSIndexPath * indexPath, id identifier) {
        CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"reuseMe" forIndexPath:indexPath];
        
        switch (indexPath.section) {
            case 0:
                cell.backgroundColor = [UIColor systemGrayColor];
                break;
            case 1:
                cell.backgroundColor = [UIColor systemBlueColor];
                break;
            case 2:
                cell.backgroundColor = [UIColor systemGreenColor];
                break;
        }
        
        cell.layer.cornerRadius = 8;
        
        
        return cell;
    }];
    
    self.sectionArray = [[NSMutableArray alloc] init];
    
#pragma mark - Section 0
    
    Section *mainSection = [[Section alloc] init];
    
    mainSection.name = @"main";
    
    [_sectionArray addObject:mainSection];
    
    Section *secondSection = [[Section alloc] init];
    
    secondSection.name = @"second";
    
    [_sectionArray addObject:secondSection];
    
    
    Section *thirdSection = [[Section alloc] init];
    
    thirdSection.name = @"third";
    
    [_sectionArray addObject:thirdSection];
    
    NSArray *items = @[@1,@2,@3];
    
    NSArray *sec = @[@4,@5,@6,@7,@8,@9];
    
    NSArray *thirdSectionItems = @[@10,@11,@12,@13,@14];
    
    
    NSDiffableDataSourceSnapshot *snapshot = NSDiffableDataSourceSnapshot.new;
    
    [snapshot appendSectionsWithIdentifiers:_sectionArray];
    
    [snapshot appendItemsWithIdentifiers:items intoSectionWithIdentifier:mainSection];
    
    [snapshot appendItemsWithIdentifiers:sec intoSectionWithIdentifier:secondSection];
    
    [snapshot appendItemsWithIdentifiers:thirdSectionItems intoSectionWithIdentifier:thirdSection];
    
    [_dataSource applySnapshot:snapshot animatingDifferences:YES];
    
}
@end
