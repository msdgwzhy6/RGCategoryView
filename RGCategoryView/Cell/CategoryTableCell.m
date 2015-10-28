//
//  CategoryTableCell.m
//  RGCategoryView
//
//  Created by Arvin on 15/10/28.
//  Copyright © 2015年 com.roroge. All rights reserved.
//

#import "CategoryTableCell.h"

#define RGB(R,G,B)              [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]

@interface CategoryTableCell ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineViewHeight;
@property (weak, nonatomic) IBOutlet UIView *selectView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation CategoryTableCell

- (void)awakeFromNib {
    self.lineViewHeight.constant = 0.5;
    self.selectView.hidden = YES;
}

-(void)configCellWithTitle:(NSString *)str andIndexPath:(NSIndexPath *)indexPath andSelectIndexPath:(NSIndexPath *)selectIndexPath{
    self.nameLabel.text = str;
    if (indexPath.section == selectIndexPath.section && indexPath.row == selectIndexPath.row){
        self.selectView.hidden = NO;
        self.backgroundColor = RGB(235, 235, 235);
        self.nameLabel.textColor = RGB(231, 105, 63);
    }else {
        self.selectView.hidden = YES;
        self.backgroundColor = [UIColor whiteColor];
        self.nameLabel.textColor = [UIColor blackColor];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
