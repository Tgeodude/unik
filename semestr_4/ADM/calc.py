def answer(numb, sys_numb):
	if sys_numb == 10:
		return numb
	if sys_numb == 2:
		return bin(numb)[2:]
	if sys_numb == 16:
		return hex(numb)[2:]


def calc_ps(number, sys_number):
	if sys_number == 10:
		return int (number)
	if sys_number == 2:
		return int (number, 2)
	if sys_number == 16:
		return int (number, 16)

def calc():
	print("введите первое число")
	number1 = input()
	print("введите систему счисления (10,2,16)")
	sys_number1 = int (input())
	print("введите знак (+, -, *, /)")
	sign = input()
	print("введите второе число")
	number2 = input()
	print("введите систему счисления (10,2,16)")
	sys_number2 = int (input())
	print("введите систему счисления для ответа (10,2,16)")
	sys_answer = int (input())
	if sign == "+":
		calc_answer = (calc_ps(number1, sys_number1) + calc_ps(number2, sys_number2))
	elif sign == "-":
		calc_answer = (calc_ps(number1, sys_number1) - calc_ps(number2, sys_number2))
	elif sign == "*":
		calc_answer = (calc_ps(number1, sys_number1) * calc_ps(number2, sys_number2))
	elif sign == "/":
		calc_answer = (calc_ps(number1, sys_number1) / calc_ps(number2, sys_number2))
	print(answer(calc_answer, sys_answer))
flag = 1
while (flag):
	calc()
	print('Если хотите продолжить напишите слово "продолжить", иначе напишите "выход"')
	esc = input()
	if esc == "выход":
		flag = 0