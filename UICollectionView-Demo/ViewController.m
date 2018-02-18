//
//  ViewController.m
//  UICollectionView-Demo
//
//  Created by leadingwinner on 13-12-20.
//  Copyright (c) 2013年 leadingwinner. All rights reserved.
//

#import "ViewController.h"
#import "CollectionCell.h"
#import "DetailViewController.h"
@interface ViewController ()

@end
NSString *kCellID = @"cellID";

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.CollectionView registerClass:[CollectionCell class] forCellWithReuseIdentifier:kCellID];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionVie
{
    return 2;
}
//Section中有多少个items
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    // 每个Section的item个数
    if (section==1) {
        return 10;
    }else
        return 22;
    //return 32;
}
//根据Cell顺序编号，确定cell内部的设置
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionCell *cell = (CollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kCellID forIndexPath:indexPath];
    // 图片的名称
    NSString *imageToLoad = [NSString stringWithFormat:@"%d.JPG", indexPath.row];
    // 设置label文字
    cell.label.text = [NSString stringWithFormat:@"{%d}",indexPath.row];
    
    // 设置imageView的图片
    cell.imageView.image = [UIImage imageNamed:imageToLoad];
    
    return cell;
    
}
//选择cell之后的操作
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *imageNameToLoad = [NSString stringWithFormat:@"%d_full", indexPath.row];
    NSString *pathToImage = [[NSBundle mainBundle] pathForResource:imageNameToLoad ofType:@"JPG"];
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:pathToImage];
    DetailViewController *detailVC = [[DetailViewController alloc]initWithNibName:@"DetailViewController" bundle:nil];
    detailVC.image = image;
    [self presentViewController:detailVC animated:YES completion:nil];

}

@end
