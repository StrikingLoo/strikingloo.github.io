---
layout: post
title: "Draft / Limited Play - Magic: the Gathering"
date: 2024-12-07
tags: mtg, games, fun
description: "Guides to Magic: the Gathering drafting"
abstract: "These are my notes and excerpts from guides that go a little beyond the classic BREAD advice (which seems to be considered somewhat passé in the current meta)."
language: English
importance: 6
---

## CABS - Board Affecting Cards or Nothing

Cards Affecting Board State (CABS) are, in order of descending importance, **creatures**, **removal**, **combat tricks**.

You should try to create a simple, well-curved, 2-color beatdown deck based on only these kinds of cards.

Life gain, combos, gimmicks, nice uncommons that require gymnastics to trigger, powerful but complex enchantments, should not be prioritized and ideally completely avoided. Just play creatures following a good curve, and use removal to control the board. It is not optimal but it is leaps beyond people not following this advice (including forcing them to mulligan too much).

> You want cards that are consistently good rather than cards that are sometimes very good but sometimes very bad.

> You will avoid card-draw spells, build-around-me enchantments, counterspells, life gain spells, and the like.

15\~18 creatures.

_[CABS Theory](https://magic.wizards.com/en/news/feature/cabs-theory-2015-08-19)_

## How to Build a Mana Base

Platonic Ideal deck: follows a curve of {2, 7, 6, 4, 3, 1} (no more than 1 card with cost >5. 7 of cost 4 or 5). 17 land, 16 creatures, 7 spells. Note that this aligns pretty well to the CABS deck described above.

_[How to Build a Mana Base](https://www.reddit.com/r/magicTCG/comments/hdv5jz/limited_how_to_build_the_mana_base/)_ by /u/Reitsch_

## BREAD Has Partly Outlived its Usefulness

> BREAD becomes less helpful once you have some experience under your belt. BREAD is vague and generally misses many ways Limited games are won. What is a Bomb card? BREAD doesn’t go into any depth or description of this. It also places a huge emphasis on Removal and Evasive creatures. While these can be great picks, they miss the fact that so many Limited games are won and lost on board presence and creatures.

Other ways to measure cards' worth are: Vanilla test (an X/X for X mana, + value for keywords), Quadrant Theory (does the card help in Opening, Parity, Winning or Losing?), [CABS theory](#cabs---board-affecting-cards-or-nothing).

For Quadrant Theory, it helps to think how a card would help in each of the phases: Opening for the early game, Parity when the initial hand is played and we're in the midgame, acting on draws, Winning for finishers that do the last mile, or Losing for disrupters if the opponent has the upper hand.

_[Everything You Need to Know About BREAD in MTG - Draftsim](https://draftsim.com/bread-mtg/)_

### Drafting the Correct Way

If you're picking cards from two colors and a very good card of a third color appears on the fourth pick, what do you do? This question reminds one of the [explore-exploit trade-off](/wiki/reinforcement-learning-sutton#multi-armed-bandits).

> I don’t want to get too bogged down on definitions, but, at its core, the philosophy is about immediate gains (the card that makes your deck the best now) versus possible future gains (the card that might allow you to play a more powerful deck down the line). It’s not only “red card” versus “blue card” – it’s “solidifying yourself in a red deck” versus “leaving the door open to playing a blue deck”

(Note the explore-exploit trade-off plus greedy vs more diversified strategy)

I see [CABS](#cabs---board-affecting-cards-or-nothing) as a simple heuristic to go for a relatively greedier approach and prefer it whenever possible.

> If you take the **Red card**, you will have selected a card that you will very likely play, and it will **likely improve the final product** (whereas with the Blue card you’re specifically selecting a card that you will likely not play, and making your deck weaker in the process).<br>You also **cut red more, so you lower the risk of your neighbor deciding to move into Red** and getting your cards in pack two.

> If you pick the Blue card, you lose all of the above, but you gain in future possibilities.<br>You are basically paying a price from your Red deck for the potential to end up with a completely different deck that is better. Maybe, just maybe, there is a super strong Blue deck for the grabs on the table, and, if you take the Blue card here, that deck can be yours.

> The reality is that you should draft the Correct Way, and sometimes that’s going to be the Easy Way, sometimes it’s going to be the Hard Way. Pigeonholing yourself to either of these strategies upfront is inevitably going to lead to failure, because the correct way to draft changes, depending on a variety of factors that are unique to each specific format and situation.

> Contrast \[picking 3 cards of each color] to someone who has ten Red cards at the end of pack one, and it’s easy to see which person is more likely to have a train-wreck. So the reason to stay open is not to avoid trainwrecks, but to reap the rewards of powerful picks very late.

He mentions the value of a card is its value above replacement (delta between a card and the next best thing you already have), so experimentation carries a smaller risk than would be estimated by naively subtracting the value of the entire card. Expected value of a card is its abstract value times chance of playing it.

> Factor 2: How replaceable is a particular effect in the format?

> Factor 3: How synergy based is the format?

> As a general rule, the more synergy based a format is, the more it pays off to speculate, because that’s when you really reap the rewards of being in the open colors.

It mentions if you find a specific archetype that no one is picking, such that its common cards are very good, it justifies exploration much more.

> Factor 4: How good is what you already have, and how flat is the power level of the rest of the set?

You basically have more reason to commit if you have picked better cards so far.

[Drafting the Correct Way - Paulo Vitor Damo da Rosa](https://www.threeforonetrading.com/en/drafting-the-correct-way)
