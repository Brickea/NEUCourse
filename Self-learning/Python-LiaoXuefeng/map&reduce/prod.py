# Python提供的sum()函数可以接受一个list并求和，请编写一个prod()函数，可以接受一个list并利用reduce()求积：
# -*- coding: utf-8 -*-
from functools import reduce


def prod(L):
    return reduce(lambda x, y: x*y, L)
