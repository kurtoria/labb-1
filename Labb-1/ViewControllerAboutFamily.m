//
//  aboutFamily.m
//  Labb-1
//
//  Created by Victoria Grönqvist on 2018-01-12.
//  Copyright © 2018 Victoria Grönqvist. All rights reserved.
//

#import "ViewControllerAboutFamily.h"
#import "ViewControllerSettings.h"

UIViewController *backgroundSavedColorAboutF;
UIViewController *textSavedColorAboutF;

@interface ViewControllerAboutFamily ()

@end

@implementation ViewControllerAboutFamily

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [ViewControllerSettings sendBackgroundColor: self.redBackgroundValueAF andGreen:self.greenBackgroundValueAF andBlue:self.blueBackgroundValueAF
                                  andBackground:self.view];
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
    
    ViewControllerSettings *colorSetting = [[ViewControllerSettings alloc] init];
    backgroundSavedColorAboutF = [segue destinationViewController];
    backgroundSavedColorAboutF.view.backgroundColor = [colorSetting currentColor];
    textSavedColorAboutF = [segue destinationViewController];
    textSavedColorAboutF.view.tintColor = [colorSetting currentTextColor];
}


@end
