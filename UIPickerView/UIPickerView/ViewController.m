//
//  ViewController.m
//  UIPickerView
//
//  Created by hhb on 2020/11/5.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"
//在UIPickerViewDataSource数据源协议中，仅仅提供了UIPickerView包含几列以及每一列的项数，而每一行展示的选项是通过UIPickerViewDelegate协议中的方法来设置的。
@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property(nonatomic,strong)UIPickerView *pickerView;

@property(nonatomic,strong)NSMutableArray *numberArray;

@property(nonatomic,stro
          ng)NSMutableArray *titleArray;

@property(nonatomic,copy)NSString *selectedNumStr;

@property(nonatomic,copy)NSString *selectedTitleStr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    
    self.pickerView.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:self.pickerView];
    
    self.pickerView.dataSource = self;
    
    self.pickerView.delegate = self;
    
    self.numberArray = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < 10; i++) {
        NSString *tempStr = [NSString stringWithFormat:@"%d",i];
        
        [self.numberArray addObject:tempStr];
    }
    
    self.titleArray = [[NSMutableArray alloc]init];
    for (int i = 0; i < 5; i++) {
        NSString *tempStr = [NSString stringWithFormat:@"title%d",i];
        [self.titleArray addObject:tempStr];
    }
}
//设置列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}
//设置指定列包含的项数。component列
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSLog(@"component=%d",component);
    if (component == 0) {
        return self.numberArray.count;
    }else {
        return self.titleArray.count;
    }
}

// 返回pickerView 每行的内容
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        return self.numberArray[row];
    }else{
        return self.titleArray[row];
    }
}

// 返回pickerView的高度
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 44;
}
// pickerView的宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    if (component == 0) {
        return 50;
    }
    return 200;
}
//获取用户当前选中的选项 用户进行选择
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{

    if (component == 0){
        NSString *numStr = self.numberArray[row];
        NSLog(@"numStr = %@",numStr);
        self.selectedNumStr = numStr;
    }else{
        NSString *titleStr = self.titleArray[row];
        self.selectedTitleStr = titleStr;
    }
}

@end
