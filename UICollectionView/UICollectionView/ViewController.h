//
//  ViewController.h
//  UICollectionView
//
//  Created by hhb on 2020/11/10.
//  Copyright © 2020 edz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property(nonatomic,strong)void(^didSelected)(NSInteger row);

@end

