list1 = ['redshrit', 'greenshirt', 'blueshrit', 'redpaint', 'redshrit', 'greenshrit', 'bluepaint']

#list1 = ['a','b','a','c','b','a']
list1 = sorted(list1)
print(list1)
count = 0
max = 0
k= 0
for i in range(len(list1)-1):
    if list1[i] == list1[i+1]:
        count = count +1
        k = i
    else:
        print(count)
        if count>max:
            max = count
            k = i
            count = 0
#print(k)
print(list1[k])

#
# new_product_dict = {}
#
# for item1 in list1:
#     print(item1)
#     if item1 in new_product_dict:
#         new_product_dict[item1] = new_product_dict.get(item1) + 1
#     else:
#         new_product_dict[item1] = 1
# print(new_product_dict)
# max = 0
# for x, y in new_product_dict.items():
#     if y > max:
#         max = y
# print(max)
#
# new_list = []
# for x,y in new_product_dict.items():
#     if int(y) == int(max):
#         new_list.append(str(x))
#
# print(sorted(new_list)[0])



def my_fun(n):
    return lambda a : a*n

myfunc = my_fun(5)
print(myfunc(10))