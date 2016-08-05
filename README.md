# NestingCollectionView

This sample code illustrates collection view layout problem when nesting a collection view inside a parent collection view. Both the parent and child collection views are dynamicly sized (self-sizing).

## Problem

When I put a self-sizing collection view inside a collection view cell (which belongs to a parent self-sizing collection view), the app crashes with the following error in debugger console:

```
2016-08-06 03:36:30.295 NestingCollection[34271:1169177] the behavior of the UICollectionViewFlowLayout is not defined because:
2016-08-06 03:36:30.295 NestingCollection[34271:1169177] the item height must be less than the height of the UICollectionView minus the section insets top and bottom values, minus the content insets top and bottom values.
2016-08-06 03:36:30.295 NestingCollection[34271:1169177] Please check the values return by the delegate.
2016-08-06 03:36:30.296 NestingCollection[34271:1169177] The relevant UICollectionViewFlowLayout instance is <UICollectionViewFlowLayout: 0x7f8de96c2d60>, and it is attached to <UICollectionView: 0x7f8dea868c00; frame = (0 25; 100 55); clipsToBounds = YES; gestureRecognizers = <NSArray: 0x7f8de96c3760>; layer = <CALayer: 0x7f8de96c0a80>; contentOffset: {0, 0}; contentSize: {0, 0}> collection view layout: <UICollectionViewFlowLayout: 0x7f8de96c2d60>.
2016-08-06 03:36:30.296 NestingCollection[34271:1169177] Make a symbolic breakpoint at UICollectionViewFlowLayoutBreakForInvalidSizes to catch this in the debugger.
```
