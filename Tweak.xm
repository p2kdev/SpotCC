@interface SBSearchScrollView : NSObject
  -(BOOL)gestureRecognizerShouldBegin:(id)arg1 ;
@end

@interface SBControlCenterController : NSObject
  +(id)sharedInstance;
  - (void)presentAnimated:(BOOL)arg1;
@end


%hook SBSearchScrollView

-(BOOL)gestureRecognizerShouldBegin:(id)arg1 {
  BOOL OrigVal = %orig;
  if (OrigVal)
  {
    OrigVal = false;
    [[NSClassFromString(@"SBControlCenterController") sharedInstance] presentAnimated:YES];
  }
  return OrigVal;
}


%end
