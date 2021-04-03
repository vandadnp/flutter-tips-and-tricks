# Table of Contents

* [`rethrow`ing Exceptions in Dart]()
* [`mixin`s and JSON Parsing in Dart](https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/README.md#mixins-and-json-parsing-in-dart)
* [`mixin`s vs `abstract class`es in Dart](https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/README.md#mixins-vs-abstract-classes-in-dart)
* [Drawing Shapes in Flutter with `LayoutBuilder`, `CustomPaint` and `CustomPainter`](https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/README.md#drawing-shapes-in-flutter-with-layoutbuilder-custompaint-and-custompainter)
* [Generic Type Aliases in Dart](https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/README.md#generic-type-aliases-in-dart)
* [Callable Classes in Dart](https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/README.md#callable-classes-in-dart)
* [Synchronous Generators in Dart](https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/README.md#synchronous-generators-in-dart)
* [Implicit Interfaces in Dart](https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/README.md#implicit-interfaces-in-dart)
* [`const` Constructors in Dart](https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/README.md#do-you-know-how-const-constructors-work-in-dart)
* [`async`-`await` Over Raw `Future`s in Dart](https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/README.md#did-you-know-that-in-dart-it-is-actually-preferred-to-use-async-and-await-over-using-raw-futures)
* [Initializer List and Default Values as Convenience Intializers in Dart](https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/README.md#in-dart-you-can-use-a-combination-of-initializer-list-plus-default-values-for-your-class-member-fields-to-create-elegant-and-handy-convenience-initializers)
* [Extract Elements of Certain Type from Lists in Dart](https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/README.md#did-you-know-that-in-dart-you-can-extract-elements-of-a-certain-type-from-your-lists-using-the-wheretype-generic-function-instead-of-calculating-the-equality-yourselves)
* [Type Promotion in Dart](https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/README.md#do-you-know-about-type-promotion-in-dart)
* [Extract Minimum and Maximum Values in `List<num>` in Dart](https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/README.md#4-lines-of-dart-code-that-include-the-spread-operator-cascade-operator-generics-extensions-private-prefix-and-getters)
* [Functions as First Class Citizens in Dart](https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/README.md#functions-as-first-class-citizens-in-dart)

# `rethrow`ing Exceptions in Dart

![](images/rethrowing-exceptions-in-dart.jpg)

# `mixin`s and JSON Parsing in Dart

![](images/mixins-to-download-json.jpg)

# `mixin`s vs `abstract class`es in Dart

![](images/mixins-vs-abstract-classes-in-dart.jpeg)

# Drawing Shapes in Flutter with `LayoutBuilder`, `CustomPaint` and `CustomPainter`

![](images/drawing-shapes-with-layoutbuilder.jpeg)

# Generic Type Aliases in Dart

![](images/generic-typealiases.jpeg)

# Callable Classes in Dart

![](images/callable-classes.jpeg)

# Synchronous Generators in Dart

![](images/synchronous-generators.jpeg)

# Implicit Interfaces in Dart

Did you know that in #Dart, every #class implicitly exports an #interface that can be #implemented (as opposed to #extended) by other classes? This is called "implicit interface".

![](images/implicit-interfaces.jpeg)

# Do you know how "const" constructors work in #Dart?

![](images/const-initializers.jpeg)

# Did you know that in #Dart, it is actually preferred to use #async and #await over using raw #Futures?

![](images/downloading-and-parsing-json.jpeg)

# In #Dart, you can use a combination of #Initializer #List plus default values for your class #member #fields to create elegant and handy convenience initializers

![](images/initializer-list-combined-with-default-values-for-member-fields.jpeg)

# Did you know that in #Dart, you can extract elements of a certain type from your Lists using the #whereType<T> #generic #function instead of calculating the #equality yourselves?
  
![](images/checking-for-type-equality-in-dart-lists.jpeg)

# Do you know about #Type #Promotion in Dart?

"address" is an optional field of the "Person" class. If you look at the "doThis()" function you see that I'm saving the value of address in a local variable and then comparing it with null and then returning if it's null. The Dart compiler is intelligent enough to understand that after the if-statement, "address" is NOT null anymore since you've already compared it with null and returned from the function.

If you look at the "insteadOfThis" function, the first one, the Dart compiler cannot make the same assumption if you don't first store the value of address in a local variable. In that first function the Dart compiler, even after the if-statement, needs you to refer to address as an optional, using "address?" syntax.

The mechanism the Dart compiler uses in the "doThis()" function is called Type Promotion.

![](images/type-promotion-with-sound-null-safety.jpeg)

# 4 lines of #Dart code that include the #spread operator, #cascade #operator, #generics, #extensions, #private prefix and #getters

![](images/min-max-extension-on-list.jpeg)

# Functions as First Class Citizens in Dart

![](images/functions-as-first-class-citizens.jpeg)
