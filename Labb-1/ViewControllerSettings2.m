//
//  settings.m
//  Labb-1
//
//  Created by Victoria Grönqvist on 2018-01-16.
//  Copyright © 2018 Victoria Grönqvist. All rights reserved.
//

#import "ViewControllerSettings2.h"

@interface ViewControllerSettings2 ()
@property (weak, nonatomic) IBOutlet UIView *backgroundColorDisplay;
@property (weak, nonatomic) IBOutlet UISlider *redAmountBackground;
@property (weak, nonatomic) IBOutlet UISlider *greenAmountBackground;
@property (weak, nonatomic) IBOutlet UISlider *blueAmountBackground;

@property (weak, nonatomic) IBOutlet UIView *textColorDisplay;
@property (weak, nonatomic) IBOutlet UISlider *textRedAmount;
@property (weak, nonatomic) IBOutlet UISlider *textGreenAmount;
@property (weak, nonatomic) IBOutlet UISlider *textBlueAmount;

@end

@implementation ViewControllerSettings2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self refresh];
}
/*
//Sätt bakgrund och textfärg till färgen man valt
- (IBAction)saveButton:(id)sender {
    
}

//Metod som byter bakgrundsfärgen via sliders
- (void) refresh {
    self.backgroundColorDisplay.backgroundColor = [self currentColorBackground];
    self.textColorDisplay.backgroundColor = [self currentColorText];
}

//Uppdaterar färg när slider rör sig (pga sätter färg på rutan via sliders)
- (IBAction)sliderChanged:(id)sender {
    [self refresh];
}

//Går det att använda dessa metoder utan kopiering?

//Metod för att räkna ut färg på bakgrund via sliders
- (UIColor*) currentColorBackground {
    return [UIColor colorWithRed:self.redAmountBackground.value
                           green:self.greenAmountBackground.value
                            blue:self.blueAmountBackground.value
                           alpha:1.0f];
}

//Metod för att räkna ut färg på bakgrund via sliders
- (UIColor*) currentColorText {
    return [UIColor colorWithRed:self.textRedAmount.value
                           green:self.textGreenAmount.value
                            blue:self.textBlueAmount.value
                           alpha:1.0f];
}

*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
