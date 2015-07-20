Roman Numerals Converter
===

This program takes in an Arabic numeral (e.g. 1, 2, 3) and returns its equivalent Roman numeral (e.g. I, II, III).

Docs [here](http://agilekatas.co.uk/katas/romannumerals-kata).

# Building
Dependencies:
- nodejs
- npm
- git
- jasmine (`npm install -g jasmine`)

This should really be automated with Grunt for a one step build and tests...
1. First install all dependencies, then `git clone` this repo, `cd` into it, and run `npm install`.
1. Run `coffee -w -c .` to compile the coffeescript to javascript.
1. Run `npm test` to run the unit tests to make sure everything passes.
