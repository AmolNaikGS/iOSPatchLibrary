//
//  PatchLoad.m
//  Patchloader
//
//  Created by Ashmika Gujaarthi on 27/10/20.
//

#import "PatchLoad.h"
#import <Patchloader/Patchloader-Swift.h>
@implementation PatchLoad



static void __attribute__((constructor)) initialize(void) {
    NSLog(@"==== Code Injection in Action====");
//    NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
//    NSLog(bundleIdentifier);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
           static PatchUI *patchUIManager ;
            patchUIManager =  [[PatchUI alloc]init];
            [patchUIManager test];

       });
    
    
    
//    my_updateOnClassInjection(, <#SEL _cmd#>)
    
//    objc_msgSend(NSClassFromString(aClassName), @selector(classMethod));
    //class_getClassMethod(<#Class  _Nullable __unsafe_unretained cls#>, "")
   // class_addMethod(objc_getMetaClass("PatchUView"),
          //  @selector(updateOnClassInjection), (IMP)my_updateOnClassInjection, "@:@");
    /*
     
      Place your code injection codes here
    */
//    static PatchUView *patchUIManager;
//    patchUIManager = [PatchUView new];
//    [patchUIManager updateOnClassInjection];
}
//id evil_say(id self, SEL op) {
//
//       printf("Bawhawhawhaw! I'm Evil!\n");
//       FILE *f= fopen("/tmp/sample.txt","w");
//       fprintf(f, "OKOK");
//       fclose(f);
//       return self;
//}
//
//static void __attribute__((constructor)) initialize(void) {
//
//       FILE *f= fopen("/tmp/sample.txt2","w");
//       fprintf(f, "OKOK");
//       fclose(f);
//       class_replaceMethod( objc_getClass("PatchUView"), sel_registerName("say:"), evil_say, "@:" );
//}
//

@end
