#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    if (monthNumber < 1 || monthNumber > 12) return nil;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSString *month = [[formatter monthSymbols] objectAtIndex:(monthNumber - 1)];

    return month;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";

    NSDate *newDate = [formatter dateFromString:date];
    if (newDate == nil) {
        return 0;
    }

    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [calendar components:NSCalendarUnitDay fromDate:newDate];
    return [components day];
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSDateFormatter *weekday = [[NSDateFormatter alloc] init];
    [weekday setLocale:[NSLocale localeWithLocaleIdentifier:@"ru_RU"]];
    [weekday setDateFormat: @"EE"];
    return [weekday stringFromDate:date];
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSDate *startDate = nil;
    NSTimeInterval interval = 0.0;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    [calendar rangeOfUnit:NSCalendarUnitWeekOfYear startDate:&startDate interval:&interval forDate:[NSDate date]];
    NSDate *endDate = [calendar dateByAddingUnit:NSCalendarUnitSecond value:(NSInteger)interval toDate:startDate options:NSCalendarMatchNextTime];
    return [date compare:startDate] == NSOrderedDescending && [date compare:endDate] == NSOrderedAscending;
}

@end
