# Щеглов Виктор БПИ-20-3
import math

def fac(n):
    if n == 0:
        return 1
    return fac(n-1) * n

def def7(separator):
    print("Введите значение")
    line = str(input())
    words = line.split(separator)
    if (separator == '+'):
        product = 0
    elif (separator == '*'):
        product = 1        
    for word in words:
        try:
            value = int(word)
            if (separator == '+'):
                product += value
            elif (separator == '*'):
                product *= value
        except:
            pass
    print(product)
    return (0)  

def def6():
    print("Введите n")
    n = int(input())
    print("Введите m")
    m = int(input())
    print(fac(n + m - 1) / (fac(m) * fac(n - 1)))
    return (0)   

def def5():
    print("Введите n")
    n = int(input())
    print("Введите m")
    m = int(input())
    print(fac(n) / (fac(m) * fac(n - m)))
    return (0)

def def4():
    print("Введите n")
    n = int(input())
    print("Введите колличество повторяемых значений")
    m = int(input())
    s = 1
    while (m):
        print("Введите колличество повторений значения")
        k = int(input())
        s *= fac(k)
        m -= 1
    print(fac(n) / s)
    return (0)

def def3():
    print("Введите n")
    n = int(input())
    print(fac(n))
    return (0)

def def2():
    print("Введите n")
    n = int(input())
    print("Введите m")
    m = int(input())
    print(pow(n, m))
    return (0)

def def1():
    print("Введите n")
    n = int(input())
    print("Введите m")
    m = int(input())
    print((fac(n)) / (fac(n - m)))
    return (0)

def choose_case(case):
    if case == "Размещение без повторений":
        return(def1())
    elif case == "Размещение с повторениями":
        return(def2())
    elif case == "Перестановки без повторений":
        return(def3())
    elif case == "Перестановки с повторениями":
        return(def4())
    elif case == "Сочетания без повторений":
        return(def5())
    elif case == "Сочетания с повторениями":
        return(def6())
    elif case == "Сумма":
        return (def7('+'))
    elif case == "Умножение":
        return (def7('*'))
flag = 1
while (flag):
    print("выберете действия")
    print("Размещение без повторений")
    print("Размещение с повторениями")
    print("Перестановки без повторений")
    print("Перестановки с повторениями")
    print("Сочетания без повторений")
    print("Сочетания с повторениями")
    print("Сумма")
    print("Умножение")
    case = input()
    choose_case(case)
    print("Выход или Продолжить")
    answer = input()
    if (answer == "Продолжить"):
        flag = 1
    elif (answer == "Выход"):
        flag = 0
    else:
        print("Ошибка ввода")
        exit (0)