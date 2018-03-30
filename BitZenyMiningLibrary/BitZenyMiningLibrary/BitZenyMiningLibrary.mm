#include "BitZenyMiningLibrary.h"
#include "libcpuminer/libcpuminer.h"

void(^handler)(NSString*);

void output(const char *format, va_list arg) {
    char *msg = (char*)malloc(sizeof(char) * 1024); // TODO: may cause buffer overflow
    vsprintf(msg, format, arg);

    dispatch_async(dispatch_get_main_queue(),^{
        if (handler) {
            handler([NSString stringWithCString:msg encoding:NSUTF8StringEncoding]);
        } else {
            printf("%s", msg);
        }
    });
}

@implementation BitZenyMiningLibrary {
}

- (id) init {
    if (self = [super init]) {
        init(output);
    }
    return self;
}

- (id) initWithLogCallback: (void(^)(NSString*))cb {
    if (self = [super init]) {
        handler = cb;
        init(output);
    }
    return self;
}

- (int) startMining:(NSString*)url user:(NSString*)user password:(NSString*)password n_threads:(int)n_threads {
    char* c_url = (char*)[url UTF8String];
    char* c_user = (char*)[user UTF8String];
    char* c_password = (char*)[password UTF8String];

    return start(c_url, c_user, c_password, n_threads);
}

- (int) startBenchmark {
    return start(NULL, NULL, NULL);
}

- (int) stopMining {
    return stop();
}

@end
