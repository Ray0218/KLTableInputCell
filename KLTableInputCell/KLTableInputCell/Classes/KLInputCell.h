//
//  KLInputCell.h
//  KLInputTableCell
//
//  Created by 吴孔亮 on 2018/11/22.
//  Copyright © 2018年 盘石. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KLInputModel.h"
#import  <Masonry/Masonry.h>


typedef NS_ENUM(NSUInteger, PSInputCellType) {
    PSInputCellTypeNormal, //输入框
    PSInputCellTypeArrow, //输入框-箭头
    PSInputCellTypeImageTextField, //图片，输入框
    PSInputCellTypeImageTextFieldArrow, //图片，输入框,箭头
    
    PSInputCellTypeTitleTextFieldArrow, //标题，输入框,箭头
    
    
};

NS_ASSUME_NONNULL_BEGIN

@interface KLInputCell : UITableViewCell
@property (nonatomic, strong,readonly) UITextField*rTextField  ;
@property (nonatomic, strong,readonly) UIButton *rRightArrow  ;

@property (nonatomic ,strong) KLInputModel *rCellModel ;

-(instancetype)initWithCellType:(PSInputCellType)type reuseIdentifier:(NSString *)reuseIdentifier  ;

 
-(instancetype)initWithCellType:(PSInputCellType)type reuseIdentifier:(NSString *)reuseIdentifier hasLine:(BOOL)hasLine  ;

@end

NS_ASSUME_NONNULL_END


#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0x00FF0000) >> 16)) / 255.0     green:((float)((rgbValue & 0x0000FF00) >>  8)) / 255.0 blue:((float)((rgbValue & 0x000000FF) >>  0)) / 255.0 alpha:1.0]

/************************ 屏幕尺寸宏定义 ************************/
//设备屏幕宽度(320)
#define SCREEN_WIDTH   CGRectGetWidth([[UIScreen mainScreen] bounds])
//设备屏幕高度(480/568)
#define SCREEN_HEIGHT  CGRectGetHeight([[UIScreen mainScreen] bounds])

#define kLineColor UIColorFromRGB(0xEEEEEE)
