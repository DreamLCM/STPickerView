//
//  STPickerHSArea.h
//  STPickerDemo
//
//  Created by CM on 2018/7/21.
//  Copyright © 2018年 ST. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STPickerView.h"

NS_ASSUME_NONNULL_BEGIN
@class STPickerHSArea;
@protocol  STPickerHSAreaDelegate<NSObject>

- (void)pickerArea:(STPickerHSArea *)pickerArea city:(NSString *)city area:(NSString *)area;

- (void)pickerHSArea:(STPickerHSArea *)pickerHSArea row:(NSInteger)row;

@end
@interface STPickerHSArea : STPickerView
/** 1.中间选择框的高度，default is 32*/
@property(nonatomic, assign)CGFloat heightPickerComponent;
/** 2.当前城市数组 */
@property (nonatomic, strong)NSMutableArray<NSString *> *arrayCity;
/** 3.当前地区数组 */
@property (nonatomic, strong)NSMutableArray<NSString *> *arrayArea;


@property(nonatomic, weak)id <STPickerHSAreaDelegate>delegate;

@end
NS_ASSUME_NONNULL_END

