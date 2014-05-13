//
//  SRGTableViewCell.m
//  RACTutorialExample
//
//  Created by Sergey Gavrilyuk on 5/12/14.
//  Copyright (c) 2014 Sergey Gavrilyuk. All rights reserved.
//

#import "SRGTableViewCell.h"

#import <ReactiveCocoa/ReactiveCocoa.h>
#import <libextobjc/EXTScope.h>

@interface SRGTableViewCell ()
@property (nonatomic) SRGCellViewModel *viewModel;
@property (strong, nonatomic) IBOutlet UILabel *usernameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *userpicImageView;

@end

@implementation SRGTableViewCell


- (void)awakeFromNib {
	self.viewModel = [SRGCellViewModel new];
	RAC(self, userpicImageView.image) = RACObserve(self, viewModel.image);
	RAC(self, usernameLabel.text) = RACObserve(self, viewModel.username);
}

@end
