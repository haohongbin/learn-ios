//
//  ViewController.m
//  拍照和选择照片
//
//  Created by hhb on 2020/11/17.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property(nonatomic,strong)UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"拍照" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(takePhoto:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    button.frame = CGRectMake(10, 20, self.view.frame.size.width - 20, 44);
    [button setBackgroundColor:[UIColor redColor]];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    //用来显示照片的区域
    self.imageView = [[UIImageView alloc]init];
    self.imageView.bounds = CGRectMake(0, 0, 200, 200);
    self.imageView.center = self.view.center;
    [self.view addSubview:self.imageView];
}

//调用摄像头拍照
- (void)takePhoto:(UIButton *)sender{
    //UIAlertController在ipad上会闪退
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];//UIAlertControllerStyleActionSheet在底部弹出来
    
    __weak typeof(self) weakSelf = self;//放在block中出现循环引用
    UIAlertAction *takePhotoAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //创建UIImagePickerController实例 UIImagePickerController控制拍照和相册
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
        imagePicker.delegate = weakSelf;
        //是否显示裁剪框编辑（默认为no），yes照片拍摄完成可以剪辑
        imagePicker.allowsEditing = YES;
        //设置照片来源为相机
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        //展示选取照片控制器
        [weakSelf presentViewController:imagePicker animated:YES completion:^{
            
        }];
    }];
    
    UIAlertAction *chooseAction = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
        imagePicker.delegate = weakSelf;
        imagePicker.allowsEditing = YES;
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [weakSelf presentViewController:imagePicker animated:YES completion:^{
            
        }];
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertController addAction:takePhotoAction];
    [alertController addAction:chooseAction];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:^{
        
    }];
}
//在回调方法中，获取返回的图片
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info{
    //选取完照片后跳转回原控制器
    [self dismissViewControllerAnimated:YES completion:nil];
    /*
     此处参数info是一个字典，下面是字典中的键值（从相机获取的图片和相册获取的图片时，两者的info值不尽相同）
     UIImagePickerControllerMediaType 媒体类型
     UIImagePickerControllerOriginalImage 原始图片
     UIImagePickerControllerEditedImage 裁剪后图片
     UIImagePickerControllerCropRect 图片裁剪区域
     UIImagePickerControllerMediaURL 媒体的URL
     UIImagePickerControllerReferenceURL 原件的URL
     UIImagePickerControllerMediaMetadata 当数据来源是相机时，此值才有效
     UIImagePickerControllerLivePhoto
     UIImagePickerControllerPHAsset
     UIImagePickerControllerImageURL
     */
    UIImage *image;
    if (picker.allowsEditing) {
        image = info[UIImagePickerControllerEditedImage];
    }else{
        image = info[UIImagePickerControllerOriginalImage];
    }
    self.imageView.image = image;
}
//取消选取调用的方法
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
