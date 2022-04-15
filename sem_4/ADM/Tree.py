class BSTNode:
    def __init__(self, val=None):
        self.left = None
        self.right = None
        self.val = val

    def insert(self, val):
        if not self.val:
            self.val = val
            return
        if self.val == val:
            return
        if val < self.val:
            if self.left:
                print("На лево")
                self.left.insert(val)
                return
            print("Слева")
            self.left = BSTNode(val)
            return
        if self.right:
            print("На право")
            self.right.insert(val)
            return
        print("Справа")
        self.right = BSTNode(val)

    def delete(self, val):
        if self == None:
            return self
        if val < self.val:
            if self.left:
                self.left = self.left.delete(val)
            return self
        if val > self.val:
            if self.right:
                self.right = self.right.delete(val)
            return self
        if self.right == None:
            return self.left
        if self.left == None:
            return self.right
        min_larger_node = self.right
        while min_larger_node.left:
            min_larger_node = min_larger_node.left
        self.val = min_larger_node.val
        self.right = self.right.delete(min_larger_node.val)
        return self

    def exists(self, val):
        if val == self.val:
            return True

        if val < self.val:
            if self.left == None:
                return False
            return self.left.exists(val)

        if self.right == None:
            return False
        return self.right.exists(val)

print("Введите число чтобы начать работать с бинарным деревом поиска")
tree = BSTNode(int(input()))
flag = 1
while flag:
    print("1:Добавить элемент")
    print("2:Удалить элемент")
    print("3:Найти элемент")
    print("4:Выход")
    n = int(input())
    if n == 1:
        tree.insert(int(input()))
    elif n == 2:
        tree.delete(int(input()))
    elif n == 3:
        print(tree.exists(int(input())))
    elif n == 4:
        flag = 0
    else:
        print("Вы ввели невалидное значени, повторите ввод")