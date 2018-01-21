//
//  ViewControllerSettings.m
//  Labb-1
//
//  Created by Victoria Grönqvist on 2018-01-17.
//  Copyright © 2018 Victoria Grönqvist. All rights reserved.
//

#import "ViewControllerSettings.h"
#import "ViewControllerMenu.h"

static BOOL changedColor;
UIViewController *backgroundSavedColor;
UIViewController *textSavedColor;


@interface ViewControllerSettings ()
@property (weak, nonatomic) IBOutlet UIView *backgroundDisplay;
@property (weak, nonatomic) IBOutlet UISlider *backgroundRedAmount;
@property (weak, nonatomic) IBOutlet UISlider *backgroundGreenAmount;
@property (weak, nonatomic) IBOutlet UISlider *backgroundBlueAmount;

@property (weak, nonatomic) IBOutlet UIView *textColorDisplay;
@property (weak, nonatomic) IBOutlet UISlider *textRedAmount;
@property (weak, nonatomic) IBOutlet UISlider *textGreenAmount;
@property (weak, nonatomic) IBOutlet UISlider *textBlueAmount;


@property (weak, nonatomic) IBOutlet UILabel *backgroundColorLabel;
@property (weak, nonatomic) IBOutlet UILabel *textColorLabel;
@property (weak, nonatomic) IBOutlet UILabel *redBackgroundLabel;
@property (weak, nonatomic) IBOutlet UILabel *greenBackgroundLabel;
@property (weak, nonatomic) IBOutlet UILabel *blueBackgroundLabel;
@property (weak, nonatomic) IBOutlet UILabel *redTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *greenTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *blueTextLabel;


@end

@implementation ViewControllerSettings

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBorder];
    
    if (self.settingsChangedColor) {
            [ViewControllerSettings sendBackgroundColor:self.redBackgroundValueS andGreen:self.greenBackgroundValueS andBlue:self.blueBackgroundValueS andBackground:self.view];
    } else {
        [self refresh];
    }
}

//Updates the color to the value of the slider
- (IBAction)sliderChanged:(id)sender {
    [self refresh];
}

//Changes the color in the square
- (void)refresh {
    self.backgroundDisplay.backgroundColor = [self currentColor];
    self.textColorDisplay.backgroundColor = [self currentTextColor];
}

//Returns current background color
- (UIColor*) currentColor {
    return [UIColor colorWithRed:self.backgroundRedAmount.value
                           green:self.backgroundGreenAmount.value
                            blue:self.backgroundBlueAmount.value
                           alpha:1.0f];
}

//Returns current text color
- (UIColor*) currentTextColor {
    return [UIColor colorWithRed:self.textRedAmount.value
                           green:self.textGreenAmount.value
                            blue:self.textBlueAmount.value
                           alpha:1.0f];
}


//When pressing saving button, the background and the text sets
- (IBAction)saveButton:(id)sender {
    [self setBackgroundColor];
    [self setTextColor];
}

//Sets background color
- (void)setBackgroundColor {
    self.view.backgroundColor = [self currentColor];
}

//Sets textcolor
- (void)setTextColor {
    
    //self.view.tintColor = [self currentTextColor];
    
    self.backgroundColorLabel.textColor = [self currentTextColor];
    self.textColorLabel.textColor = [self currentTextColor];
    self.redBackgroundLabel.textColor = [self currentTextColor];
    self.greenBackgroundLabel.textColor = [self currentTextColor];
    self.blueBackgroundLabel.textColor = [self currentTextColor];
    self.redTextLabel.textColor = [self currentTextColor];
    self.greenTextLabel.textColor = [self currentTextColor];
    self.blueTextLabel.textColor = [self currentTextColor];
    
     
}

//Sets boarder
- (void)setBorder {
    self.backgroundDisplay.layer.borderColor = [UIColor blackColor].CGColor;
    self.backgroundDisplay.layer.borderWidth = 1.5f;
    self.textColorDisplay.layer.borderColor = [UIColor blackColor].CGColor;
    self.textColorDisplay.layer.borderWidth = 1.5f;
}

+ (void)sendBackgroundColor:(float)redColor andGreen:(float)greenColor andBlue:(float)blueColor andBackground:(UIView*)background {
    background.backgroundColor = [UIColor colorWithRed:redColor green:greenColor blue:blueColor alpha:1.0f];
}

/*
+ (void)sendTextColor:(float)redColor andGreen:(float)greenColor andBlue:(float)blueColor andText:(UIColor *)tintColor {
    UIView *tint;
    tint.tintColor = [UIColor colorWithRed:redColor green:greenColor blue:blueColor alpha:1.0f];
}
 */

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
        ViewControllerMenu *valuesViewControllerMenu = [segue destinationViewController];
        valuesViewControllerMenu.redBackgroundValueM = self.backgroundRedAmount.value;
        valuesViewControllerMenu.greenBackgroundValueM = self.backgroundGreenAmount.value;
        valuesViewControllerMenu.blueBackgroundValueM = self.backgroundBlueAmount.value;
        
        /*
        valuesViewControllerMenu.redTextValueM = self.textRedAmount.value;
        valuesViewControllerMenu.greenTextValueM = self.textGreenAmount.value;
        valuesViewControllerMenu.blueTextValueM = self.textBlueAmount.value;
        */
        
        [ViewControllerMenu isChangedColor];
            NSLog(@"segue settings: isChangedValue: %d", changedColor);
}


@end
