//
//  main.m
//  c语言-链表
//
//  Created by hhb on 2020/10/26.
//  Copyright © 2020 edz. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        //链表 里面一个data数据  一个next指针
        
        //结构体
        struct p{
            int a;
            struct p *next;
        };//这个就是我们要的节点
        
        //头  中间的节点  表尾
        //创建
        struct p *head;
        struct p *point;
        struct p *end;
        head = (struct p*)malloc(sizeof(struct p));
        end = head;//如果链表是空表，那么头和尾是相同的
        //我们需要保持最后一个节点始终是end
        
        for (int i=0; i<4; i++) {
            point = (struct p*)malloc(sizeof(struct p));
            point->a = i;
            end->next = point;
            end = point;
        }
        end->next = NULL;
        
        
    }
    return 0;
}
