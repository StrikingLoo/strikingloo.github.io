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

## Lecture 5 - The Central Bank as a Clearinghouse

You could have a payment system purely based on money: each bank has reserves and any transfer between banks will imply a transfer of reserves (whereas intrabank transfers are free). A credit-based system however would allow you to change deposit amounts without affecting reserves directly. (example with the One Big Bank model).

_Recommended reading: "Chapters on the Theory and History of Banking", Charles F. Dunbar._

When we move to a N-bank system, particularly modeling the interaction between two banks, two possibilities emerge (assuming a credit-based system).

Starting point: Bank A keeps a deposit on Bank B, and there is an equivalent deposit from B in A. Assuming customer α is sending money to customer β, A notifies B and B increases β's deposit (credits β), while A debits α. Then either:

- Bank A increases its B deposit.
- Bank B decreases its A deposit.

The difference is which of the banks shrinks its balance sheet. Though logically both options would be plausible, in real life the accounting is usually kept by the higher ranked bank (e.g. a regional bank keeps a deposit from a local one). If a deposit reaches 0, the smaller bank will increase it again periodically. 

This presents a big convenience advantage over a purely money-based system where banks would have to transfer _reserves_ upon every inter-bank transaction. Note that there is also periodic netting (I guess daily or hourly, though the course doesn't mention it just yet), so that correspondent balances (the interbank deposits) are only updated on checkpoints (reminiscent of [database log flushing](https://strikingloo.github.io/wiki/bases-de-datos-final#recuperacion) -it's in Spanish, gomen ne-).

"You create billateral credit systems so that the reserves don't have to flow".

Originally there were bank hierarchies: hinterland banks < regional banks < NY banks (Citibank, JPMorgan, etc.).

You first net payments to reduce transaction count, then just shift correspondent ballances in the appropriate (ultimately NY) banks. NY Banks need to clear with each other, and that's where eventually the central bank (big clearinghouse) comes in.

The clearinghouse was established by all the big NY banks. It had gold reserves and emitted clearinghouse certificates.

Banks would net all their payments to and from other NY banks, add them all up as if they were too and from the clearinghouse, and finally at end of day would either claim certificates if net receivers, or pay if net payers.

There is a credit expansion over the day that creates elasticity, and then a clearing at the end of the day that creates discipline.

The whole system is elastic, because the clearinghouse provides elasticity. 

If a bank cannot clear with their **clearing certificates** (because they ran out) they may borrow from others (especially, in practice, JPMorgan). If no one wants to lend them, usually for insolvency reasons, that bank has to default and is banished from the system, after which the rest of the members will clear the debts using the gold reserves. This typically would not happen, but is an example of an aggregate of agents being more robust than any individual one and providing security and solvency.

In times of crisis, a feature was added whereby the clearinghouse could provide, with good collateral and high interest (e.g. 6%), **clearinghouse loan certificates** to member banks, which could be used as currency when they were deemed solvent but illiquid.

This sort of 'lender of last resort' system was a precursor to the federal reserve, but it being a mutual association that left other banks out it was not seen as democratic enough, one of the reasons or the creation of the Fed after 1907.

Eventually when the Fed was created, it operated on similar principles. Its reserves (assets) were gold, and its liabilities would be FR notes, and bank deposits (_reserves_).

If a bank cannot meet its requirements (it needs to transfer from bank A to bank B as a net credit, and *it has no balance at the Fed*), it has three options, analogous to those in the clearinghouse:
- Borrow from B (through the fed funds market) -if both want to etc.-
- Borrow from the Fed (discount loans). The Fed expands its balance sheet.
- In case of stress, the Fed can do QE: Give money in exchange for assets (e.g. bonds or MBS).

Note that for most transactions it's just a balance update at the Fed.

What can kill a clearinghouse? Draining its gold. There are two kinds of drains: internal drains (people withdraw money from banks), which can be solved by the Fed and the clearinghouse, and external drains (Bank of Englan want their money back) which necessitate withdrawing actual money (gold) and can cause a _suspension of payment_ whereby the bank simply stops giving out gold at all (thereby breaking the peg). This happens in emergencies.

The C5 banks (which command most of the world economy) are the Central Banks of Switzerland, England, Japan, Europe and the Fed. No mention of China, I wonder if that's still up to date. 

## Lecture 6 - Federal Funds, Final Settlement

Deleveraging: Banks shrink both sides of the balance sheet.

