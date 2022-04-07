class Tree:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None
        self.parent = None
    def append(self, val):
        end = Tree(val)
        n = self
        flag = 1
        if n.left and not n.right:
            if val >= n.left.data:
                n.right = end
            else:
                n.right = n.left
                n.left = end 
        while n.left and n.right:
            if val <= n.left.data:
                n = n.left
            elif val >= n.right.data:
                n = n.right
        if not n.left and not n.right:
            n.left = end
        elif n.left and not n.right:
            if val >= n.left.data:
                n.right = end
            else:
                n.right = n.left
                n.left = end
    