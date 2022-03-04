
def sumofodd(num):
    parentList = []
    newList = []
    count = 0
    i = 1
    while i * i <= num:
        if num % i == 0:
            divisor1 = i
            divisor2 = num // i
            sum = divisor1 + divisor2
            if sum % 2 == 0:
                count = count +1
        i = i +1

    print(count)



if __name__ =='__main__':
    sumofodd(45)
