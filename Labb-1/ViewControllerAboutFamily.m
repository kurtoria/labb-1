//
//  aboutFamily.m
//  Labb-1
//
//  Created by Victoria Grönqvist on 2018-01-12.
//  Copyright © 2018 Victoria Grönqvist. All rights reserved.
//

#import "ViewControllerAboutFamily.h"
#import "ViewControllerSettings.h"

//UIViewController *backgroundSavedColorAboutF;
//UIViewController *textSavedColorAboutF;

@interface ViewControllerAboutFamily ()

@end

@implementation ViewControllerAboutFamily

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.aboutFChangedColor) {
        [ViewControllerSettings sendBackgroundColor: self.redBackgroundValueAF andGreen:self.greenBackgroundValueAF andBlue:self.blueBackgroundValueAF andBackground:self.view];
    } else {
     self.view.backgroundColor = [UIColor whiteColor];
     self.view.tintColor = [UIColor blackColor];
    }
     
    
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
}


@end
