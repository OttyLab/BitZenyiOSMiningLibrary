# BitZeny Miner for iOS

## Summary
This is a BitZeny Miner for iOS based on [cpuminer](https://github.com/bitzeny/cpuminer). cpuminer is modifed to work as a library for Objective-C and Swift.

## Library


### Constructors


```
- (id) initWithLogCallback: (void(^)(NSString*))cb;
```

Passed method receives log data.


### Methods

```
- (int) startMining:(NSString*)url user:(NSString*)user password:(NSString*)password n_threads:(int)n_threads;
- (int) startBenchmark;
- (int) stopMining;
```