Three relevant markets, each has a different interest rate: Fed Fund market, RP (Repo) market and Eurodollar.

Fed Funds market is an interbank borrowing market, and what they're borrowing are reserves (liabilities of the Fed). Size of 1T in 2012. 

Reserves at the Fed are high-powered money. Fed Funds are interbank promises to pay money. Credit expansion on top of reserves on the Fed, they are assets and liabilities _of the banks_, not the Fed.

As the rate went to 0, the Fed switched tactics towards QE (expansion of the balance sheet) instead.

Two different intermediaries, sort of clearinghouses: a private one (CHIPS) and the Fed.

The Fed has an overnight requirement that all banks' balances be non-negative. Over the day a bank may transfer to another by moving their reserve amounts. If the amount becomes negative they may develop a daylight overdraft, whereupon the Fed does still transfer the money (its own liability, true money) to the receiver. 

On end of day, the bank with an overdraft must settle. They may borrow from the Fed, which will always lend at Fed Funds rate + 100bp, or more conveniently find a lender in the Fed funds market (at the effective fed funds rate). Note that the Fed's punishment for not clearing is not the offender's utter destruction, but just a painful interest rate on the loan, as the Fed is not in the business of making payment harder.

Analogously, members of CHIPS will net their payments over the day (unlike the FED which is real time) and transfer reserves from one bank to another -the assets in CHIPs are collateral of some form-, and if the sender were unable to clear their payment then the other CHIPS members will cover for it (and it's presumably kicked out).

There is elasticity during the day, and contraction at end of day (the survival constraint).

In both cases, when a bank has a deficit, another has a surplus, as this can be modeled as a closed system. Then it becomes a game of finding your counterpart and borrowing, so you can clear (both in CHIPS and at the Fed). In CHIPS, the money market is the eurodollar. Not every bank can be a member of Fedwire/Fed Funds market.

The basic operation is, bank A needs to increase reserves to clear at end of day, so they borrow in the Fed Funds market. Typically an overdraft with the Fed may be small or last very little, as there is a penalty for average overdraft over the day (as another discipline factor). Bank A may borrow from the same bank B to which it needs to pay, and then pay with those same reserves it just got, ending in no net changes of reserves but now bank A owes bank B a Fed Funds to be paid next morning, with the interest.

Worth pointing out: now that there is a market, you may want to trade Fed funds independently of whether you're trying to clear an overdraft. You may just hold and resell for a higher price like any other asset. You become a dealer in the Fed Funds market, with a spread between interest rates so that you collect the difference.

In a transaction between banks, you can have, as a facilitator, either a **dealer** or a **broker**. A broker, like a real estate one, finds two interested complementary parties and helps them meet. A dealer instead takes an intermediary role: both bank A and B can abstract from who the other party in the transaction is, and just trade with the intermediary (e.g. giving them fed funds for money and back).

When too many banks need to borrow reserves and they are scarce, interests go up. The opposite will happen if the market is flooded with money.

The Fed is neither borrowing nor lending in the Fed Fund market (!). It has a target for the Fed funds, but it influences it by manipulating the quantity of reserves in the economy as a whole. Particularly by entering the repo market and using it to increase or reduce the supply of money. This means it needs to anticipate the scarcity of money correctly.

"They change money in order to influence the rate", using **overnight loans** (repurchase agreement loans) that create additional reserves.

The fed emits RP Loans, which a securities dealer may buy to obtain liquid reserves (which they then lend in the fed funds market). By doing this the fed increases the elasticity of the market, creates additional reserves and thus lowers the Fed Funds rates. The rate for Fed Funds market transactions, averaged over the day, is the Effective Fed Fund rate.

The Fed Fund loans are _unsecured_. This means there is no collateral: if you default, the counterpart gets _nothing_. This is risky, and each bank sets rates and decides how much to expose itself to each other bank so as to minimize this risk as per their perception. A bank may refuse to lend to another if it is insolvent, or may demand an intermediary broker to be involved, but a broker may also refuse trades. The repurchase agreements market, in contrast, is a secured loans market (the typical collateral being T-bills), so their loans are more trustworthy.

## Lecture 7 - Repos, Postponing Settlement

In the Repo market, as said above, a bank will sell securities to the fed, with a promise to repurchase them overnight adding an interest rate. The securities in effect are acting as collateral for a loan. Analogously, the money acts as collateral for the securities, if the Fed were to sell them.



