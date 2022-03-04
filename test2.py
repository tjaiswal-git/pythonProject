
def dict_match(dict1,dict2):
    try:
        flg = False
        for i in dict1:
            value1 = dict1[i]
            if dict2[i] == value1:
                flg = True
            else:
                raise KeyError
        if flg:
            print("Dict are similar")
    except KeyError:
        print("Dict is not similar")


dict1 = {'a':1,'b':2,'c':{'a':3,'b':4}}
dict2 = {'a':1,'b':2,'c':{'b':3,'b':4}}

dict_match(dict1,dict2)


