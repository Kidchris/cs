def fib_iteration(n)
    fib_liste = [0, 1]

    for i in 0..n
        nv = fib_liste[-2]+ fib_liste[-1]
        fib_liste.push nv
    end
    return fib_liste[n]

end


def fib_recursive(n)
    return 0 if n==0; n==1 ? 1 : fib_recursive(n-1) + fib_recursive(n-2)
end

p fib_recursive(6)
p fib_iteration(6)
