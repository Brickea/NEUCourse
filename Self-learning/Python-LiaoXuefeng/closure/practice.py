# 利用闭包返回一个计数器函数，每次调用它返回递增整数：
# -*- coding: utf-8 -*-


def createCounter():
    s = [0]

    def counter():
        s[0] = s[0]+1
        return s[0]
    return counter
