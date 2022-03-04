def find_sequence(inputList,max):
    parentList = []
    newList = []
    for i in range(1, max+1):

        if i in inputList:
            newList.append(i)
        else:
            if (len(newList)) > 1:
                parentList.append(newList)
                newList = []
            else:
                newList = []
    return parentList


if __name__ == '__main__':
    list1 = [324,507,153,48,253,226,102,232,792,4,316,583,158,338,123,200,118,448,305,159,83,864,348,56,838,
             233,501,835,603,367,310,12,96,495,171,865,224,683,174,382,409,529,396,710,60,834,809,29,824,
             220,162,825,380,817,808,165,178,458,726,438,53,543,818,602,58,187,865,863,479,227,904,926,914,
             168,427,802,303,445,541,58,59,14,35,31,44,75,52,5,39,46,17,49,34,32,19,94,3,9,2]
    print(max(list1))
    #[1, 25, 2, 846, 3, 351, 448, 6, 544, 546, 7, 354, 555, 8, 6, 2, 5,10,11,13]
    expected = find_sequence(list1,max(list1))
    print(expected)
