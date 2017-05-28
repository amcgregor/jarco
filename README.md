# jarco

Pluggable project search, path abbreviation, and SCM integration for Zsh, plus one heck of an attractive promptline.vim-inspired prompt requiring a Powerline font.


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

* Save you time, energy, and frustration by speeding up common activities and correcting your mistakes.
	* Never type `cd` again.
	* Automatically jump to project directories by typing their name.
	* If you utilize a "virtual environment" isolation system, never manually activate or deactivate it again.
	* 
* Provide a configurable and modular, information-rich prompt with support for Powerline symbols.
* Be pretty, with syntax highlighting and customizable color, symbol, and label themes. The latter make it translatable.
* Utilize other awesome Zsh projects as components, including support for more completions than you can shake a stick at.
* Optionally try to keep itself up-to-date, once a week, on first use after 6am Saturday morning, local time. It'll even let you know what's new.


## How should I use it?

### The fast path.

If you only want to use what is provided, you'll need to:

* Make sure you have Zsh and Git.
* Optionally fork the repository, if you intend on making changes.
* Clone the repository into `.zsh`, or add it as a submodule to your dotfiles repository.
* Run Zsh for the first time to answer some hard questions.
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


## Contributing

If you want to:

* Help out by fixing a bug or adding a requested feature.
* Share a new theme, function, plugin, etc. with the community.
* Be awesome.

Make sure you star and fork the project on GitHub, make your changes, and submit pull requests.
