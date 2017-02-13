//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self printInRectangularFrame:@[@"in",@"Hello", @"a", @"frame",@"World"]];
    NSString *new = [self translatedToPigLatin:@"The quick brown fox"];
    NSLog(@"%@",new);
    [self translatedFromPigLatin:@"Hetay uickqay rownbay oxfay"];
    [self combineTwoArrays:@[@"a", @"b",@"c"] second:@[@"1",@"2"]];
    [self getNumberDigits:12405];
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

-(NSString *)translatedToPigLatin:(NSString *)string {
    NSString *suffix = @"ay";
    NSMutableArray *words = [NSMutableArray arrayWithArray:[string componentsSeparatedByString:@" "]];
    NSString *word, *pigLatin, *character;
    for (NSUInteger i = 0; i < words.count; i++) {
        pigLatin = @"";
        word = [words objectAtIndex:i];
        for (NSUInteger j = 0; j < word.length; j++) {
            character = [NSString stringWithFormat:@"%c", [word characterAtIndex:((j+1)%word.length)]];
            if ([[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:[word characterAtIndex:j]]) character = character.uppercaseString;
            else character = character.lowercaseString;
            pigLatin = [pigLatin stringByAppendingString:character];
        }
        [words replaceObjectAtIndex:i withObject:[pigLatin stringByAppendingString:suffix]];
    }
    return [words componentsJoinedByString:@" "];

}

-(NSString *)translatedFromPigLatin:(NSString *)string {
    NSString *suffix = @"ay";
    NSMutableArray *words = [NSMutableArray arrayWithArray:[string componentsSeparatedByString:@" "]];
    NSString *word, *english, *character;
    for (NSUInteger i = 0; i < words.count; i++) {
        english = @"";
        word = [words objectAtIndex:i];
        word = [word substringToIndex:word.length-suffix.length];
        for (NSUInteger j = 0; j < word.length; j++) {
            character = [NSString stringWithFormat:@"%c", [word characterAtIndex:((j+word.length-1)%word.length)]];
            if ([[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:[word characterAtIndex:j]]) character = character.uppercaseString;
            else character = character.lowercaseString;
            english = [english stringByAppendingString:character];
        }
        [words replaceObjectAtIndex:i withObject:english];
    }
    NSLog(@"%@",[words componentsJoinedByString:@" "]);
    return [words componentsJoinedByString:@" "];
}

-(NSArray *)combineTwoArrays:(NSArray *)first second:(NSArray *)second {
    NSMutableArray *result = [NSMutableArray array];
    for(NSUInteger i = 0; i<MAX(first.count, second.count); i++) {
        if (i>=first.count) {
            [result addObject:second[i]];
        }else if(i>=second.count){
            [result addObject:first[i]];
        }else{
            [result addObject:first[i]];
            [result addObject:second[i]];
        }
    }
    NSLog(@"%@",result);
    return result;
}

-(NSArray *)getNumberDigits:(NSInteger)number {
    NSMutableArray *digits = [NSMutableArray array];
    NSInteger result = number;
    NSUInteger length = (NSUInteger) ceil(log10(number));
    for (NSUInteger i=0; i<length; i++) {
        int divider = pow(10.0,length - i - 1);
        NSInteger digit = result/divider;
        result = result%(divider);
        [digits addObject:@(digit)];
    }
    NSLog(@"%@",digits);
    return digits;
}



@end
