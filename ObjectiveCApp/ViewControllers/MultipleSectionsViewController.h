//
//  MultipleSectionsViewController.h
//  ObjectiveCApp
//
//  Created by Ravi Bastola on 11/1/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MultipleSectionsViewController : UIViewController

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewDiffableDataSource *dataSource;


@end

NS_ASSUME_NONNULL_END
