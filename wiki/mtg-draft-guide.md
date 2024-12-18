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

> Factor 1: How Deep is the Card Pool in the Format?

> Factor 2: How replaceable is a particular effect in the format?

> Factor 3: How synergy based is the format?

> As a general rule, the more synergy based a format is, the more it pays off to speculate, because that’s when you really reap the rewards of being in the open colors.

It mentions if you find a specific archetype that no one is picking, such that its common cards are very good, it justifies exploration much more.

> Factor 4: How good is what you already have, and how flat is the power level of the rest of the set?

You basically have more reason to commit if you have picked better cards so far.

[Drafting the Correct Way - Paulo Vitor Damo da Rosa](https://www.threeforonetrading.com/en/drafting-the-correct-way)


### Drafting the Hard Way

> The single thing people do that ruins most drafts is stick to their early picks. In the vast majority of draft formats, you should be trying to figure out what is underdrafted at the table so that you can have access to a lot of what you are looking for in packs two and three. Also, by identifying which colors or archetypes the people to your right aren't playing, you end up having several packs to get incredibly powerful picks from. If you stick to your first picks, you often end up with few packs to select first-pick quality cards from.

(...)

> A perfect example of this is DGR if you start out in a Gatecrash guild. Since you don't care much about pack three, and pack two is your entire world, if your first two picks put you into a specific Gatecrash guild, you can just jam that guild and not bother to read what the people passing to you are playing, or what is being underdrafted in the pod, since you basically live and die by only pack two, and you are only looking for strong cards out of the first few picks of pack two. Draft formats where this is correct like DGR are few and far between though.

> Going for a combo or cards without synergy that don't fit their deck's plan, or are difficult to cast but have a high power level. (...) You don't need to be in the best color or archetype, you don't need a way to win, you don't even need particularly powerful cards to win. If your deck is fully functional, meaning the cards you do have work together, your curve is good for the format, and your mana allows you to cast your spells when you need to cast them (some formats you are under more pressure (Gatecrash), some you have a little more time (Rise of Eldrazi), that is good enough to allow you to 3-0 any pod.

> When you have good, fully functional draft decks, it is very easy to beat a better deck. When you have trainwrecks/bad draft decks it is very difficult to beat anyone.

Bottom line: 

> if you are willing to read every draft, be open to drafting whatever archetype is available that draft, and even drop bomb-rare first picks, you can put together a good draft deck in almost every draft you do and you can be a highly successful booster drafter.

[Drafting the Hard Way](https://www.channelfireball.com/article/Stark-Reality-Drafting-the-Hard-Way/397b71cd-11d4-4644-9e77-5c08846d30c0/)


### _Required Reading_ by DoggertQBones

> The Game Plan System is a way of approaching Magic that is broken down into two large segments: the thought process and the knowledge base. The thought process is how you think about Magic when you’re playing, and the knowledge is as it sounds, knowledge of a deck, metagame, play patterns, etc.

> Although both are important, I think the thought process is the more important of the two as well as being significantly harder to grasp. The knowledge is generally easier (...) The thought process though, can only be achieved through constant and meticulous effort to change the way you naturally want to go about Magic.

He contrasts trying to 'have the best turn possible' every turn with actually playing optimally (basically taking a greedy approach vs a long term one). Instead of what the best play is, thinking 'how do I win this game?'.

> When I started to learn how to play Control decks years ago, I was terrible at them, but not for the reason you’d assume. I timed my spells well, I used my interaction well, I was answering my opponent’s game plan quite well even when I had little experience with the archetype. Then why was I so bad? I didn’t know when to “flip the switch” as I just assumed Control is all about controlling the game.

> I ask how I \[can win the game], I consider the general matchup conventions at play, I evaluate the board state and my hand to figure out what I need to happen to win, and I execute that plan with my available resources.

He basically boils planning down to
- Matchup conventions
- How do I win?
- How does the opponent win? (or rather, 'How do I lose?')

[How to Think in Game Plans](https://mtgazone.com/required-reading-the-best-magic-advice-youll-ever-get-how-to-think-in-game-plans/)