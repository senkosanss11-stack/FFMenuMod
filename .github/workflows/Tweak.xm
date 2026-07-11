#import <UIKit/UIKit.h>

extern void initMenu();

%ctor {
    initMenu();
}