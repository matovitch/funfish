# Funfish

Small set of fish functions to use lambda-like expressions in your fish shell.

## Examples
###### ffwrap
Allows you to wrap a lambda-like expressions and give them a name (a true shame for a lambda) or not.

```fish
> ffwrap 'math @1 + @2' add
> add 2 3
5
```
```fish
> eval (ffwrap 'math @1 + @2') 2 3
5
```
###### ffmap
The usual map from the functional realm.

```fish
> ffmap (ffwrap math @1 + 1) 1 2 3
2
3
4
```
###### ffpart
For crafting a partial application.
```fish
> ffwrap 'math @1 + @2' add
> ffpart 'add 2' add2
> add2 3
5
```
###### fffoldl/fffoldr
foldl and foldr, works as you expect:
```fish
>fffoldl 'echo @1@2' '' a b c
abc
>fffoldr 'echo @1@2' '' a b c
cba
```
