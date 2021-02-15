//
//  PatchUView.m
//  Patchloader
//
//  Created by Ashmika Gujaarthi on 28/10/20.
//

#import "PatchUView.h"

@interface SaySomething : NSObject - (void) say: (NSString *) phrase; @end
@implementation SaySomething
- (void) say: (NSString *) phrase {
    printf("%s\n", [ phrase UTF8String ]); }
@end
@interface PatchUView ()
- (void)updateOnClassInjection;
@end

@implementation PatchUView

- (void)viewDidLoad {
    [super viewDidLoad];
//    SaySomething *saySomething = [ [ SaySomething alloc ] init ];

 //   [ saySomething say: @"Hello, world!" ];
    NSLog(@"==== Code Injection in Action==== ");

    UIView *newView = [[UIView alloc] initWithFrame:CGRectMake(0,0,320,35)];
    newView.backgroundColor=[UIColor clearColor];
    UITextView *mytext = [[UITextView alloc] initWithFrame:CGRectMake(5.0, 0.0, 100.0, 28.0)];
    mytext.backgroundColor = [UIColor clearColor];
    mytext.textColor = [UIColor blackColor];
    mytext.editable = NO;
    mytext.font = [UIFont systemFontOfSize:15];
    mytext.text = @"Mytext";
    mytext.scrollEnabled=NO;
    [newView addSubview:mytext];
    [self.view addSubview:newView];
    // Do any additional setup after loading the view.
}
+ (void)updateOnClassInjection {
    NSLog(@"==== Code Injection in Action2 ====");

//    UIView *newView = [[UIView alloc] initWithFrame:CGRectMake(0,0,320,35)];
//    newView.backgroundColor=[UIColor clearColor];
//    UITextView *mytext = [[UITextView alloc] initWithFrame:CGRectMake(5.0, 0.0, 100.0, 28.0)];
//    mytext.backgroundColor = [UIColor clearColor];
//    mytext.textColor = [UIColor blackColor];
//    mytext.editable = NO;
//    mytext.font = [UIFont systemFontOfSize:15];
//    mytext.text = @"Mytext";
//    mytext.scrollEnabled=NO;
//    [newView addSubview:mytext];

//   [self.view setNeedsLayout];
//   [self.view layoutIfNeeded];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
