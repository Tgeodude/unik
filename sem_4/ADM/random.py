 int[n] randomPermutation(a: int[n]):
   for i = n downto 1
     j = random(1..i)
     swap(a[i], a[j])
   return a
