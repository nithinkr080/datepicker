//
//  DatePickerModule.m
//  datepicker
//
//  Created by Nithin K R on 07/06/24.
//

// DatePickerModule.m
#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>

// This ensures that the Swift code is compiled
@interface RCT_EXTERN_MODULE(DatePickerModule, NSObject)

RCT_EXTERN_METHOD(showDatePicker:(NSString *)style callback:(RCTResponseSenderBlock)callback)

@end
