# Funfish

Small set of fish functions to use lambda-like expressions in your fish shell.

## How do I get it ?

With [fisherman](https://github.com/fisherman/fisherman), simply do:

```
fisher matovitch/funfish
```

Our without...not really recommended, but something like this should:

```
git clone https://github.com/matovitch/funfish
cat funfish/*.fish >> config.fish
```

## How does it work ?
##### ffwrap
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
Note: You can use `@1` to `@9`, and use `@@` to denote the full list of arguments.
##### ffmap
The usual map from the functional realm.

```fish
> ffmap (ffwrap 'math @1 + 1') 1 2 3
2
3
4
```
##### ffpart
For crafting a partial application.
```fish
> ffwrap 'math @1 + @2' add
> ffpart 'add 2' add2
> add2 3
5
```
##### fffoldl and fffoldr
foldl and foldr, works as you expect:
```fish
>fffoldl 'echo @1@2' "is" " Yoda " "a great jedi"
is Yoda a great jedi
>fffoldr 'echo @1@2' "is" " Yoda " "a great jedi"
a great jedi Yoda is
```
##### ffcpl and ffcpr
These are for left and right compositions (takes an arbitrary number of functions).

```fish
> ffwrap 'echo @2 | grep @1' match
> ffpart 'match "tes"' match_tes
> ffpart 'match "es"' match_es
> eval (ffcpl match_tes match_es) "test"
```
<pre>t<b>es</b>t</pre>

```fish
> eval (ffcpr match_tes match_es) "test"
```
<pre><b>tes</b>t</pre>

##### ffpipe
A pipe to connect to other shell commands.
```fish
> echo "2 3" | ffpipe (ffwrap 'math @1 + @2')
5
```

#### Small trick for currying

If you want to use the string  `"@1"` in a `ffwrap(ped)` expression, you need to escape it like so:

```fish
> eval (ffwrap 'echo "escapedAt\@123.org"')
escapedAt@123.org
```

But you can use this escape mechanism to get curryfied functions:

```fish
> ffwrap 'ffwrap "echo \@@ | grep @1"' curryfied_match
> eval (curryfied_match "Curry") "Haskell Curry"
```
<pre>Haskell <b>Curry</b></pre>
