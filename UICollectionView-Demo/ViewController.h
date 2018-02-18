//
//  ViewController.h
//  UICollectionView-Demo
//
//  Created by leadingwinner on 13-12-20.
//  Copyright (c) 2013年 leadingwinner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *CollectionView;

@end
