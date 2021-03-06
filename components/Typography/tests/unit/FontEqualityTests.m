// Copyright 2018-present the Material Components for iOS authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import <XCTest/XCTest.h>
#import "MaterialTypography.h"

@interface FontEqualityTests : XCTestCase

@end

@implementation FontEqualityTests

- (void)testSimpleFontEquality {
  CGFloat fontSize = 16.0;
  UIFont *baseFont = [UIFont systemFontOfSize:fontSize];
  XCTAssertNotNil(baseFont);

  UIFontDescriptor *newDescriptor = [[baseFont fontDescriptor]
      fontDescriptorByAddingAttributes:@{@"NSCTFontUIUsageAttribute" : UIFontTextStyleBody}];
  XCTAssertNotNil(newDescriptor);

  UIFont *additionalAttributeFont = [UIFont fontWithDescriptor:newDescriptor size:fontSize];
  XCTAssertNotNil(additionalAttributeFont);

  XCTAssertFalse(baseFont == additionalAttributeFont);
  XCTAssertFalse([baseFont isEqual:additionalAttributeFont]);
  XCTAssertTrue([baseFont mdc_isSimplyEqual:additionalAttributeFont]);
}

@end
