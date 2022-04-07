# БПИ-20-3 Щеглов Виктор Алексеевич
class Node:
    def __init__(self, data):
        self.next = None
        self.data = data
    def append(self, val):
        end = Node(val)
        n = self
        while (n.next):
            n = n.next
        n.next = end
    def delete(self, index):
        i = 0
        while i < index - 1:
            self = self.next
            i += 1
        self.next = self.next.next

print("Сейчас в списке нет элементов, добавте один для работы")
flag = 1
list = Node(input())
while flag != 0:
    print("****")
    node = list
    while node:
        print(node.data)
        node = node.next
    print("****")
    print("1:Добавить")
    print("2:Удалить")
    print("3:Показать")
    print("4:Выход")
    answer = input()
    if answer == "1":
        print("Напишите значение")
        list.append(input())
    if answer == "2":
        print("Напишите индекс")
        list.delete(int(input()))
    if answer == "4":
        exit()
