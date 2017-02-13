//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self printInRectangularFrame:@[@"in",@"Hello", @"a", @"frame",@"World"]];
    return YES;
}

-(void)printInRectangularFrame:(NSArray *)words {
    NSUInteger maxLenght = 0;
    for (NSUInteger i = 0; i<words.count; i++) {
        if ([words[i] length] >= maxLenght) {
            maxLenght = [words[i] length];
        }
    }
    for (NSUInteger i =0; i<maxLenght+4; i++) {
        printf("%s", "*");
    }
    printf("%s \n","");
    for(NSString *word in words) {
        if([word length] < maxLenght) {
            NSUInteger numberOfSpaces = maxLenght - word.length;
            printf("%s %s","*",[word UTF8String]);
            for (NSUInteger i =0; i<numberOfSpaces; i++) {
                printf("%s", " ");
            }
            printf(" %s \n","*");
        }else{
            NSLog(@"%@ %@ %@",@"*",word,@"*");
        }
    }
    for (NSUInteger i =0; i<maxLenght+4; i++) {
        printf("%s", "*");
    }
    printf("%s \n","");

}

@end
