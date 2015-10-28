//
//  ViewController.m
//  RGCategoryView
//
//  Created by roroge on 15/10/28.
//  Copyright © 2015年 com.roroge. All rights reserved.
//

#import "ViewController.h"
#import "CategoryTableCell.h"

#define CategoryIdentifier           @"CategoryIdentifier"
#define CollectionCell               @"CollectionCell"
#define CollectionHead               @"CollectionHead"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *categoryTable;
@property (weak, nonatomic) IBOutlet UICollectionView *contentCollection;

@property (strong, nonatomic) NSArray *categoryArray;
@property (strong, nonatomic) NSIndexPath *selectIndex;
@property (strong, nonatomic) NSArray *contentArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

-(void)setup{
    self.selectIndex = [NSIndexPath indexPathForRow:0 inSection:0];
    self.contentArray = @[@{@"image":@"11.png",@"name":@"手机"},@{@"image":@"12.png",@"name":@"手机"},@{@"image":@"13.png",@"name":@"手机"},@{@"image":@"14.png",@"name":@"手机"},@{@"image":@"15.png",@"name":@"手机"},@{@"image":@"16.png",@"name":@"手机",},@{@"image":@"11.png",@"name":@"手机"},@{@"image":@"12.png",@"name":@"手机"},@{@"image":@"13.png",@"name":@"手机"},@{@"image":@"14.png",@"name":@"手机"},@{@"image":@"15.png",@"name":@"手机"},@{@"image":@"16.png",@"name":@"手机",}];
    self.categoryArray = @[@"手机数码",@"母婴用品",@"生活需要",@"衣帽服饰",@"公司办公",@"衣食住行"];
    [self.categoryTable registerNib:[UINib nibWithNibName:@"CategoryTableCell" bundle:nil] forCellReuseIdentifier:CategoryIdentifier];
    [self.contentCollection registerNib:[UINib nibWithNibName:@"CollectionCell" bundle:nil] forCellWithReuseIdentifier:CollectionCell];
    [self.contentCollection registerNib:[UINib nibWithNibName:@"CollectionHeader" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CollectionHead];
}

#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.categoryArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CategoryTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CategoryIdentifier];
    [cell configCellWithTitle:[self.categoryArray objectAtIndex:indexPath.row] andIndexPath:indexPath andSelectIndexPath:self.selectIndex];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.selectIndex = indexPath;
    [self.categoryTable reloadData];
}

#pragma mark - UICollectionViewDelegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.contentArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionCell forIndexPath:indexPath];
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:301];
    UILabel *nameLabel = (UILabel *)[cell viewWithTag:101];
    NSDictionary *dic = [self.contentArray objectAtIndex:indexPath.row];
    imageView.image = [UIImage imageNamed:[dic objectForKey:@"image"]];
    nameLabel.text = [dic objectForKey:@"name"];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
