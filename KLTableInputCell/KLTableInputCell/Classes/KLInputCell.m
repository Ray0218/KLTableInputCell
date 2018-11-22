//
//  KLInputCell.m
//  KLInputTableCell
//
//  Created by 吴孔亮 on 2018/11/22.
//  Copyright © 2018年 盘石. All rights reserved.
//

#import "KLInputCell.h"
#import "NSObject+Factory.h"
 
@interface PSTextField:UITextField
@end

@implementation PSTextField

-(BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    
    UIMenuController*menuController = [UIMenuController sharedMenuController];
    
    if(menuController) {
        
        [UIMenuController sharedMenuController].menuVisible=NO;
        
    }
    
    return NO;
    
}

@end



@interface KLInputCell (){
    UIView *_codelLine ;
}

@property (nonatomic, assign) PSInputCellType rCellType  ;

@property (nonatomic, strong) UILabel *rTitleLabel  ;

@property (nonatomic, strong) UIImageView *rLeftImage  ;


@property (nonatomic, strong) UITextField*rTextField  ;

@property (nonatomic, strong) UIButton *rRightArrow  ;

@property (nonatomic, assign) BOOL rHasBottomLine  ;

@property (nonatomic, strong) UIView *rLineView  ;

@end


@implementation KLInputCell

-(instancetype)initWithCellType:(PSInputCellType)type reuseIdentifier:(NSString *)reuseIdentifier {
    
    
    return  [self initWithCellType:type reuseIdentifier:reuseIdentifier hasLine:NO];
}

-(instancetype)initWithCellType:(PSInputCellType)type reuseIdentifier:(NSString *)reuseIdentifier hasLine:(BOOL)hasLine {
    
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier] ;
    
    if(self){
        
        _rHasBottomLine = hasLine;
        _rCellType = type ;
        
        self.selectionStyle = UITableViewCellSelectionStyleNone ;
        [self buildSubViewsUI];
    }
    
    return  self;
}

-(void)setRCellModel:(KLInputModel *)rCellModel {
    _rCellModel = rCellModel ;
    
    self.rTextField.secureTextEntry = rCellModel.rSecEntry ;
    self.rTextField.keyboardType = rCellModel.rKeyBoardType ;
    
    self.rTextField.text = rCellModel.rTFTitle ;
    self.rTextField.placeholder = rCellModel.rTFPlaceholder ;
    
    if (self.rCellType ==  PSInputCellTypeImageTextField || self.rCellType == PSInputCellTypeImageTextFieldArrow) {
        
        self.rLeftImage.image =[ UIImage imageNamed:rCellModel.rImageName] ;
    }
    
    if (self.rCellType == PSInputCellTypeTitleTextFieldArrow) {
        self.rTitleLabel.text = rCellModel.rTitle ;
    }
}



