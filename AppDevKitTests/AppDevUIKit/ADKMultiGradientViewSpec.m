//
//  ADKMultiGradientViewSpec.m
//  AppDevKitTests
//
//  Created by  Chih Feng Sung on 2/20/19.
//  Copyright © 2019 Yahoo. All rights reserved.
//  Licensed under the terms of the BSD License.
//  Please see the LICENSE file in the project root for terms.
//

#import <Kiwi.h>
#import "AppDevKit.h"
#import "ImageTestUtils.h"

SPEC_BEGIN(ADKMultiGradientViewSpec)

describe(@"Test ADKMultiGradientView", ^{

    __block ADKMultiGradientView *testView;

    context(@"For different orientation settings", ^{
        beforeEach(^{
            testView = [[ADKMultiGradientView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 100.0f, 100.0f)];
            testView.gradientColors = @[[UIColor redColor], [UIColor greenColor], [UIColor blueColor]];
            testView.gradientLocations = @[@(0.0f), @(0.2f), @(0.5f)];
        });
        it(@"with ADKBlendsTypeFromTopToBottom blend type" , ^{
            testView.blendsType = ADKBlendsTypeFromTopToBottom;
            [testView redrawView];

            UIGraphicsBeginImageContext(testView.frame.size);
            CGContextRef context = UIGraphicsGetCurrentContext();
            [testView.layer renderInContext:context];
            UIImage *testImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();

            UIImage *expectedImage = [ImageTestUtils readImageNamed:@"img-multi-gradient-view-expected.png"];

            BOOL result = [ImageTestUtils compareImage:testImage toImage:expectedImage];
            [[theValue(result) should] equal:theValue(YES)];
        });
        it(@"with ADKBlendsTypeFromLeftToRight blend type" , ^{
            testView.blendsType = ADKBlendsTypeFromLeftToRight;
            [testView redrawView];

            UIGraphicsBeginImageContext(testView.frame.size);
            CGContextRef context = UIGraphicsGetCurrentContext();
            [testView.layer renderInContext:context];
            UIImage *testImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();

            UIImage *expectedImage = [ImageTestUtils readImageNamed:@"img-multi-gradient-view-expected2.png"];

            BOOL result = [ImageTestUtils compareImage:testImage toImage:expectedImage];
            [[theValue(result) should] equal:theValue(YES)];
        });
        it(@"with ADKBlendsTypeFromLeftTopToRightBottom blend type" , ^{
            testView.blendsType = ADKBlendsTypeFromLeftTopToRightBottom;
            [testView redrawView];

            UIGraphicsBeginImageContext(testView.frame.size);
            CGContextRef context = UIGraphicsGetCurrentContext();
            [testView.layer renderInContext:context];
            UIImage *testImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();

            UIImage *expectedImage = [ImageTestUtils readImageNamed:@"img-multi-gradient-view-expected3.png"];

            BOOL result = [ImageTestUtils compareImage:testImage toImage:expectedImage];
            [[theValue(result) should] equal:theValue(YES)];
        });
        it(@"with ADKBlendsTypeFromRightTopToLeftBottom blend type" , ^{
            testView.blendsType = ADKBlendsTypeFromRightTopToLeftBottom;
            [testView redrawView];

            UIGraphicsBeginImageContext(testView.frame.size);
            CGContextRef context = UIGraphicsGetCurrentContext();
            [testView.layer renderInContext:context];
            UIImage *testImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();

            UIImage *expectedImage = [ImageTestUtils readImageNamed:@"img-multi-gradient-view-expected4.png"];

            BOOL result = [ImageTestUtils compareImage:testImage toImage:expectedImage];
            [[theValue(result) should] equal:theValue(YES)];
        });

    });
});

SPEC_END
