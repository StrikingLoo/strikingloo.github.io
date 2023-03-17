---
layout: post
date: 2022-08-29
title: "Macroeconomics (Notes on MOOC by MRU)"
tags: mooc, economics, macroeconomics, gdp, world modeling
description: "Notes for the course on Macroeconomics by Marginal Revolution University. GDP, banking, the financial system and more."
abstract: "Notes for the course on Macroeconomics by Marginal Revolution University. I went through the course during the first week of September, 2022."
language: English
importance: 7
---

## GDP

GDP is the sum of **market prices** of all **finished** goods and services **produced in the country**.

Real GDP per capita is defined as GDP calculated using current prices (over time, so inflation is taken out), divided by population. It is a noisy measure of living standards. Real GDP per capita falls on recessions, which usually coincide with a peak in unemployment.

GDP can be analysed using two approaches. **The national spending approach** divides GDP into three categories: **government purchases** (government buying goods or services), **investment** (businesses buying assets that produce value) and **consumption** (consumers buying goods or services), which add up to total GDP - net exports (a last category).

**Factor income approach** divides GDP into **compensation, rent and profits**. This is equivalent to NS, but empirically measurement error will create slight mismatches. In practice we are measuring flow inward or outward.

## Wealth of Nations

There are huge GDP per capita differences between countries. These are caused by a myriad of factors.

Some factors that led to the huge growth the world's economy has had since the [industrial revolution](/wiki/industrial-revolution) are institutional (property laws, honest courts and government, rule of law), others social (appreciation for innovation, entrepreneurial spirit) and some economic (access to energy or education).

Additionally, a country's wealth correlates with its access to water, which makes trade much easier. In a map, having any water body nearby increases gdp per capita, and landlocked countries have a huge penalty to trade.

Factors of production: ideas, capital and people. These can be improved through incentives.

Institutionally, some important factors are property rights, good incentives, political stability, honest government, a dependable legal system and competitive and open markets.

## Growth and Capital Accumulation

### Solow Model

The **Solow model of economic growth** tries to address why WWII losers like Germany and Japan grew much faster than established powers like the UK and USA. The model makes a distinction between catching-up growth and cutting-edge growth.

It takes as inputs "AeLK": Innovation, human resources (education * labor) and capital, which are the **factors of production**.

**Iron Logic of Diminishing Returns**: Output grows diminishing but monotonic as a function of capital. The marginal product of capital diminishes but is never zero. E.g., output is logarithmic or square-root of capital.

**Depreciation**: Modeled as linear on the capital (**not** on the output), it dictates a _steady-state_ where it matches investment. Investment is assumed linear on the output, so depreciation always beats it in the end due to asymptotes.

Note that any percentage of capital invested will eventually converge to a steady-state, so increasing investment must eventually still lead to an end of growth. Human capital behaves similarly (here, depreciation is a little more tragic).

Production explains part of the difference in growth and convergence between countries, but institutions as discussed previously explain a different portion of the phenomenon. However, between countries with similar institutions, like OECD western founding members, it is true that wealth correlates inversely with growth.

### Economics of Ideas

**Ideas** are taken as the explanation for growth in the cutting edge. Countries that are in the steady state of capital and labor still grow. Why? Because of innovation. 

In the Solow model (at least as covered in MRU) they have a multiplicative impact in production, so that Y = A * sqrt(K). They also shift convergence to a higher investment steady-state, so that production again increases. If ideas increase over time, then both investment and production will keep growing at a steady pace.

The production of ideas can be incentivized through institutions, and the course makes an emphasis in investment firms and incubators (like ycombinator), and patenting systems as drivers of innovation.

**Ideas want to spread**: Unlike physical goods, ideas are nonrivalrous. Once N people know something, making the next one learn it doesn't reduce the value for the first N. However there needs to be a way to incentivize inventors, or new ideas would not be produced.

Patents are enshrined in the constitution: it stipulates that a limited-time license for the use of inventions is created so as to incentivize and protect inventors.

