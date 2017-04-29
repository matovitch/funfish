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
> ffmap (ffwrap 'math @1 + 1') 1 2 3
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
###### fffoldl and fffoldr
foldl and foldr, works as you expect:
```fish
>fffoldl 'echo @1@2' "" "is" " Yoda " "a great jedi"
is Yoda a great jedi
>fffoldr 'echo @1@2' "" "is" " Yoda " "a great jedi"
a great jedi Yoda is
```
###### ffcpl and ffcpr
These are for left and right compositions (takes an arbitrary number of functions).
<pre>
> ffwrap 'echo @2 | grep @1' match
> ffpart 'match "tes"' match_tes
> ffpart 'match "es"' match_es
> eval (ffcpl match_tes match_es) "test"
t<b>es</b>t
> eval (ffcpr match_tes match_es) "test"
<b>tes</b>t
</pre>

###### ffpipe

```fish
> echo "2 3" | ffpipe (ffwrap 'math @1 + @2')
5
```
