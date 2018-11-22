//
//  NSObject+Factory.m
//  KLInputTableCell
//
//  Created by 吴孔亮 on 2018/11/22.
//  Copyright © 2018年 盘石. All rights reserved.
//

#import "NSObject+Factory.h"

@implementation NSObject (Factory)

-(UILabel*)ps_createLabelWithTitle:(NSString*)title font:(UIFont*)font textColor:(UIColor*)textColor {
    
    return [self ps_createLabelWithTitle:title font:font textColor:textColor align:NSTextAlignmentLeft]; ;
}

-(UILabel*)ps_createLabelWithTitle:(NSString*)title font:(UIFont*)font textColor:(UIColor*)textColor align:(NSTextAlignment)align{
    UILabel*label = [[UILabel alloc]init];
    label.text = title ;
    label.font = font ;
    label.textColor = textColor ;
    label.textAlignment = align;
    return label ;
}

-(UIButton*)ps_createButtonWithTitle:(NSString*)title font:(UIFont*)font color:(UIColor*)color{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom] ;
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    button.titleLabel.font = font;
    
    return button ;
}


- (void)ps_changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space {
    
    NSString *labelText = label.text;
    
    if (labelText.length <= 0) {
        return ;
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}
@end
