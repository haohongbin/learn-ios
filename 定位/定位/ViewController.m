//
//  ViewController.m
//  定位
//
//  Created by hhb on 2020/11/20.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()<CLLocationManagerDelegate>

@property(nonatomic,strong)CLLocationManager *locationManger;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.locationManger = [[CLLocationManager alloc]init];
    self.locationManger.delegate = self;
    [self.locationManger requestWhenInUseAuthorization];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"开始定位" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor redColor]];
    [button addTarget:self action:@selector(startLocation:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    button.bounds = CGRectMake(0, 0, 100, 50);
    button.center = self.view.center;
    
}

- (void)startLocation:(UIButton *)sender{
    [self.locationManger startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    [manager stopUpdatingLocation];
    
    CLGeocoder *gencoder = [[CLGeocoder alloc]init];
    
    [gencoder reverseGeocodeLocation:[locations firstObject] completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        NSLog(@"placemarks = %@",placemarks);
        
        NSLog(@"%@",placemarks.firstObject.addressDictionary);
    }];
}

//定位失败回调方法
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"定位失败，错误：%@",error);
}
@end
