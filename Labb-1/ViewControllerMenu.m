//
//  ViewControllerMenu.m
//  Labb-1
//
//  Created by Victoria Grönqvist on 2018-01-20.
//  Copyright © 2018 Victoria Grönqvist. All rights reserved.
//

#import "ViewControllerMenu.h"
#import "ViewControllerSettings.h"
#import "ViewControllerAboutVictoria.h"
#import "ViewControllerMiniGame.h"
#import "ViewControllerAboutFamily.h"

UIViewController *backgroundSavedColorMenu;
UIViewController *textSavedColorMenu;
static BOOL changedColor/*= NO*/;




@interface ViewControllerMenu ()

@end

@implementation ViewControllerMenu


- (void)viewDidLoad {
    //ViewControllerSettings *colorSettings = [[ViewControllerSettings alloc] init];
    [super viewDidLoad];
    //[colorSettings setBackgroundColor];
    //[colorSettings setTextColor];
    // Do any additional setup after loading the view.
    NSLog(@"viewDidLoad: isChangedValue: %d", changedColor);
    
    
    if (changedColor) {
        [ViewControllerSettings sendBackgroundColor:self.redBackgroundValueM andGreen:self.greenBackgroundValueM andBlue:self.blueBackgroundValueM andBackground:self.view];
     
        //[ViewControllerSettings sendTextColor:self.redTextValueM andGreen:self.greenTextValueM andBlue:self.blueTextValueM andText:self.view.tintColor];
     
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
        //self.view.tintColor = [UIColor blackColor];
    }
}



+(BOOL)isChangedColor {
    changedColor = YES;
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
    
    if([[segue identifier] isEqualToString:@"aboutVictoria"]) {
                ViewControllerAboutVictoria *valuesViewControllerAboutV = [segue destinationViewController];
        valuesViewControllerAboutV.redBackgroundValueAV = _redBackgroundValueM;
        valuesViewControllerAboutV.greenBackgroundValueAV = _greenBackgroundValueM;
        valuesViewControllerAboutV.blueBackgroundValueAV = _blueBackgroundValueM;
        /*
        valuesViewControllerAboutV.redTextValueAV = _redTextValueM;
        valuesViewControllerAboutV.greenBackgroundValueAV = _greenTextValueM;
        valuesViewControllerAboutV.blueBackgroundValueAV = _blueTextValueM;
         */
    } else if ([[segue identifier] isEqualToString:@"miniGame"]) {
        ViewControllerMiniGame *valuesViewControllerMiniGame = [segue destinationViewController];
        valuesViewControllerMiniGame.redBackgroundValueMG = _redBackgroundValueM;
        valuesViewControllerMiniGame.greenBackgroundValueMG = _greenBackgroundValueM;
        valuesViewControllerMiniGame.blueBackgroundValueMG = _blueBackgroundValueM;
        
        
    } else if ([[segue identifier] isEqualToString:@"settings"]) {
        ViewControllerSettings *valuesViewControllerSettings = [segue destinationViewController];
        valuesViewControllerSettings.redBackgroundValueS = _redBackgroundValueM;
        valuesViewControllerSettings.greenBackgroundValueS = _greenBackgroundValueM;
        valuesViewControllerSettings.blueBackgroundValueS = _blueBackgroundValueM;
        
        NSLog(@"isChangedValue: %d", changedColor);
        
    } else if ([[segue identifier] isEqualToString:@"aboutFamily"]) {
        ViewControllerAboutFamily *valuesViewControllerAboutFamily = [segue destinationViewController];
        valuesViewControllerAboutFamily.redBackgroundValueAF = _redBackgroundValueM;
        valuesViewControllerAboutFamily.greenBackgroundValueAF = _greenBackgroundValueM;
        valuesViewControllerAboutFamily.blueBackgroundValueAF = _blueBackgroundValueM;
    }
    /*
     if ([[segue identifier] isEqualToString:@"Save"]) {
     ViewControllerMenu *valuesViewControllerMenu = [segue destinationViewController];
     valuesViewControllerMenu.redBackgroundValueM = self.backgroundRedAmount.value;
     valuesViewControllerMenu.greenBackgroundValueM = self.backgroundGreenAmount.value;
     valuesViewControllerMenu.blueBackgroundValueM = self.backgroundBlueAmount.value;
     valuesViewControllerMenu.redTextValueM = self.textRedAmount.value;
     valuesViewControllerMenu.greenTextValueM = self.textGreenAmount.value;
     valuesViewControllerMenu.blueTextValueM = self.textBlueAmount.value;
     */
    
    /*
    if(changedColor) {
        ViewControllerSettings *colorSetting = [[ViewControllerSettings alloc] init];
        backgroundSavedColorMenu = [segue destinationViewController];
        backgroundSavedColorMenu.view.backgroundColor = [colorSetting currentColor];
        textSavedColorMenu = [segue destinationViewController];
        textSavedColorMenu.view.tintColor = [colorSetting currentTextColor];
    }
     */
 
}


@end
