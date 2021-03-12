# rubinius {#rubinius}
# Rubinius {#rubinius}

Today on Freenode #ruby-lang, I was talking to "Defiler" about [Rubinius](https://rubini.us). It sounded great. I'm going to look into working on this open source project over the summer, because it seems worth it, and I could end up learning a whole heck of a lot.

Evan, the founder of Rubinius, claims that it is 98% first class. I am interested to find out what that means, but I already know somethings it means. For instance, Methods are first class.

This works:

```ruby
obj.methods[:my_fibonacci] = other_obj.methods[:fibonacci]
```

Also, you can undo the effects of including a module very easily. Defiler says you just remove the module from the "ancestors" of the object and then the include is undone. That's a lot nicer than the messy code I'm going to have to write to undo a 1.8.5 ruby module include.
