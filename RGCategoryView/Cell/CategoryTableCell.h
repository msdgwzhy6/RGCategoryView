//
//  CategoryTableCell.h
//  RGCategoryView
//
//  Created by Arvin on 15/10/28.
//  Copyright © 2015年 com.roroge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryTableCell : UITableViewCell

-(void)configCellWithTitle:(NSString *)str andIndexPath:(NSIndexPath *)indexPath andSelectIndexPath:(NSIndexPath *)selectIndexPath;

@end