Ideas can also be incentivized (publicly or privately) by funding inputs or outputs: either funding research with big downstream impact (especially basic research) or assigning rewards for finding solutions to unsolved problems (e.g., reward for inventing a [carbon capture technology](/wiki/solar-energy) that is at least XYZ efficient).

The course mentions ideas as a function of population, incentives and average individual "creativity", multiplicatively.

## Savings, Investment and the Financial System

Over time, a person's income will fluctuate. In the American case it is typical for expenses to rise dramatically in college years as income is very low, then income peaks as people accrue work experience, and finally in retirement it shrinks again. To keep a relativaly stable standard of living, society uses borrowing (to compensate the difference in spending vs earning) and investing.

The price of borrowing is an interest ([finances are trading with the future](https://www.conradbastable.com/essays/financialism-you-dont-need-surpluses-if-you-can-trade-with-the-future)) and this interest will fluctuate as any other price, due to changes in the supply and demand of capital. Supply depends on how much people save, demand on how much they spend, and these are the markets that banking and other financial institutions regulate with interest rates.

### Financial Intermediaries 

Financial Intermediaries are institutions that receive savers money and distribute it to lenders in different ways.

**Banks** coordinate the lending of everyone's deposits, and evaluate loan applications assessing risks.

**Bonds** can be issued by large enough institutions to directly raise capital bypassing banks. Their interest rate will be shifted as the government issues more or less bonds, since it is a big issuer in a market.

**Stock** allows a company to sell a share of ownership and use that capital for investment and growth. In this case we are talking about IPOs or dillutions, not later stock trading.

### Reasons Financial Intermediaries Fail

Many failures of financial intermediaries come down to bad institutions. 

- **Insecure property rights**: If you put your money in the bank, you expect to be able to take it out (yeah, right, *cries in Argentina*).
- **Controls on interest rates**: Usury laws act as a price ceiling for interest rates, with expected effects.
- **politicized lending**: Share of government banking vs total banking for a country predicts growth and finance.
- **runs panics and scandals**: These undermine confidence in banks and can lead to a crisis. One way of preventing them is an institution like the [FDIC (Link to Kalzumeus' amazing explanation)](https://bam.kalzumeus.com/archive/deposit-insurance/)

### 2008 Financial Crisis

The course also discusses the 2008 Financial Crisis, explaining it as in big part due to overleverage in mortgages (the ratio of equity to total debt was too small -Lehman Brother's on average had 44 more in debt than in equity for mortgages. This is called a leverage ratio.-). 

Other factors were bad incentives for managers (which made them less risk averse than optimal and not personally impacted by second order effects), overconfidence in the housing market, and securitization.

In summary the factors that led to the crisis were: **high leverage in houses and banks**, **risky mortgage securities** and the **shadow banking system** not covered by FDIC, thus subject to more risk. This made banks insolvent as house prices fell, which made them be considered riskier, making obtaining loans harder, leading to a general of business that depended on credit to subsist.

## Personal Finance

Most privately managed mutual funds don't beat passively managed (like index) funds on a given year. None beat them consistently over time, not even Warren Buffet.

One reason is the **Efficient Market Hypothesis**: that prices embed all publicly known information about something, so thinking you can profit from knowing public information is wrong (unless you assume others are incorrectly valuing that information or are less competent, which is usually not the case). This is also referred to as the Wisdom of the Crowds.

I found this part of the course to be very basic and introductory, and it matches r/personalfinance, r/FIRE and infinitely many more finance blogs and sites, so I won't add too much here.


## Employment

The unemployed population is defined as that which is able to work, wants to work (defined as 'made active efforts to find a job in last 28 days') but is unemployed.

The share of female working population is increasing over time since 1940, and the male one is decreasing. This is partly due to societal factors, and also to factory jobs skewing male (and disappearing due to automation) and service work skewing female (service jobs are increasing). women also skew more educated.

In recessions, unemployment peaks as the economy shrinks. 

Unemployment can be frictional (lasts only a short period of time, e.g. if you're between jobs, and shows a vibrant changing economy), structural (long term, fixed) and cyclical (the rest).

European countries have stronger labor protection against layoffs and such, and in exchange have higher unemployment rates (\~10% vs \~4% in USA).

Labor participation rates also change unemployment. Some people just leave the labor market altogether, especially retirees.

## Inflation and Quantity Theory of Money

Inflation is produced when the quantity of money increases. An extreme example would be Zimbabwe.

MV = PY : Total money supply times average velocity (how many jumps it makes) should equal average goods price times total sold finished goods and services quantity.

By dividing both sides by Y, we get that P increases if M and V increase or decreases as P grows, ceteris paribus. Since Y is real GDP it doesn't fluctuate very much, nor should V fluctuate much (empirically for the USA it is around 7). This leaves M as the main culprit for inflation (not unexpected, as an Argentinian).

Empirically, inflation correlates very well with money supply. Typically a doubling of the money supply, for instance, predicts a doubling of nominal prices. In other words, a linear approximation fits very well.

### Costs of Inflation

Inflation is especially bad because it is unpredictable. This generates **price confusion** and **money illusion**. Price confusion masks signals in prices, as we cannot separate real price increases from inflation. This is exacerbated by volatility.

Money illusion happens when people are unaware of inflation and mistake changes in nominal prices with changes in real ones. This is a problem people in Argentina don't have as much, but I guess it happens in the first world.

Inflation also **makes long term contracting riskier**, since real interest rates are harder to calculate if prices are more volatile. The Fisher effect predicts that interest rates will rise with predicted inflation, to try to match desired real interest rates. This also punishes long-term borrowers who contract their debt in high inflation contexts.

Volatile inflation rates make both borrowing and lending riskier (the former due to possible decrease of inflation, the latter due to possible increase). Price volatility then is bad for the whole coordination system between saving and investing.

## Business Cycles

Business fluctuates cyclically. We get recessions and growth, that ebb and flow over time.

The aggregate demand curve is the equation from before: MV = PY. This time, we plot the aggregate demand curve as a constraint system where inflation + real growth are nominal growth (P + Y), and they match dMV/dt which serves as a constraint giving us a straight line.

The Long-run aggregate *supply* curve dictates real GDP growth -it is a constant-, constraining inflation to a certain value (as they add up to aggregate demand).

The short-run aggregate supply curve is curvier and goes up from the left, so that when the money supply increases there is a period where the aggregate demand curve shifts to the right, but then if long-run aggregate supply curve doesn't move this just creates more inflation and a higher *nominal* GDP growth.

## Business Cycle Theories

### Keynesian

Keynesians look at aggregate demand (divided into Nx, I, C, G) and assume salaries are sticky, which predicts unemployment will rise if aggregate demand shrinks.

Central banks should expand money supply, lower interest rates and easy conditions for credit, government deficit, put people to work, fund by borrowing.

In summary, they will want to **restore the flow of aggregate demand**. A problem with this is there may be an underlying cause for aggregate demand fall, which monetary policy will not address.

### Monetarism

**Monetarism**, based in the quantity theory of money, emphasizes money.

It was especially popular in the '70s after stagflation, and puts an emphasis in keeping inflation possitive but small. Usually through a constant rate of money supply growth, which may not be completely optimal but rules out high inflation or deflation, which are the worst cases.

Its biggest flaw is it is an incomplete model, since some crisis are not monetary in nature. There is also the question of how to measure and define the money supply in practice.

### Real Business Cycle 

In Real Business Cycle theory, a crisis comes from reduction in real aggregate supply. An economic shock that makes the economy worse, disrupting supply chains or reducing access to resources, causes a crisis. An example would be the increase in oil prices in the 70s, or Brazil's GDP falling when commodities fall. 

In general, this theory predicts crises come from a shift to the left of the supply curve.

Not all crises are based in real business, and some may come from monetary issues altogether, etc. A way to prevent real business cycle crisis is to diversify the economy.

### Austrian School of Economics

The Austrian School of Economics emphasizes price signals and postulates that **central banking or government action distort these signals and create a boom-bust cycle**.

It dictates that the bank should not regulate the interest rate, as that makes for **artificial (self-reversing) businesses or investments**, which then bust when interest rates go down. 

Some problems with it are that it fails to explain unemployment (after resources are redirected) and overestimates entrepreneurs (why are they not aware that the interest rates are fake?).

The Austrian theory is not considered mainstream.

## Monetary Policy and the Federal Reserve

The Federal Reserve holds a lot of power by being able to regulate the supply of money and interest rates.

Remembering M\*V = P\*Y, the Fed can influence the economy greatly in the short term by moving M, but this will result in a change in P in the long run, though it could move Y in the short-run due to sticky prices.

Money is any **widely accepted means of payment**. This includes paper money, checking and savings accounts, and anything you can use for payments without much work. It also includes what is **easily** converted into a means of payment.

Some money supplies are: **MB** (paper + reserve deposits -banks' checking accounts-), **MR1** (currency + checkable deposits) and **MR2** which is an extension of M1.

In **fractional reserve banking**, banks need to hold a certain % of savings in their vaults at all times. In the USA that fraction is currently 10%, called the reserve ratio. This also affects the money supply.

The **Money multiplier** is the inverse of the reserve ratio, and due to exponential growth dictates how much M1 money emerges from an amount of MB money. E.g. I deposit 100$ in my account, and the bank keeps 10% but lends 90%, which is deposited in banks, so it is lent again, etc.

The Fed can move interest rates, especially for Federal Funds rate (how much banks are paid for lending overnight to other banks so they meet deposits requirements). The biggest way the Fed regulated interest rates prior to 2008 was through Expansionary Open Market Operations (OMO): buying treasury bills from banks. This stimulates the economy by making it easier for banks to loan, reducing interest rates.

Other loan rates adjust to the federal funds rate noisily.

**After 2008**: The Fed conducted **Quantitative Easing**: Swapping money for assets other than t-bills. This allows the Fed to target different rates and parts of the economy, like mortgage securities or college loans. This also increases liquidity (and the money supply).

The fed also started paying **interest rates on reserves**, increasing the incentives for banks to keep bigger reserves and stabilizing the economy, but also disincentivizing investments.

**Repurchase and reverse purchase agreements** are like overnight OMO (in OMO the t-bills are just bought 'permanently', in repos it is done for a night). This also regulates interest rates and market temperature, as buying more bonds will incentivize investing in them in lieu of other riskier investments.

In a panic, there is a trade-off between preventing systemic risk and checking moral hazard: do I bail out insolvent banks which took too much risk, deemed "too big to fail", to prevent every domino from falling down? Will that incentivize more risk-taking in the future, and signal to banks that they will be bailed out again in the next panic, increasing the chances of a crisis in the first place?

## Fiscal Policy

Fiscal Policy arguably aims at **reducing the impact of the booms and busts of the business cycle.**

This can be achieved, for instance, by expansionary fiscal policy during a recession.

The fiscal multiplier refers to the extra contribution to GDP after the government adds fiscal stimulus through, for instance, hiring unemployed workers to build infrastructure. Interestingly, this only stimulates the economy if unemployment is high enough, as otherwise the government will merely be crowding out the private sector.

The oposite of expansionary policy is contractionary fiscal policy, especially during a boom, though that is less common.

The government can use spending to stimulate the economy when aggregate demand falls, leading to temporary increase in short-term aggregate supply, which can keep the real aggregate supply from falling (triggering a recession or even a depression).

An ideal stimulus is **timely, targeted and temporary**. 

- **Timely** to avoid delays, both in government process and in the effect to take place.
- **Targeted**: we would prefer to target unemployed workers, which can be hard when they belong to a specific part of the workforce (it is easier for the government to hire construction workers than retail ones).

## Related Articles

From most to least related.
- [Ascent of Money](/wiki/ascent-of-money): Reading notes and book summary, on the history of financial institutions and how they impact the world. 
- [World Poverty](/wiki/world-poverty) for some rudimentary analysis of raw world poverty and its different definitions and incidence levels.
- [Recycling](/wiki/recycling): On the impact of global recycling efforts on the Chinese economy.
- [Finances](/wiki/finances) on the historic performance of the US and global markets.
- [Eroom's Law](/wiki/erooms-law) on the interesting effect that makes new drug discovery exponentially more expensive over time. 