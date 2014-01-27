//
//  XYZViewController.m
//  iOS7ProgressViewTutorial
//
//  Created by Joe Selvik on 1/27/14.
//  Copyright (c) 2014 Joe Selvik. All rights reserved.
//

#import "XYZViewController.h"

@interface XYZViewController ()

@property (nonatomic, strong) UIProgressView *progressView;
@property (nonatomic, strong) NSTimer *myTimer;
@property (nonatomic, strong) IBOutlet UILabel *progressLabel;

@end

@implementation XYZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    
    self.progressView.center = self.view.center;
    [self.view addSubview:self.progressView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startCount:(id)sender {
    self.myTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateUI:) userInfo:nil repeats:YES];
}

- (void)updateUI:(NSTimer *)timer
{
    static int count = 0;
    count++;
    
    if (count <=10) {
        self.progressLabel.text = [NSString stringWithFormat:@"%d %%",count*10];
        self.progressView.progress = (float)count/10.0f;
    } else {
        [self.myTimer invalidate];
        self.myTimer = nil;
    } 
}

@end
