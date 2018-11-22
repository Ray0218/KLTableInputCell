//
//  NSObject+Factory.h
//  KLInputTableCell
//
//  Created by 吴孔亮 on 2018/11/22.
//  Copyright © 2018年 盘石. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Factory)


-(UILabel*)ps_createLabelWithTitle:(NSString*)title font:(UIFont*)font textColor:(UIColor*)textColor;

-(UILabel*)ps_createLabelWithTitle:(NSString*)title font:(UIFont*)font textColor:(UIColor*)textColor align:(NSTextAlignment)align;

-(UIButton*)ps_createButtonWithTitle:(NSString*)title font:(UIFont*)font color:(UIColor*)color;


- (void)ps_changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space ;
@end

NS_ASSUME_NONNULL_END
