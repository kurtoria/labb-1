//
//  aboutVictoria.m
//  Labb-1
//
//  Created by Victoria Grönqvist on 2018-01-12.
//  Copyright © 2018 Victoria Grönqvist. All rights reserved.
//

#import "ViewControllerAboutVictoria.h"
#import "ViewControllerSettings.h"

@interface ViewControllerAboutVictoria ()

@end

@implementation ViewControllerAboutVictoria

- (void)viewDidLoad {
    [super viewDidLoad];
    [ViewControllerSettings sendBackgroundColor: self.redBackgroundValueAV andGreen:self.greenBackgroundValueAV andBlue:self.blueBackgroundValueAV
                                  andBackground:self.view];
    //[ViewControllerSettings sendTextColor:self.redTextValueAV andGreen:self.greenTextValueAv andBlue:self.blueTextValueAV andText:self.view.tintColor];
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
