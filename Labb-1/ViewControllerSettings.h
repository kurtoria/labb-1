//
//  ViewControllerSettings.h
//  Labb-1
//
//  Created by Victoria Grönqvist on 2018-01-17.
//  Copyright © 2018 Victoria Grönqvist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerSettings : UIViewController
- (void)refresh;
- (UIColor*) currentColor;
- (UIColor*) currentTextColor;
//- (IBAction)saveButton:(id)sender;
- (void)setBackgroundColor;
- (void)setTextColor;
//+ (void)setBackgroundInAll;
//+ (BOOL) isChangedColor;
+ (void)sendBackgroundColor:(float)redColor andGreen:(float)greenColor andBlue:(float)blueColor andBackground:(UIView*)background;
//+ (void)sendTextColor:(float)redColor andGreen:(float)greenColor andBlue:(float)blueColor andText:(UIColor*)tintColor;

@property (nonatomic) float redBackgroundValueS;
@property (nonatomic) float greenBackgroundValueS;
@property (nonatomic) float blueBackgroundValueS;
@property (nonatomic) float redTextValueS;
@property (nonatomic) float greenTextValueS;
@property (nonatomic) float blueTextValueS;
@property (nonatomic) BOOL settingsChangedColor;

@end
