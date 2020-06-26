'''
@Author: grehex
@Date: 2020-03-30 16:24:41
@LastEditTime: 2020-03-30 16:24:53
@Description: if (n := len(a)) > 10:
'''
a = 'hello'
if (n := len(a)) > 10:
    print(f"List is too long ({n} elements, expected <= 10)")