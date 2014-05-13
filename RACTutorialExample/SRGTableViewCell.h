//
//  SRGTableViewCell.h
//  RACTutorialExample
//
//  Created by Sergey Gavrilyuk on 5/12/14.
//  Copyright (c) 2014 Sergey Gavrilyuk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SRGCellViewModel.h"

@interface SRGTableViewCell : UITableViewCell
@property (nonatomic, readonly) SRGCellViewModel *viewModel;
@end
