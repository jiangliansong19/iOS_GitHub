//
//  ViewModel.h
//  ReactiveCocoa-Demo
//
//  Created by 江连松 on 2017/6/2.
//  Copyright © 2017年 JLS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//MYTwitterLookupViewModel.h
@interface MYTwitterLookupViewModel: NSObject
  
@property (nonatomic, assign, readonly, getter=isUsernameValid) BOOL usernameValid;
@property (nonatomic, strong, readonly) NSString *userFullName;
@property (nonatomic, strong, readonly) UIImage *userAvatarImage;
@property (nonatomic, strong, readonly) NSArray *tweets;
@property (nonatomic, assign, readonly) BOOL allTweetsLoaded;
@property (nonatomic, strong, readwrite) NSString *username;
  
- (void) getTweetsForCurrentUsername;
- (void) loadMoreTweets;
