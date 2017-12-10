---
layout: post
title: Arrays in C, C++, and Java
author: familyguy
comments: true
---

{% include post-image.html name="glowing_blocks___v1_by_carlfoxmarten-d5huunv.png" width="150" height="100" alt="glowing blocks" %}

In C, an array can be declared and initialised:
					
{% highlight c %}
#include <stdio.h>

int main() {
	int T[] = {3, 2, 8};
	return 0;
}
{% endhighlight %}

and in Java

{% highlight java %}
import java.util.*;

public class Example {
	public static void main(String[] arg) {
		int[] T = {3, 2, 8};
	}
}
{% endhighlight %}

Not a great deal of difference then.

However, if you tried to access a fourth element of `T`, Java throws an `index out of bounds` exception and the program will not run.

In contrast, in C the program will run (but you may get a warning about the index).

If we displayed the contents of this phantom fourth element of the array, what would we see? Just a random number, as C takes whatever is stored in that memory location at that time.

A more important difference is the way in which Java and C consider arrays.

In Java, an array is an object, predefined for the user. Thus arrays have prebuilt-in attributes and methods, e.g. the length attribute.

In C, however, an array is actually a pointer (OK, apparently this isn't quite true, but we'll take it as a starting point).

Its value is the address of the first element of the array. As an array only stores one kind of data type, and this type and the type's size is known to the compiler, it can deduce the address of the second element of the array from that of the first element, the address of the third element from that of the second, etc.

However, having said that, in Java an object is, in effect, a pointer. The difference is that you cannot manipulate it in the same way that you can in C.

When you create an object `myobj`, the memory labelled `myobj` does not contain the object itself but rather the address where all the information relating to the object is stored.

So when we declare an array like `T` above, the value of `T` is an *address* in memory, and at that address is an array containing the numbers `3`, `2` and `8`. This leads to shallow and deep copying in Java.

Effectively, C and Java treat arrays in the same way in terms of memory.

What's different is how they are presented to the user.

In C, the user is given direct access to the memory. This allows for more control, but means everything is down to the user, e.g. the user has to keep track of the lengths of the array themself.

Whereas in Java, it's classic OOP, the reality of how the array works in memory is hidden from the user, the user cannot directly access the memory, but methods and attributes are predefined to give the user funtionality.

The Java programmer finds they don't have to track things manually anymore, they can hand that over to the compiler, but the price to pay is that they can no longer manipulate the memory directly using pointers as they did before.

To illustrate this

{% highlight c %}
int main() {
	int *T = malloc(3 * sizeof(int));
	*(T + 0) = 3;
	*(T + 1) = 2;
	*(T + 2) = 8;
	return 0;
}
{% endhighlight %}

which is equivalent to the previous declaration above.

Further, the two are interchangeable if entered as arguments to a function.

However, one instance where it does matter whether you use pointer or array notation is when a function returns an array. In such a case, pointer notation must be used e.g.

{% highlight c %}
int * doubleElements(int T[], int lengthOfT) {
	int *result = malloc(lengthOfT * sizeof(int));
	for (int i = 0; i < lengthOfT; i++) {
		result[i] = 2 * T[i];
	}
	return result;
}
{% endhighlight %}

In C++, this is the same apart from one line,

{% highlight cpp %}
int * doubleElements(int T[], int lengthOfT) {
	int *result = new int[lengthOfT];
	for (int i = 0; i < lengthOfT; i++) {
		result[i] = 2 * T[i];
	}
	return result;
}
{% endhighlight %}

However, in Java, there is no pointer notation, so the only option is to make the function return an array object

{% highlight java %}
public static int[] doubleElements(int[] T) {
	int[] result = new int[T.length];
	for (int i = 0; i < T.length; i++) {
		result[i] = T[i] * 2;
	}
	return result;
}
{% endhighlight %}

An important consequence in C/C++ of defining arrays as pointers is that functions with array arguments pass them by reference.

As will be mentioned in a later post, this can lead to significant time and space savings. It also means these functions pass arguments in the same way as they would in Java.

However, this is not always the case. C++ functions pass object arguments by value whereas Java passes them by reference. This is something to note when using dynamic arrays which are objects in both languages.
