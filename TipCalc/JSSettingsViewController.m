//
//  JSSettingsViewController.m
//  TipCalc
//
//  Created by Jagtej Sodhi on 9/13/15.
//  Copyright (c) 2015 Jagtej Sodhi. All rights reserved.
//

#import "JSSettingsViewController.h"

@interface JSSettingsViewController ()
@property (weak, nonatomic) IBOutlet UISlider *tipSlider;
@property (weak, nonatomic) IBOutlet UILabel *tipSliderValue;

- (IBAction)sliderValueChanged:(id)sender;

@end

@implementation JSSettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int tipDefaultValue = [defaults integerForKey:@"userTip"];

    if (tipDefaultValue != 0) {
        [self.tipSlider setValue:tipDefaultValue];
        self.tipSliderValue.text = [NSString stringWithFormat:@"%d%%", tipDefaultValue];
    }
    
    NSLog(@"Tip default value: %d", tipDefaultValue);
}

- (IBAction)sliderValueChanged:(id)sender {
    float sliderVal = self.tipSlider.value;
    int sliderValInt = sliderVal;
    
    self.tipSliderValue.text = [NSString stringWithFormat:@"%d%%", sliderValInt];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:sliderValInt forKey:@"userTip"];
    [userDefaults synchronize];
}
@end
