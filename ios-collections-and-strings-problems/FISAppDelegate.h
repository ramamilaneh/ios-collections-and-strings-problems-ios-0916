//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

-(void)printInRectangularFrame:(NSArray *)words;
-(NSString *)translatedToPigLatin:(NSString *)string;
-(NSString *)translatedFromPigLatin:(NSString *)string;
-(NSArray *)combineTwoArrays:(NSArray *)first second:(NSArray *)second;
-(NSArray *)getNumberDigits:(NSInteger)number;

@end
