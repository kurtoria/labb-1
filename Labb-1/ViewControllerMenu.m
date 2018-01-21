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

//UIViewController *backgroundSavedColorMenu;
//UIViewController *textSavedColorMenu;


@interface ViewControllerMenu ()

@end

@implementation ViewControllerMenu
static BOOL changedColor;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (changedColor) {
        [ViewControllerSettings sendBackgroundColor:self.redBackgroundValueM andGreen:self.greenBackgroundValueM andBlue:self.blueBackgroundValueM andBackground:self.view];
     
        //[ViewControllerSettings sendTextColor:self.redTextValueM andGreen:self.greenTextValueM andBlue:self.blueTextValueM andText:self.view.tintColor];
        NSLog(@"viewDidLoad: isChangedValue: %d", changedColor);
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
        //self.view.tintColor = [UIColor blackColor];
    }
}

+ (BOOL)isChangedColor {
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
    
    if([[segue identifier] isEqualToString:@"aboutVictoria"]) {
                ViewControllerAboutVictoria *valuesViewControllerAboutV = [segue destinationViewController];
        valuesViewControllerAboutV.redBackgroundValueAV = self.redBackgroundValueM;
        valuesViewControllerAboutV.greenBackgroundValueAV = self.greenBackgroundValueM;
        valuesViewControllerAboutV.blueBackgroundValueAV = self.blueBackgroundValueM;
        /*
        valuesViewControllerAboutV.redTextValueAV = self.redTextValueM;
        valuesViewControllerAboutV.greenBackgroundValueAV = self.greenTextValueM;
        valuesViewControllerAboutV.blueBackgroundValueAV = self.blueTextValueM;
         */
    } else if ([[segue identifier] isEqualToString:@"miniGame"]) {
        ViewControllerMiniGame *valuesViewControllerMiniGame = [segue destinationViewController];
        valuesViewControllerMiniGame.redBackgroundValueMG = self.redBackgroundValueM;
        valuesViewControllerMiniGame.greenBackgroundValueMG = self.greenBackgroundValueM;
        valuesViewControllerMiniGame.blueBackgroundValueMG = self.blueBackgroundValueM;
        
        
    } else if ([[segue identifier] isEqualToString:@"settings"]) {
        ViewControllerSettings *valuesViewControllerSettings = [segue destinationViewController];
        valuesViewControllerSettings.redBackgroundValueS = self.redBackgroundValueM;
        valuesViewControllerSettings.greenBackgroundValueS = self.greenBackgroundValueM;
        valuesViewControllerSettings.blueBackgroundValueS = self.blueBackgroundValueM;
        valuesViewControllerSettings.settingsChangedColor = changedColor;
    
        NSLog(@"Segue menu: isChangedValue: %d", changedColor);
        
    } else if ([[segue identifier] isEqualToString:@"aboutFamily"]) {
        ViewControllerAboutFamily *valuesViewControllerAboutFamily = [segue destinationViewController];
        valuesViewControllerAboutFamily.redBackgroundValueAF = _redBackgroundValueM;
        valuesViewControllerAboutFamily.greenBackgroundValueAF = _greenBackgroundValueM;
        valuesViewControllerAboutFamily.blueBackgroundValueAF = _blueBackgroundValueM;
    }
}


@end
