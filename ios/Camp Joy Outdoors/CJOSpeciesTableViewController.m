//
//  CJOSpeciesTableViewController.m
//  Camp Joy Outdoors
//
//  Created by Brian Telintelo on 10/19/13.
//  Copyright (c) 2013 Camp Joy. All rights reserved.
//

#import "CJOSpeciesTableViewController.h"
#import "CJOTree.h"
#import "CJOTreeInfoViewController.h"
#import "CJOImageLabelTableViewCell.h"

@interface CJOSpeciesTableViewController ()

@end

@implementation CJOSpeciesTableViewController

-(void)viewDidLoad
{
    
}

#pragma mark - TableView Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[CJOModel trees] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CJOImageLabelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tree" forIndexPath:indexPath];
    
    [self configureCell:cell atIndexPath:indexPath];

    return cell;
}

- (void)configureCell:(CJOImageLabelTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    CJOTree *tree = [[CJOModel trees] objectAtIndex:indexPath.row];
    cell.nameLabel.text = tree.name;
    NSString * imageName = [NSString stringWithFormat:@"thumb/%@_thumb.jpg", tree.id];
    cell.treeThumb.contentMode = UIViewContentModeScaleAspectFit;
    UIImage *img = [UIImage imageNamed:imageName];
    cell.treeThumb.image = img;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CJOTree *tree;
    tree = [[CJOModel trees] objectAtIndex:indexPath.row];
    
    CJOTreeInfoViewController *treeInfo = [[UIStoryboard storyboardWithName:@"Identify_iPhone" bundle:nil] instantiateViewControllerWithIdentifier:@"TreeInfoViewController"];
    treeInfo.tree = tree;
    [self.navigationController pushViewController:treeInfo animated:YES];
}


@end
