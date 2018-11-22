//
//  KLInputModel.h
//  KLInputTableCell
//
//  Created by 吴孔亮 on 2018/11/22.
//  Copyright © 2018年 盘石. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KLInputModel : NSObject

@property (nonatomic,strong) NSString *rTitle ; //标题文字
@property (nonatomic,strong) NSString *rTFTitle ; //输入框文字
@property (nonatomic,strong) NSString *rTFPlaceholder ; //输入框默认文字


//@property (nonatomic,strong) NSString *rAlterString ; //

@property (nonatomic,strong) NSString *rSelectOptionValue ; //选中的value

@property (nonatomic,assign) UIKeyboardType rKeyBoardType ; //输入框类型

@property (nonatomic ,strong) NSArray *rPickerArray ;



@property (nonatomic,strong) NSString *rImageName ; // 图片名

@property (nonatomic,strong) UIImage *rSelectImage ; // 图片


@property(nonatomic ,copy) NSString *rSelectImageUrl ; //图片地址

@property (nonatomic,assign) BOOL rSecEntry ; //密文输入


- (instancetype)initWithFieldText:(NSString*)text placeHolder:(NSString*)place   ;

- (instancetype)initWithFieldText:(NSString*)text placeHolder:(NSString*)place keyType:(UIKeyboardType)type ;

- (instancetype)initWithFieldText:(NSString*)text placeHolder:(NSString*)place keyType:(UIKeyboardType)type image:(NSString*)imageName;

- (instancetype)initWithFieldText:(NSString*)text placeHolder:(NSString*)place   image:(NSString*)imageName;

- (instancetype)initWithTitle:(NSString*)text placeHolder:(NSString*)place  image:(NSString*)imageName desc:(NSString*)desc;



- (instancetype)initWithTitle:(NSString*)title fieldText:(NSString*)text placeHolder:(NSString*)place ;


- (instancetype)initWithTitle:(NSString*)title fieldText:(NSString*)text placeHolder:(NSString*)place keyType:(UIKeyboardType)type ;

- (instancetype)initWithTitle:(NSString*)title fieldText:(NSString*)text placeHolder:(NSString*)place keyType:(UIKeyboardType)type sec:(BOOL)isSec ;


- (instancetype)initWithTitle:(NSString*)title fieldText:(NSString*)text placeHolder:(NSString*)place  pickerArr:(NSArray*)pickerArr;


@end

NS_ASSUME_NONNULL_END
