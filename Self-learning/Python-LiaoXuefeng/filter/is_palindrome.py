# 回数是指从左向右读和从右向左读都是一样的数，例如12321，909。请利用filter()筛选出回数：
# -*- coding: utf-8 -*-


def is_palindrome(n):
    return str(n) == str(n)[::-1]
