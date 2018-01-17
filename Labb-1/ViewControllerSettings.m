//
//  ViewControllerSettings.m
//  Labb-1
//
//  Created by Victoria Grönqvist on 2018-01-17.
//  Copyright © 2018 Victoria Grönqvist. All rights reserved.
//

#import "ViewControllerSettings.h"

@interface ViewControllerSettings ()
@property (weak, nonatomic) IBOutlet UIView *backgroundDisplay;
@property (weak, nonatomic) IBOutlet UISlider *backgroundRedAmount;
@property (weak, nonatomic) IBOutlet UISlider *backgroundGreenAmount;
@property (weak, nonatomic) IBOutlet UISlider *backgroundBlueAmount;

@end

@implementation ViewControllerSettings

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self refresh];
}

//Uppdaterar färg när slider rör sig (pga sätter färg på rutan via sliders)
- (IBAction)sliderChanged:(id)sender {
    [self refresh];
}

//Ändrar färgen i rutan när man drar i sliders
- (void)refresh {
    self.backgroundDisplay.backgroundColor = [self currentColor];
}


//Sätter aktuella färgen
- (UIColor*) currentColor {
    return [UIColor colorWithRed:self.backgroundRedAmount.value
                           green:self.backgroundGreenAmount.value
                            blue:self.backgroundBlueAmount.value
                           alpha:1.0f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
