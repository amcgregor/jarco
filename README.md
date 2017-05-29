# jarco

Pluggable project search, path abbreviation, and SCM integration for Zsh, plus one heck of an attractive promptline.vim-inspired prompt requiring a Powerline font.

<img align="center" src="http://s.webcore.io/1n001z2D000j/Screen%20Recording%202017-05-28%20at%2021.26.gif" alt="demonstration of pretty">


## What is jarco, really?

A fairly reasonable Zsh configuration and extension framework. Like a modular web framework for your terminal experience. As a framework it provides a nubmer of built-in tools for a "batteries included" but not quite "kitchen sink" approach to providing a foundation for modular development.

The triggering point for the organization and publication of Yet Another Zsh Framework was trying to debug yet another obtuse bug in portable shell code produced by a Vim plugin for prompt styling—I'm not joking. After breaking things tring to clean it up, I thought starting from scratch would be easier.


### Why not use X instead?

When the code looks like line noise, we grow suspicious. If it's not customizable or easily debuggable, and customization or debugging is needed, we grow frustrated. Jarco tries very hard to separate concerns and keep the line noise to a minimum through:

* Clear separation of configuration, modular themes of several classes, preparation from processing from presentation logic.
* The encouragement of very minimal dependence and highly modular organization.

This allows for friction-free use, customzation, personalization, development, and—diagnostics, should the occasion arise.


### What kind of name is jarco?!

[Jarco](http://vlasisku.lojban.org/vlasisku/jarco) is a word from the constructed language [Lojban](http://www.lojban.org/).  It translates as "is (an agent who/that) shows/exhibits/displays/[reveals]/demonstrates [a property [to an audience]]".  Correct use does not capitalize the name except at the beginning of sentences.

Its etymology is a combination of:

* Chinese: **ja**n**c**u – 展出 – zhǎn chū
* English: **co** – show
* Hindi: prad**arc**an – प्रदर्शन – pradarśana
* Arabic: **ar**d.


## What can it do?

This is not a comprehensive list.

* Kickstart a number of session management tools such as `screen` and `tmux`, or agents such as `gpg-agent` and `ssh-agent` in a simple and context-aware manner.

* Provide a configurable and modular, information-rich greeting and prompt with support for Powerline symbols and both Emacs and Vim bindings.

* Be pretty, with syntax highlighting and customizable color, symbol, and label themes. The latter makes jarco translatable. This styling is modelled on CSS, with cascading defaults and levels of specificity for fine-grained tuning.

* Utilize other awesome Zsh projects as components, including support for more completions than you can shake a stick at.

* Optionally try to keep itself up-to-date, once a week, on first use after 6am Saturday morning, local time. It'll even let you know what's new, or what you're missing out on upstream and should merge.

* Save you time, energy, and frustration by speeding up common activities and correcting your mistakes.

  * Tab-complete (or `^P`) the crap out of anything.
  
  * Never type `cd` again, except to return to the next parent project or home folder.
  
  * Optionally spellcheck filesystem path arguments to commands.
  
  * Automatically jump to project directories by typing their name.
  
  * Reduce RSI through extensive prefix, inline, and suffix aliases, in some cases reducing characters typed by 30%.
  
  * Never manually activate or deactivate a "virtual environment" isolation system again.


## How should I use it?

### The fast path.

> TODO: This hasn't been tested, as there's not content there yet. Feedback welcome on the approach! ;)

```zsh
curl -fsSL jarco.sh | gsed -n '3,/-->/p' | zsh
```

```zsh
curl -fsSL jarco.sh | awk '3,/-->/p' | zsh
```


### The process.

If you only want to use what is provided, you'll need to:

* Make sure you have Zsh and Git.
* Optionally fork the repository, if you intend on making changes.
* Clone the repository into `.zsh`, or add it as a submodule to your dotfiles repository.
* Run Zsh for the first time to answer some hard questions. We'll tell you how to translate some of them into configuration or plugin selection on our side.
* Add a line to the `.zshrc` configuration produced in the previous step.
* Try it out.
* Customize it by populating the `~/.config/jarco/` directory with __stuff__.
* Once happy, change your default shell.

Detailed instructions TBD.


### Making it your own.

You may want to:

* Adjust an existing theme.
* Change the labels (text) presented.
* Adjust the symbols used to represent some elements, such as SCM states.
* Enable or disable features, such as spellchecking or changing which aliases are defined.
* Change the visual look of the prompt elments, such as:
	* The selection of elements presented.
	* The physical arrangement of the elements within the left or right sections.
	* The visual representation of section separators or elements.
* Add your own private themes or plugins.

All of these are adjustments are possible without making any changes to the files within jarco itself by populating the contents of the local configuration directory `~/.config/jarco/`, populating `~/.jarco/`, or modifying `~/.jarcorc`.


## Contributing to the project.

If you want to:

* Help out by fixing a bug or adding a requested feature.
* Share a new theme, function, plugin, etc. with the community.
* Be awesome.

Make sure you star and fork the project on GitHub, make your changes, and submit pull requests.


## Alternatives and inspiration.

I've been using a variety of things patched together for a while.  Some of these include:

* [Oh-My-Zsh](https://github.com/robbyrussell/oh-my-zsh)
* [Prezto](https://github.com/sorin-ionescu/prezto)
* [Alice's Dotfiles](https://github.com/amcgregor/dotfiles/tree/dotfiles/.zsh)
* [Zsh Themes](https://zshthem.es/all/)

In learning how to put this together, many resources were used:

* The `info zsh` command.
* The #zsh on irc.freenode.net IRC channel, and their awesome users.
* https://stackoverflow.com/a/8743103/211827
* https://unix.stackexchange.com/a/22969
* https://pangea.stanford.edu/computing/unix/formatting/
* http://tim.vanwerkhoven.org/post/2012/10/28/ZSH/Bash-string-manipulation
* http://softpanorama.org/Scripting/Shellorama/Reference/string_operations_in_shell.shtml
* http://www.tldp.org/LDP/abs/html/parameter-substitution.html
* https://stackoverflow.com/a/29073092/211827
* http://zzapper.co.uk/zshtips.html
* https://dougblack.io/words/zsh-vi-mode.html
* https://stackoverflow.com/a/3791786/211827
* [https://blogs.oracle.com/breakdown/entry/arrays_in_zsh](https://web.archive.org/web/20131215235617/https://blogs.oracle.com/breakdown/entry/arrays_in_zsh) (Archived)

Pretty prompt defaul visual appearance:

* https://github.com/edkolev/promptline.vim

For Git SCM integration:

* https://git-scm.com/docs/pretty-formats
* https://github.com/jwiegley/git-scripts
* https://gist.github.com/iPenguin/1266869
