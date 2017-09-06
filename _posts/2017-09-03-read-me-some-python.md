---
layout: post
---

{% include post-image.html name="python-logo.png" width="75" height="50" alt="Python logo" %}

If you're new to Python, or just a bit rusty, here's some code to get into the swing of things (spoiler alert - [Project Euler](https://projecteuler.net/)).

- Multiples of 3 and 5

{% highlight python %}
def f(a, b):
    q = a // b
    return b * q * (q + 1) // 2

def solve(n):
    x = f(n - 1, 3)
    y = f(n - 1, 5)
    z = f(n - 1, 15)
    return x + y - z

n = 1000
print('The solution is {}'.format(solve(n)))
{% endhighlight %}

which is equivalent to 

{% highlight python %}
n = 1000
print('The solution is {}'.format(
    sum(list(range(0, n, 3)))
    + sum(list(range(0, n, 5)))
    - sum(list(range(0, n, 15)))    
)
{% endhighlight %}

as

$$\sum_{k=1}^{n}k=\frac{n(n+1)}{2}$$

- Even [Fibonacci numbers](https://en.wikipedia.org/wiki/Fibonacci_number)

{% highlight python %}
F = [1, 2]
limit = 4000000
S = 0

while F[-1] <= limit:
    if not F[-1] % 2:
        S += F[-1]
    F.append(F[-1] + F[-2])

print('The solution is {}'.format(S))
{% endhighlight %}

- [Collatz conjecture](https://en.wikipedia.org/wiki/Collatz_conjecture)

brute force

{% highlight python %}
N = 1000000
number_of_terms = [0] * (N + 1)

for i in range(1, N + 1):
    current = i
    counter = 1
    while current != 1:
        if current % 2:
            current = current * 3 + 1
        else:
            current //= 2
        counter += 1

    number_of_terms[i] = counter
{% endhighlight %}

< memoization

{% highlight python %}
N = 1000000
number_of_terms = [0] * (N + 1)
number_of_terms[1] = 1

for i in range(2, N + 1):
    current = i
    counter = 1
    while current >= i:
        if current % 2:
            current = current * 3 + 1
        else:
            current //= 2
        counter += 1

    number_of_terms[i] = number_of_terms[current] + counter - 1
{% endhighlight %}


< memoization with recursion

{% highlight python %}
def get_number_of_terms(n, number_of_terms):
    if n == 1:
        result = 1
        number_of_terms[n] = result
        return result
    if n < len(number_of_terms) and number_of_terms[n] > 0:
        return number_of_terms[n]
    if n % 2:
        next_term = 3 * n + 1
    else:
        next_term = n // 2
    result = 1 + get_number_of_terms(next_term, number_of_terms)
    if n < len(number_of_terms):
        number_of_terms[n] = result
    return result

N = 1000000
number_of_terms = [0] * (N + 1)

for i in range(1, N + 1):
    get_number_of_terms(i, number_of_terms)
{% endhighlight %}



