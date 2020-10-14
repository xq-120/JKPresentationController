//
//  ZAEInterActiveGroupVipUserModel.h
//  JKPresentationControllerDemo
//
//  Created by xuequan on 2020/10/14.
//  Copyright © 2020 xuequan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZAEInterActiveGroupVipUserModel : NSObject

@property (nonatomic, assign) NSInteger userID; ///< 用户ID
@property (nonatomic, copy) NSString *nickname; ///< 昵称
@property (nonatomic, copy) NSString *avatar; ///< 头像
@property (nonatomic, assign) BOOL online; ///< 是否在线
@property (nonatomic, assign) BOOL microphonePublic; ///< 是否上麦公有（主持人维护）
@property (nonatomic, assign) BOOL microphonePrivate; ///< 是否上麦私有（个人维护)

@property (nonatomic, copy) NSString *roomNickname; ///< 该房间的昵称

@end


NS_ASSUME_NONNULL_END
