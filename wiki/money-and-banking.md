---
layout: post
title: "Economics of Money and Banking - Peter Mehrling"
date: 2023-08-09
tags: economics, macroeconomics, banking, finance
description: "Notes on the MOOC by Peter Mehrling about Money and Banking"
language: English
importance: 4
---

> "All banking is a swap of IOUs."

## Lecture 1 - 4 Prices of money

- **Par** : The present (should be fixed so a buck is a buck no matter where you are).
- **Interest Rate**: The future: how many bucks will I have after I deposit X bucks for Y time?
- **Foreign Exchange**: self explanatory.
- **Price Level**: tied to things and their value, will not be covered as deeply on this course.

When looking at a bank, we check assets (like bonds and credit) and liabilities (like, crucially, money from depositors). A bank is **solvent if assets > liabilities**. A bank has **liquidity if it has enough money to 'clear' the day**, which is a day-to-day duty.

The course thinks of liquidity first, as opposed to starting from solvency. Shadow banks are a solution to the problem of liquidity. 

**Shadow Bank**: an entity that holds short-term assets with as little risk as possible, which they can use as collateral to acquire liquidity (borrowing from the money market -mutual funds, corporate investors-) to then provide to banks. The money running through shadow banking is bigger than through 'regular' banking.

## Lecture 2 - Hierarchy of money

Hierarchy of financial instruments
- Gold (Ultimate money)
- Currency -internal to a country-
- Bank Deposits (promises to pay currency)
- Securities (any other kind of credit, like a loan)
What counts as money and what as credit depends on your level of operation: to a bank, only gold and currency is money, to a company it's a deposit and upwards.


### Hierarchy of Financial Institutions

In an idealized Victorian, Gold-standard system with no shadow banking.
- Central bank (has gold as asset, currency as liability)
- Banking system (asset: currency, liability: deposits)
- Private sector (asset: deposits -also securities-, liability: securities)
All money is somebody's promise, but gold is the asset that is no one's  liability.

If you map out a pyramid where gold is the apex, and securities the base, it gets wider as you go down and it has liabilities on the right and assets on the left, then what you see is it expands and contracts cyclically over seasons (days, weeks, etc.). It looks like it's organically breathing.

The pyramid expands in booming periods, and contracts in recessions. When it expands, credit 'looks more like money' and when it contracts the difference becomes starker. I am guessing if you raise interest rates, this pyramid also contracts.

Principle of Elasticity (of derivatives) vs Principle of Scarcity (at the top of the pyramid) or Discipline. You could look at a system and say it is more disciplined or more elastic at a point in time. 

**Market makers**: For each level of the hierarchy there's a "market maker": central banking for gold to currency, banking system strapped between currency to deposits,  and security dealers between deposits and securities.

When a market stops functioning for lack of elasticity, the central bank, which is the only market-making institution that isn't solely motivated by short term profit, may step in and provide liquidity in exchange for securities.

Things a central bank does:
- Defend the exchange rate
- Maintain par (provide liquidity when there is a liquidity crisis, e.g. if people are doing runs on the banks they may provide more money).

As per **Bagehot**, the central bank needs to _"Lend freely at a high interest rate, against good collateral"_ during crises. This is what the Bank of England was already doing organically, but not explicitly. Bagehot brings it to public consciousness. 

