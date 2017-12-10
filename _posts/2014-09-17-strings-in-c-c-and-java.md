---
layout: post
title: Strings in C, C++, and Java
author: familyguy
comments: true
---

{% include post-image.html name="scrabble-148970_640.png" width="90" height="60" alt="Scrabble tiles" %}

There are a few noteworthy differences between Java and C++ strings (C strings will be less mentioned as they are quite outdated and more awkward to manipulate).

In Java, a string is nothing more than a sequence of characters.

Thus whilst it can be tempting to create them using the primitive data type `char`, this makes life unnecessarily difficult as there is a predefined `String` object.

When using `Strings`, you cannot write

{% highlight java %}
public class Example {
	public static void main(String[] arg) {
		String str = "today";
		System.out.println(str[0]);
	}
}
{% endhighlight %}

as the square bracket notation only works for arrays.

The correct way to write this is

{% highlight java %}
public class Example {
	public static void main(String[] arg) {
		String str = "today";
		System.out.println(str.charAt(0));
		str.charAt(0) = `T`;  // errors
	}
}
{% endhighlight %}

The additional line at the end is incorrect and illustrates how strings shouldn`t be viewed as an array of characters.

So how *does* the Java interpreter view them?

Consider

{% highlight java %}
public class Example {
	public static void main(String[] arg) {
		String str1, str2;
		str1 = "today";
		str2 = str1;
		str1 = "tomorrow";
	}
}
{% endhighlight %}

`str1` is a pointer pointing to a string literal.

When the value of `str1` is assigned to `str2`, a pointer is assigned, i.e. `str1` and `str2` point to the same string literal.

What happens at the last line? One might suppose the chunk of memory housing the string literal `today` now houses instead `tomorrow`, and both `str1` and `str2` point to `tomorrow`.

Wrong.

`str1`, in fact, now points to a new address housing `tomorrow`. Meanwhile `str2` continues pointing to the same address housing `today`.

Why is this? The `String` object is *immutable*. Once created at an address, it cannot be modified (however, if the number of variables pointing to that address drops to zero, then the memory is reclaimed or "garbage collected").

Hence all predefined methods on the `String` object leave the receiver object unchanged. If the method needs to make changes, a new string is created and returned.

Consequently, it is not possible to write a function that reverses a string in-place in Java. You can, however, write such a function for an array as they are mutable. When reversing a string, the result must be returned

{% highlight java %}
public static String reverse(String str) {
	String result = "";
	for (int i = 0; i < str.length(); i++) {
		result += str.charAt(str.length() - 1 - i);
	}
	return result;
}
{% endhighlight %}

Do strings work the same way in C++?

Not exactly

{% highlight cpp %}
int main() {
	std::string str = "today";
	std::cout << str[0] << std::endl;
	str[0] = "T";
	std::cout << str << std::endl;
	return 0;
}
{% endhighlight %}
Using square brackets is OK.

We can also use

{% highlight cpp %}
str.at(0)
{% endhighlight %}

which is less intuitive but has the advantage of throwing an exception if the index supplied is out of range.

Viewing a string as an array of characters works and strings are mutable

{% highlight cpp %}
void reverseInPlace(std::string& str) {
	char tmp;
	for (int i = 0; i < str.length() / 2; i++) {
		tmp = str[i];
		str[i] = str[str.length() - 1 - i];
		str[str.length() - 1 - i] = tmp;
	}
}
{% endhighlight %}

Reminder: C++ objects are passed by value and not reference like in Java.

Strings then seem easier to work with in C++ than Java.

However, whilst

{% highlight java %}
System.out.println("hello" + ", goodbye");
{% endhighlight %}

in Java displays `hello, goodbye` as expected, in C++

{% highlight cpp %}
std::cout << "hello" + ", goodbye" << std::endl;
{% endhighlight %}

errors.

One has to write instead 

{% highlight cpp %}
std::cout << std::string("hello") + ", goodbye" << std::endl;
{% endhighlight %}

as string literals in C++ are actually old style C strings.

The overloaded operator `+` expects C++ string objects as arguments.

However, if only one of the arguments is a C++ string object, that is good enough as the other argument is then converted.

Also, when declaring a string object and initialising its value with a string literal, the compiler automatically converts the old C style string literal into a C++ string object.

Further, this kind of conversion is carried out systematically, i.e. whenever the compiler sees that the user wants a C++ string object rather than a C string.
