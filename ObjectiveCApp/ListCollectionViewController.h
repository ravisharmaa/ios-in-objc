//
//  ListCollectionViewController.h
//  ObjectiveCApp
//
//  Created by Javra Software on 10/29/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListCollectionViewController : UIViewController

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewDiffableDataSource *dataSource;

@end

NS_ASSUME_NONNULL_END
