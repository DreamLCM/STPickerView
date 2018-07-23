//
//  STPickerHSArea.m
//  STPickerDemo
//
//  Created by CM on 2018/7/21.
//  Copyright © 2018年 ST. All rights reserved.
//

#import "STPickerHSArea.h"

@interface STPickerHSArea()<UIPickerViewDataSource, UIPickerViewDelegate>



/** 3.城市 */
@property (nonatomic, strong, nullable)NSString *city;
/** 4.地区 */
@property (nonatomic, strong, nullable)NSString *area;

@property (nonatomic, assign)NSInteger rowCity;
@property (nonatomic, assign)NSInteger rowArea;


@end

@implementation STPickerHSArea

#pragma mark - --- init 视图初始化 ---

- (void)setupUI
{
 
    
    self.arrayCity = @[@"全部"];
    self.arrayArea = @[@"全部"];

    self.city = _arrayCity.firstObject;
    self.area = _arrayArea.firstObject;
    self.rowCity = 0;
    self.rowArea = 0;
    
    // 2.设置视图的默认属性
    _heightPickerComponent = 32;
    [self setTitle:@"请选择城市地区"];
    [self.pickerView setDelegate:self];
    [self.pickerView setDataSource:self];
    
}
#pragma mark - --- delegate 视图委托 ---

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return self.arrayCity.count;
    }else{
        return self.arrayArea.count;
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return self.heightPickerComponent;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    
    
    if (component == 0) {
        
        //        switch (row) {
        //            case 0:
        //                self.arrayArea = @[@"全部"];
        //                [self.delegate pickerHSArea:self row:row];
        //                [self.pickerView reloadAllComponents];
        //                break;
        //            case 1:
        //                self.arrayArea = @[@"城区",@"小榄",@"火炬开发区",@"坦洲"];
        //                [self.delegate pickerHSArea:self row:row];
        //                [self.pickerView reloadAllComponents];
        //                break;
        //            case 2:
        //                self.arrayArea = @[@"伦教",@"北滘",@"南海",@"官窑"];
        //                [self.delegate pickerHSArea:self row:row];
        //                [self.pickerView reloadAllComponents];
        //                break;
        //
        //            default:
        //                break;
        //        }
        
        [self.delegate pickerHSArea:self row:row];
        self.city = self.arrayCity[row];
        self.rowCity = row;
        self.area = self.arrayArea.firstObject;
        [self.pickerView selectRow:0 inComponent:1 animated:YES];
        [self reloadData];
        [self.pickerView reloadAllComponents];
        
    } else {
        
        self.area = self.arrayArea[row];
        self.rowArea = row;
        [self reloadData];
        
    }

    
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view
{
    
    //设置分割线的颜色
    [pickerView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.frame.size.height <=1) {
            obj.backgroundColor = self.borderButtonColor;
        }
    }];
    
    
    NSString *text;
    if (component == 0) {
        text =  self.arrayCity[row];
    }else {
        text =  self.arrayArea[row];
    }
    
    UILabel *label = [[UILabel alloc]init];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setFont:[UIFont systemFontOfSize:17]];
    [label setText:text];
    return label;
}
#pragma mark - --- event response 事件相应 ---

- (void)selectedOk
{
    
    if ([self.delegate respondsToSelector:@selector(pickerArea:city:area:)]) {
        [self.delegate pickerArea:self city:self.city area:self.area rowArea:self.rowArea rowCity:self.rowCity];
    }
    
    NSLog(@"%@",[NSString stringWithFormat:@"%@ %@ %ld %ld", self.city, self.area, self.rowCity, self.rowArea]);
    
    [super selectedOk];
}

#pragma mark - --- private methods 私有方法 ---

- (void)reloadData
{

    NSString *title = [NSString stringWithFormat:@"%@ %@", self.city, self.area];
    [self setTitle:title];
    
}

#pragma mark - --- setters 属性 ---


- (void)setArrayArea:(NSMutableArray<NSString *> *)arrayArea
{
    _arrayArea = arrayArea;
    [self.pickerView reloadAllComponents];
}

- (void)setArrayCity:(NSMutableArray<NSString *> *)arrayCity
{
    _arrayCity = arrayCity;
    [self.pickerView reloadAllComponents];
}



#pragma mark - --- getters 属性 ---



//- (NSMutableArray *)arrayCity
//{
//    if (!_arrayCity) {
//        _arrayCity = @[].mutableCopy;
//    }
//    return _arrayCity;
//}
//
//- (NSMutableArray *)arrayArea
//{
//    if (!_arrayArea) {
//        _arrayArea = @[].mutableCopy;
//    }
//    return _arrayArea;
//}

@end



