//
//  LKKViewController.m
//  LKKProgressView
//
//  Created by 李韧 on 07/15/2016.
//  Copyright (c) 2016 李韧. All rights reserved.
//

#import "LKKViewController.h"

#import "../../LKKProgressView/Classes/LKKProgressView.h"

@interface LKKViewController ()

@property (nonatomic) LKKProgressView *progressView;

@end

@implementation LKKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.progressView = [[LKKProgressView alloc] initWithFrame:CGRectMake(0, 100, 300, 40)];
    [self.view addSubview:self.progressView];
    self.progressView.backgroundColor = [UIColor redColor];
    self.progressView.indicatorColor = [UIColor yellowColor];
    self.progressView.cornerRadius = 20;
    self.progressView.animated = YES;
    self.progressView.progress = 0.6;
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)change:(id)sender {
    self.progressView.progress = (CGFloat)arc4random_uniform(100) / 100.0f;
}
@end
