//
//  ModulesViewController.m
//  TestingStuff
//
//  Created by MacMiniHome on 08/01/17.
//  Copyright © 2017 MacMiniHome. All rights reserved.
//

#import "ModulesViewController.h"
#import "UIView+FFSAutoLayout.h"

#import "MOModuleItem.h"
#import "MOWishlistModuleCollectionViewCell.h"
#import "MORecommendationsModuleCollectionViewCell.h"
#import "MODesignersModuleCollectionViewCell.h"

static const CGFloat kCellSpace = 10.0;
static const CGFloat kRegularHorizontalCellHeight = 325.0;
static const CGFloat kCellSizeDifference = 5.0;

@interface ModulesViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, copy) NSArray<MOModuleItem *> *items;

@end

@implementation ModulesViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        
        _items = [NSArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerClass:[MOWishlistModuleCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([MOWishlistModuleCollectionViewCell class])];
    [self.collectionView registerClass:[MORecommendationsModuleCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([MORecommendationsModuleCollectionViewCell class])];
    [self.collectionView registerClass:[MODesignersModuleCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([MODesignersModuleCollectionViewCell class])];
}

- (void)loadView {
    
    self.view = [[UIView alloc] init];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    [self.collectionView setScrollEnabled:NO];
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.view addSubview:self.collectionView];
    
    [self.collectionView ffs_fillContainer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGSize)collectionViewCellSizeForItemAtIndexPath:(NSIndexPath *)indexPath
                                   traitCollection:(UITraitCollection*)traitCollection{
 
    CGFloat numberCellsPerRow = [self numberOfCellsPerRowForTraitCollection:traitCollection];
    
    if (numberCellsPerRow == 1) {
        
        MOModuleItem *moduleItem = (self.items.count > indexPath.row) ? self.items[indexPath.row] : nil;
        
        switch (moduleItem.type) {
                
            case MOModuleItemTypeDesigners: {
                return CGSizeMake(self.collectionView.frame.size.width, [MODesignersModuleCollectionViewCell cellHeight]);
            }
            case MOModuleItemTypeRecommendations: {
                return CGSizeMake(self.collectionView.frame.size.width, [MORecommendationsModuleCollectionViewCell cellHeight]);
            }
            case MOModuleItemTypeWishlist: {
                return CGSizeMake(self.collectionView.frame.size.width, [MOWishlistModuleCollectionViewCell cellHeight]);
            }
            case MOModuleItemTypeFallbackException: {
                return CGSizeZero;
            }
        }
    }
    
    return CGSizeZero;
}

- (CGFloat)contentHeightForTraitCollection:(nonnull UITraitCollection*)traitCollection {
    
    CGFloat numberCellsPerRow = [self numberOfCellsPerRowForTraitCollection:traitCollection];
    
    CGFloat totalCellSpacing = 0;
    __block CGFloat totalCellHeight = 0;
    
    if (numberCellsPerRow == 1) {
        
        totalCellSpacing = self.items.count * kCellSpace;
        
        [self.items enumerateObjectsUsingBlock:^(MOModuleItem * _Nonnull moduleItem, NSUInteger idx, BOOL * _Nonnull stop) {
            
            totalCellHeight += [self collectionViewCellSizeForItemAtIndexPath:[NSIndexPath indexPathForRow:idx inSection:0] traitCollection:traitCollection].height;
        }];
    }
    
    CGFloat totalContentHeight = totalCellHeight + totalCellSpacing;
    return totalContentHeight;
}

- (void)reloadWithContent {
    
    NSMutableArray *modulesItems = [NSMutableArray array];
    
    [modulesItems addObject:[[MOModuleItem alloc] initWithType:MOModuleItemTypeWishlist]];
    [modulesItems addObject:[[MOModuleItem alloc] initWithType:MOModuleItemTypeWishlist]];
    [modulesItems addObject:[[MOModuleItem alloc] initWithType:MOModuleItemTypeDesigners]];
    [modulesItems addObject:[[MOModuleItem alloc] initWithType:MOModuleItemTypeRecommendations]];
    
    self.items = [modulesItems copy];
    
    [self.collectionView reloadData];
}

- (CGFloat)numberOfCellsPerRowForTraitCollection:(UITraitCollection*)traitCollection {
    
    return 1.0;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MOModuleItem *moduleItem = self.items[indexPath.row];
    
    switch (moduleItem.type) {
        case MOModuleItemTypeWishlist: {
            
            MOWishlistModuleCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([MOWishlistModuleCollectionViewCell class]) forIndexPath:indexPath];
            
            [cell configureWithTitle:@"Wishlist 1"];
            
            return cell;
        }
        case MOModuleItemTypeRecommendations: {
            
            MORecommendationsModuleCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([MORecommendationsModuleCollectionViewCell class]) forIndexPath:indexPath];
            
            [cell configureWithTitle:@"Recommendations"];
            
            return cell;

        }
        case MOModuleItemTypeDesigners: {
            
            MODesignersModuleCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([MODesignersModuleCollectionViewCell class]) forIndexPath:indexPath];
            
            [cell configure];
            
            return cell;
        }
        case MOModuleItemTypeFallbackException: {
            
            NSAssert(NO, @"Should not happen...");
            return [[UICollectionViewCell alloc] init];
        }
    }
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return [self collectionViewCellSizeForItemAtIndexPath:indexPath
                                          traitCollection:self.view.traitCollection];
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    return kCellSpace;
}

@end
