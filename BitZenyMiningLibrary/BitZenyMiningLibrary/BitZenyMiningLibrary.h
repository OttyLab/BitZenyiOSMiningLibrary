#ifndef SwiftAndObjCpp_objcpp_h
#define SwiftAndObjCpp_objcpp_h
#import <Foundation/Foundation.h>

@interface BitZenyMiningLibrary: NSObject
- (id) initWithLogCallback: (void(^)(NSString*))cb;
- (int) startMining:(NSString*)url user:(NSString*)user password:(NSString*)password n_threads:(int)n_threads;
- (int) startBenchmark;
- (int) stopMining;
@end

#endif // SwiftAndObjCpp_objcpp_h