Countercyclical policy (raise interests when the economy is too boomy, lower them when it contracts too much) and financial policy (regulating banks to e.g. maintain standards of solvency) comes from this fact (the central bank will be responsible on the ultimate crisis, so let's prevent it). 

Monetary policy, by way of changing interest rates, aims at making the system more/less elastic. 

The Fed regulates overnight interest, whereas the market sets the price of long term bonds. You may for instance raise interest of overnight lending above 30-year one, in which case you'll see a huge contraction, or just raise or lower a little to make small impact. 


### Lecture 3 - Money and the State: Domestic

Before the Fed, you had regional or local banks, but no central one. The big banks in NY (especially JP Morgan) served as de facto central banks in that they acted as intermediaries for international commerce. There was the **gold standard**, and banks were forced to deposit reserves in reserve banks, which in turn had theirs in NY banks.

In the Civil War, the state withdrew all gold from the banking system (!) to use for international purchases (presumably of war equipment), and started printing legal tenders, which were by law to be accepted as currency, but internationally devalued fast as they were not exchangeable into gold.

Eventually the supply of tenders was too big and the government switched tactics towards giving bonds to banks that could be used as collateral to emit currency. This means independent of the emitting bank, the bank notes could be exchanged (presumably at some government office) for bonds. From this point up until the creation of the fed, the national **base money supply was fixed**. 

Fast forward to 1907. There was a seasonal component to liquidity due to the economy being mostly agricultural, whereby on harvest time farmers would withdraw their deposits to do farm stuff. This forced the long tail of small banks to withdraw reserves from regional banks, that withdrew from NY banks in turn. Thus, once a year there would be a liquidity crunch, asset prices would fall (due to worse access to credit and speculators having to sell to give back loans to farmers) and the effects would ripple to the international (British) financial system.

### Federal Reserve

The Fed was partly created as a response to this, by Woodrow Wilson right before WWI.
The hierarchy of banks becomes
- Federal Reserve
- Reserve Banks
- Member Banks
> An agricultural country has a seasonal, yearly fluctuation of the demand of bank notes and deposits. Let us then seasonally adjust the supply.

The mechanism by which this is made is: member banks loan to Main Street freely, and don't need to worry about liquidity: they can acquire bank notes from reserve banks, borrowing them with their discounted loans as collateral. The reserve banks at the same time can use the discounted loans as collateral to borrow from the Federal Reserve, from which they may obtain bank notes, which they then provide to member banks completing the process. This way the supply of bank notes can adjust to demand. 

The fact that the Fed ended up swamped in Treasury Bills instead of being mostly full of Main Street loans is a historical accident, and not something envisioned by its framers. It's due to the need for financing WWI and it stuck.

## Lecture 4 - The Money View, Micro and Macro

**Minsky hypothesis**: the financial system is inherently unstable (swinging from too contracted to too elastic), and it is the banker's job to vie for stability in its swing.

This lecture first proposes a very simple, finite money-only system where the only two individuals can trade using IOUs for goods, to solve for the seasonality of their production, assuming they can trust each other.

The pool of IOUs is fixed, and so in a case of disparity a liquidity problem may emerge. Alternately, we may propose an intermediary that holds the IOUs and emits its own liabilities, even for more than 2 actors. These liabilities in the form of credit are functionally money, and they are backed by the IOUs, but unlike the model before the outstanding deposits may grow indefinitely (up to a borrowing limit per actor). This credit system is how the payment system works, even today, though it now has much more complexity. Credit is necessary in order to facilitate elasticity. 

Minsky proposes analyzing the economy by looking at units in terms of cash flows (ignoring goods). Units include households, banks, the State, etc. The emphasis, as expected given the background of the course, is in liquidity, rather than solvency, and especially in the strong liquidity constraints imposed on e.g. households and businesses. 'Your wealth doesn't matter if you can't pay -- Liquidity kills you quick'.

Survival Constraint: Cash inflow > Cash outflow.

### Flow of Funds

- Every use has a source (in the same chart)
- Every agent's use is another's source (inter chart)
A little chart with columns: \[uses, sources\] and rows: \[goods & services, assets, liabilities, money\] plus corresponding verbs to source and use. 

At the time of an outflow, it is optimal to pay with cash reserves (discipline principle) but we generally want to use the elasticity afforded by credit. Thus we may instead borrow, or sell assets to pay. However money is the only payment we can take without depending on a counterpart.


### Financial Fragility

Several firms may have the same net worth (and all be solvent) and yet face different liquidity constraints. E.g. 1 bank that needs to deposit X overnight every night and knows its cash flow will be 2X/day faces no liquidity constraint. If instead it needed to do just one 3X deposit the first day (and no others), it would need to somehow come up with the money to do it.

Thus we may see equally solvent firms behaving differently due to solvency, and as a response to how aligned their future flows are. This is partially known at any point as they have different bonds, loans, etc. Note that their creditors also know this and will adjust their own behaviors accordingly, adding complexity to the market.

It is a reasonable claim that the money market interest rate is a good measure of how solvent the entire system is at any given point: if too many firms are facing constraints, it will shot up, and the opposite happens if there is enough money in the market.
