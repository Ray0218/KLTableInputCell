//
//  KLInputModel.m
//  KLInputTableCell
//
//  Created by 吴孔亮 on 2018/11/22.
//  Copyright © 2018年 盘石. All rights reserved.
//

#import "KLInputModel.h"



@implementation KLInputModel
- (instancetype)initWithFieldText:(NSString*)text placeHolder:(NSString*)place
{
    self = [super init];
    if (self) {
        
        _rTFTitle =text ;
        _rTFPlaceholder = place ;
        _rKeyBoardType = UIKeyboardTypeDefault ;
        
    }
    return self;
}
- (instancetype)initWithFieldText:(NSString*)text placeHolder:(NSString*)place image:(NSString*)imageName
{
    self = [super init];
    if (self) {
        
        _rTFTitle =text ;
        _rTFPlaceholder = place ;
        _rKeyBoardType = UIKeyboardTypeDefault ;
        _rImageName = imageName;
        
    }
    return self;
}

- (instancetype)initWithFieldText:(NSString*)text placeHolder:(NSString*)place keyType:(UIKeyboardType)type image:(NSString*)imageName
{
    self = [super init];
    if (self) {
        
        _rTFTitle =text ;
        _rTFPlaceholder = place ;
        _rKeyBoardType = type ;
        _rImageName = imageName;
        
        
    }
    return self;
}



- (instancetype)initWithFieldText:(NSString*)text placeHolder:(NSString*)place keyType:(UIKeyboardType)type
{
    self = [super init];
    if (self) {
        
        _rTFTitle =text ;
        _rTFPlaceholder = place ;
        _rKeyBoardType = type ;
        
    }
    return self;
}

- (instancetype)initWithTitle:(NSString*)title fieldText:(NSString*)text placeHolder:(NSString*)place
{
    self = [super init];
    if (self) {
        
        _rTitle = title ;
        _rTFTitle =text ;
        _rTFPlaceholder = place ;
        _rSecEntry = NO ;
        
    }
    return self;
}


- (instancetype)initWithTitle:(NSString*)title fieldText:(NSString*)text placeHolder:(NSString*)place keyType:(UIKeyboardType)type {
    
    self = [super init];
    if (self) {
        
        _rTitle = title ;
        _rTFTitle =text ;
        _rTFPlaceholder = place ;
        _rKeyBoardType = type ;
        _rSecEntry = NO ;
        
    }
    return self;
    
}

- (instancetype)initWithTitle:(NSString*)title fieldText:(NSString*)text placeHolder:(NSString*)place keyType:(UIKeyboardType)type sec:(BOOL)isSec{
    
    self = [super init];
    if (self) {
        
        _rTitle = title ;
        _rTFTitle =text ;
        _rTFPlaceholder = place ;
        _rKeyBoardType = type ;
        _rSecEntry = isSec ;
        
    }
    return self;
    
}

- (instancetype)initWithTitle:(NSString*)title fieldText:(NSString*)text placeHolder:(NSString*)place  pickerArr:(NSArray*)pickerArr{
    
    
    self = [super init];
    if (self) {
        
        self.rTitle = title ;
        self.rTFTitle =text ;
        self.rTFPlaceholder = place ;
        
        self.rPickerArray = [NSArray arrayWithArray:pickerArr] ;
    }
    return self;
    
}


- (instancetype)initWithTitle:(NSString*)text placeHolder:(NSString*)place   image:(NSString*)imageName desc:(NSString*)desc{
    
    self = [super init];
    if (self) {
        
        _rTFPlaceholder = place ;
        _rImageName = imageName;
        _rTitle = desc ;
    }
    return self;
}


@end
