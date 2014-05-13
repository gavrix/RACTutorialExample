//
//  SRGViewController.m
//  RACTutorialExample
//
//  Created by Sergey Gavrilyuk on 5/12/14.
//  Copyright (c) 2014 Sergey Gavrilyuk. All rights reserved.
//

#import "SRGViewController.h"
#import "SRGViewModel.h"
#import "SRGTableViewCell.h"

#import <ReactiveCocoa/ReactiveCocoa.h>
#import <libextobjc/EXTScope.h>

@interface SRGViewController ()
@property (nonatomic) SRGViewModel *viewModel;
@end

@implementation SRGViewController

- (void)awakeFromNib {
	@weakify(self)
	self.viewModel = [[SRGViewModel alloc] init];
	[[RACObserve(self, viewModel.users) ignore:nil] subscribeNext : ^(id x) {
	    @strongify(self)
	    [self.tableView reloadData];
	}];
}

- (void)viewDidLoad {
	[super viewDidLoad];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.viewModel.users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	SRGTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
	
	cell.viewModel.userModel = self.viewModel.users[indexPath.row];
	
	return cell;
}

@end
