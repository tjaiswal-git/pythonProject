def common_letter(s1,s2):
    setCommanChars = set()
    for ch in s1:
        if ch in s2:
            setCommanChars.add(ch)
    print(setCommanChars)


str1 = 'geeks'
str2 = 'forgeeks'
if len(str1) >= len(str2):
    common_letter(str1,str2)
else:
    common_letter(str2,str1)


def common_member(a, b):
    a_set = set(a)
    b_set = set(b)

    if (a_set & b_set):
        print(a_set & b_set)
    else:
        print("No common elements")

common_member("tarun","jaiswal")




def maxString(s1, s2):
    maxString = ''
    if len(s1) > len(s2):
        maxString = s1
        return maxString
    else:
        maxString = s2
        return maxString



list1 = [8,11,14,16]

for i in range(len(list1)-1):
    if (list1[i+1] - list1[i]) != 1:
        print(list1[i]+1)

