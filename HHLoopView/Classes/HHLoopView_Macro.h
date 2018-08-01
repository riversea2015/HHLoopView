//
//  HHLoopView_Macro.h
//  Pods
//
//  Created by hehai on 2018/7/31.
//  Copyright © 2018 riversea2015. All rights reserved.
//

#ifndef HHLoopView_Macro_h
#define HHLoopView_Macro_h

#define HHScreenW [UIScreen mainScreen].bounds.size.width
#define HHScreenH [UIScreen mainScreen].bounds.size.height

#define HH_Arr_Class(arr) [arr isKindOfClass:[NSArray class]]
#define HH_Arr_Is_Valid(arr) ((arr) && (HH_Arr_Class(arr)) && ([arr count] > 0))

#endif /* HHLoopView_Macro_h */
