Alchemist
=========

An Elder Scrolls Online addon for alchemists!

What does it do?
----------------

This addon tells you which alchemy reagents (in your current inventory/bank) to combine, and in what order, to get the maximum number of new traits.

If there's no unknown traits available to be discovered, it will tell you that as well.

How does it work?
-----------------

The addon will activate as soon as you interact (click on) an Alchemy Station. When you do that, an extra window will open up with a list of optimal reagent combinations, in order.

<img src="http://i.imgur.com/ue3qn6F.png" width="700px" alt="Screenshot" />

Changelog
---------

### 0.08

- Complete rewrite of localization code. Should be easier to do translations for reagents and traits now.
- Removed combinations of three reagents. Will put it back at some point, hopefully!

### 0.07

- Fixed yet another german translation error.
- Fiddled some with the UI.

### 0.06

- Alchemist now supports combinations of up to three reagents, if you have the passive "Laboratory Use" (*Allows the use of up to 3 reagents while mixing Potions.*)

### 0.05

- Fixed errors in both french and german translation.
- Better error messages when Alchemist finds traits that are spelled differently.

### 0.04

- Fixed issues with both german and french translations of reagents and traits.
- Better error messages when Alchemist finds reagents that are spelled differently.

### 0.03

- Added support for french language.

### 0.02

- Added support for german language.


TODO / ideas
------------

- Support three reagent combinations (for "Laboratory Use" passive). The code does support it, but the current algorithm is too slow (on slow computers.)

- It would be nice if you could tell it what types of potions you are interested in creating, in a prioritized list, and let the mod see what's available and not.

- Prettier UI. Show reagent and trait icons, hover effect tooltip, use table instead of list.

- Make it possible to click on the Alchemist window to automatically craft the selected item.

You got another idea? Send me a message on [http://www.esoui.com/downloads/info120-Alchemist.html#comments](ESOUI)!
