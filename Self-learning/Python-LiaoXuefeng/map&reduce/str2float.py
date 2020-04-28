# 利用map和reduce编写一个str2float函数，把字符串'123.456'转换成浮点数123.456：
# -*- coding: utf-8 -*-
from functools import reduce


def str2float(s):
    s1 = s.split('.')[0]
    s2 = s.split('.')[1]
    return reduce(lambda x, y: x*10+y, map(float, s1)) + reduce(lambda x, y: 10 * x+y, map(float, s2)) * pow(0.1, len(s2))