-(void)buildSubViewsUI {
    
    
    if (self.rCellType == PSInputCellTypeArrow) {
        
        [self.contentView addSubview:self.rRightArrow];
        [self.rRightArrow setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        
        [self.contentView addSubview:self.rTextField];
        self.rTextField.enabled = NO ;
        
        [self.rRightArrow mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-15) ;
            make.centerY.equalTo(self.contentView) ;
            make.width.mas_equalTo(14);
        }];
        
        [self.rTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.contentView).offset(15) ;
            make.centerY.equalTo(self.contentView) ;
            make.right.equalTo(self.contentView).offset(-40) ;
            make.height.equalTo(self.contentView);
            
            
        }] ;
        
        
    }else if (self.rCellType == PSInputCellTypeTitleTextFieldArrow){
        [self.contentView addSubview:self.rTitleLabel];
        [self.contentView addSubview:self.rRightArrow];
        [self.rRightArrow setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        
        [self.contentView addSubview:self.rTextField];
        self.rTextField.enabled = NO ;
        
        [self.rTitleLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [self.rTitleLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [self.rTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.contentView).offset(15);
        }];
        
        [self.rRightArrow mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-15) ;
            make.centerY.equalTo(self.contentView) ;
            make.width.mas_equalTo(14);
        }];
        
        [self.rTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.rTitleLabel.mas_right).offset(10) ;
            make.centerY.equalTo(self.contentView) ;
            make.right.equalTo(self.contentView).offset(-40) ;
            make.height.equalTo(self.contentView);
            
        }] ;
        
    }else if (self.rCellType == PSInputCellTypeImageTextField ){
        
        [self.contentView addSubview:self.rLeftImage];
        [self.contentView addSubview:self.rTextField];
        [self.contentView addSubview:self.rRightArrow];
        
        [self.rLeftImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.contentView).offset(15);
            make.width.height.mas_equalTo(20);
        }];
        
        
        [self.rTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.rLeftImage.mas_right).offset(10) ;
            make.centerY.equalTo(self.contentView) ;
            make.right.equalTo(self.contentView).offset(-15) ;
            make.height.equalTo(self.contentView);
            
        }] ;
        
    }else if (self.rCellType == PSInputCellTypeImageTextFieldArrow){
        self.rTextField.enabled = NO ;
        
        [self.contentView addSubview:self.rLeftImage];
        [self.contentView addSubview:self.rTextField];
        [self.contentView addSubview:self.rRightArrow];
        [self.rLeftImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.contentView).offset(15);
            make.width.height.mas_equalTo(20);
        }];
        
        
        [self.rRightArrow mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-15) ;
            make.centerY.equalTo(self.contentView) ;
            make.width.mas_equalTo(14);
        }];
        
        [self.rTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.rLeftImage.mas_right).offset(10) ;
            make.centerY.equalTo(self.contentView) ;
            make.right.equalTo(self.contentView).offset(-40) ;
            make.height.equalTo(self.contentView);
            
        }] ;
        
    }  else{
        [self.contentView addSubview:self.rTextField];
        
        [self.rTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15) ;
            make.centerY.equalTo(self.contentView) ;
            make.right.equalTo(self.contentView).offset(-15)  ;
            make.height.equalTo(self.contentView);
            
        }] ;
    }
    
    if (self.rHasBottomLine) {
        [self.contentView addSubview:self.rLineView];
        [self.rLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.bottom.equalTo(self.contentView);
            make.height.mas_equalTo(1);
            make.width.mas_equalTo(SCREEN_WIDTH-30);
        }];
    }
}


#pragma mark- gtter -


-(UILabel*)rTitleLabel {
    
    if (_rTitleLabel == nil) {
        _rTitleLabel = [self ps_createLabelWithTitle:@"" font:[UIFont systemFontOfSize:14] textColor:UIColorFromRGB(0x1B7CFE)] ;
    }
    
    return _rTitleLabel ;
}
-(UIImageView*)rLeftImage {
    
    if (!_rLeftImage) {
        _rLeftImage = [[UIImageView alloc]init];
        _rLeftImage.backgroundColor = [UIColor clearColor] ;
        _rLeftImage.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _rLeftImage ;
}


-(UITextField*)rTextField {
    if (_rTextField == nil) {
        _rTextField = [[PSTextField alloc]init];
        _rTextField.backgroundColor =[ UIColor clearColor] ;
        _rTextField.font = [UIFont systemFontOfSize:14] ;
        _rTextField.textColor = UIColorFromRGB(0x8D8D8D)  ;
        _rTextField.autocapitalizationType = UITextAutocapitalizationTypeNone ;
//        @weakify(self)
//       
//        
//        [_rTextField.rac_textSignal subscribeNext:^(NSString* x) {
//            @strongify(self)
//            self.rCellModel.rTFTitle = x ;
//        }] ;
//        
        
        
        
    }
    return _rTextField ;
}

-(UIButton*)rRightArrow {
    if (_rRightArrow == nil) {
        _rRightArrow = [UIButton buttonWithType:UIButtonTypeCustom] ;
        _rRightArrow.titleLabel.font = [UIFont systemFontOfSize:13] ;
        _rRightArrow.backgroundColor = [UIColor clearColor] ;
        _rRightArrow.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        [_rRightArrow setImage:[UIImage imageNamed:@"icon_NEXT"] forState:UIControlStateNormal];
        [_rRightArrow setImage:[UIImage imageNamed:@"icon_NEXT"] forState:UIControlStateDisabled];
        
    }
    
    return _rRightArrow ;
}

-(UIView*)rLineView {
    if (!_rLineView) {
        _rLineView = [UIView new] ;
        _rLineView.backgroundColor = kLineColor;
    }
    return _rLineView;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
