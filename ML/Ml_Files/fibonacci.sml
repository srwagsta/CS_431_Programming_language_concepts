val rec fib = (fn n => if n = 0 then 1 else n + fib(n-1));

fib 5;