#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    NSMutableString *first = [NSMutableString stringWithString:string1];
    NSMutableString *second = [NSMutableString stringWithString:string2];
    NSMutableString *result = [[NSMutableString alloc] init];

    NSRange range = NSMakeRange(0, 1);
    while (first.length > 0 && second.length > 0) {
        NSComparisonResult comparison = [first compare:second];
        if (comparison == NSOrderedAscending) {
            [result appendString:[first substringWithRange:range]];
            [first deleteCharactersInRange:range];
        } else {
            [result appendString:[second substringWithRange:range]];
            second = [second substringFromIndex:1];
        }
    }
    [result appendString:first];
    [result appendString:second];
    return  [NSString stringWithString:result];
}

@end
