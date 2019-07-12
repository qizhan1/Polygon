//
//  TileViewController.m
//  Polygon
//
//  Created by Qi Zhan on 1/5/18.
//  Copyright © 2018 Qi Zhan. All rights reserved.
//


// *************************************************************************************************
// # MARK: Imports


#import "TileViewController.h"

#import "SimpleRegularPolygon.h"
#import "SimpleRegularPolygonView.h"
#import "SimpleRegularPolygonViewCell.h"
#import "UIColor+Polygon.h"


// *************************************************************************************************
// # MARK: Constants


NSString *kCellID = @"SimpleRegularPolygonViewCellID";


// *************************************************************************************************
// # MARK: Private Interfaces


@interface TileViewController () <UICollectionViewDelegate, UICollectionViewDataSource>


@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray<NSArray *> *polygonArray;


@end


// *************************************************************************************************
// # MARK: Implementation


@implementation TileViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.polygonArray = [self createDataSource];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView registerClass:[SimpleRegularPolygonViewCell class]
            forCellWithReuseIdentifier:kCellID];
    [self.collectionView reloadData];
}


// *************************************************************************************************
// # MARK: UICollectionView Data Source


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return self.polygonArray.count;
}


- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    
    return self.polygonArray[0].count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)cv
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SimpleRegularPolygonViewCell *cell = [cv dequeueReusableCellWithReuseIdentifier:kCellID
                                                                       forIndexPath:indexPath];
    SimpleRegularPolygon *polygon = self.polygonArray[indexPath.section][indexPath.row];
    cell.polygonView.polygon = polygon;
    cell.polygonView.polygon.radius = CGRectGetMidX(cell.bounds);
    cell.polygonView.frame = cell.bounds;
    
    return cell;
}


// *************************************************************************************************
// # MARK: UICollectionView Delgate


- (void)collectionView:(UICollectionView *)collectionView
        didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    SimpleRegularPolygonViewCell *cell
        = (SimpleRegularPolygonViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    [cell.polygonView runRotateAnimation];
    
    NSIndexPath *rightCellIndexPath =  [NSIndexPath indexPathForRow:indexPath.row + 1
                                                          inSection:indexPath.section];
    SimpleRegularPolygonViewCell *rightCell
        = (SimpleRegularPolygonViewCell *)[self.collectionView cellForItemAtIndexPath:rightCellIndexPath];
    [rightCell.polygonView runRotateAnimation];
    
    NSIndexPath *leftCellIndexPath =  [NSIndexPath indexPathForRow:indexPath.row - 1
                                                         inSection:indexPath.section];
    SimpleRegularPolygonViewCell *leftCell
        = (SimpleRegularPolygonViewCell *)[self.collectionView cellForItemAtIndexPath:leftCellIndexPath];
    [leftCell.polygonView runRotateAnimation];
    
    NSIndexPath *topCellIndexPath =  [NSIndexPath indexPathForRow:indexPath.row
                                                        inSection:indexPath.section - 1];
    SimpleRegularPolygonViewCell *topCell
        = (SimpleRegularPolygonViewCell *)[self.collectionView cellForItemAtIndexPath:topCellIndexPath];
    [topCell.polygonView runRotateAnimation];
    
    NSIndexPath *bottomCellIndexPath =  [NSIndexPath indexPathForRow:indexPath.row
                                                           inSection:indexPath.section + 1];
    SimpleRegularPolygonViewCell *bottomCell
        = (SimpleRegularPolygonViewCell *)[self.collectionView cellForItemAtIndexPath:bottomCellIndexPath];
    [bottomCell.polygonView runRotateAnimation];
}


- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = CGRectGetWidth(collectionView.frame) / 7;
    CGFloat height = width;
    return CGSizeMake(width, height);
}


// *************************************************************************************************
// # MARK: Private Methods


- (NSUInteger)randomNumber {
    int lowerBound = 3;
    int upperBound = 8;
    
    return lowerBound + arc4random_uniform((uint32_t)(upperBound - lowerBound + 1));
}


- (NSArray *)createDataSource {
    NSMutableArray *sectionArray = [NSMutableArray new];
    
    for (int section = 0; section < 12; section++) {
        NSMutableArray *rowArray = [ NSMutableArray new];
        for (int row = 0; row < 6; row++) {
            [rowArray addObject:[self createPolygon]];
        }
        [sectionArray addObject:rowArray];
    }
    
    return sectionArray;
}


- (SimpleRegularPolygon *)createPolygon {
    NSError *error = nil;
    SimpleRegularPolygon *polygon = [SimpleRegularPolygon new];
    polygon.rotatable = YES;
    
    [polygon setSides:[self randomNumber] error:&error];
    if (!error) {
        polygon.color = [UIColor randomColor];
        polygon.shouldFillColor = YES;
    }
    
    return polygon;
}


@end
