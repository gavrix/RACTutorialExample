//
//  SRGViewModel.m
//  RACTutorialExample
//
//  Created by Sergey Gavrilyuk on 5/12/14.
//  Copyright (c) 2014 Sergey Gavrilyuk. All rights reserved.
//

#import "SRGViewModel.h"

#import <ReactiveCocoa/ReactiveCocoa.h>
#import <libextobjc/EXTScope.h>

@interface SRGViewModel ()
@property (nonatomic) NSArray *users;
@end

@implementation SRGViewModel
- (instancetype)init {
	self = [super init];
	if (self) {
		RAC(self, users) = [[[NSURLConnection rac_sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://api.github.com/users"]]]
		                    map: ^id (RACTuple *value) {
		    NSData *data = value.second;
		    NSError *error = nil;
		    NSArray *array = [NSJSONSerialization JSONObjectWithData:data
		                                                     options:0
		                                                       error:&error];
		    return array;
		}] deliverOn:RACScheduler.mainThreadScheduler];
	}
	return self;
}

@end
