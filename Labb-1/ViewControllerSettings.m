//
//  ViewControllerSettings.m
//  Labb-1
//
//  Created by Victoria Grönqvist on 2018-01-17.
//  Copyright © 2018 Victoria Grönqvist. All rights reserved.
//

#import "ViewControllerSettings.h"

static BOOL changedColor;

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
NSSet *allLabelText;
UIViewController *backgroundSavedColor;
UIViewController *textSavedColor;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refresh];
    [self setBorder];
    
}

//Uppdaterar färg när slider rör sig (pga sätter färg på rutan via sliders)
- (IBAction)sliderChanged:(id)sender {
    [self refresh];
}

//Ändrar färgen i rutan när man drar i sliders
- (void)refresh {
    self.backgroundDisplay.backgroundColor = [self currentColor];
    self.textColorDisplay.backgroundColor = [self currentTextColor];
}


//Sätter aktuella färgen
- (UIColor*) currentColor {
    return [UIColor colorWithRed:self.backgroundRedAmount.value
                           green:self.backgroundGreenAmount.value
                            blue:self.backgroundBlueAmount.value
                           alpha:1.0f];
}
//Sätter aktuella färgen på textbakgrund
- (UIColor*) currentTextColor {
    return [UIColor colorWithRed:self.textRedAmount.value
                           green:self.textGreenAmount.value
                            blue:self.textBlueAmount.value
                           alpha:1.0f];
}

//When pressing saving button
- (IBAction)saveButton:(id)sender {
    [self setBackgroundColor];
    [self setTextColor];
}

//Sets background color
-(void)setBackgroundColor {
    self.view.backgroundColor = [self currentColor];
}

//Set boarder
-(void)setBorder {
    self.backgroundDisplay.layer.borderColor = [UIColor blackColor].CGColor;
    self.backgroundDisplay.layer.borderWidth = 1.5f;
    self.textColorDisplay.layer.borderColor = [UIColor blackColor].CGColor;
    self.textColorDisplay.layer.borderWidth = 1.5f;
}

//Sets textcolor
-(void)setTextColor {
    //[self textInOne];
    //for(id tempObject in allLabelText) {
        //UILabel *label = [allLabelText replacementObjectForKeyedArchiver:tempObject];
        //self.label.textColor = [self currentTextColor];
    
    self.backgroundColorLabel.textColor = [self currentTextColor];
    self.textColorLabel.textColor = [self currentTextColor];
    self.redBackgroundLabel.textColor = [self currentTextColor];
    self.greenBackgroundLabel.textColor = [self currentTextColor];
    self.blueBackgroundLabel.textColor = [self currentTextColor];
    self.redTextLabel.textColor = [self currentTextColor];
    self.greenTextLabel.textColor = [self currentTextColor];
    self.blueTextLabel.textColor = [self currentTextColor];
    //}
}

//Put text together
-(NSSet*)textInOne {
    NSSet *allLabelText = [NSSet setWithObjects:self.backgroundColorLabel,
                           self.textColorLabel,
                           self.redBackgroundLabel,
                           self.greenBackgroundLabel,
                           self.blueBackgroundLabel,
                           self.redTextLabel,
                           self.greenTextLabel,
                           self.blueTextLabel,
                           nil];
    return allLabelText;
}

+(BOOL)isChangedColor {
    return changedColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if([[segue identifier] isEqualToString:@"mainMenu"]) {
        /*UIViewController **/backgroundSavedColor = [segue destinationViewController];
        backgroundSavedColor.view.backgroundColor = [self currentColor];
        textSavedColor = [segue destinationViewController];
        textSavedColor.view.tintColor = [self currentTextColor];
        
    }
    
    
}


@end
