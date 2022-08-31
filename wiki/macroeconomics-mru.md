---
layout: post
date: 2022-08-29
title: "Macroeconomics (Notes on MOOC by MRU)"
tags: mooc, economics, macroeconomics, gdp, world modeling
description: "Notes for the course on Macroeconomics by Marginal Revolution University. These are still in early stages as I am going through the course."
abstract: "Notes for the course on Macroeconomics by Marginal Revolution University. These are still in early stages as I am going through the course."
language: English
importance: 1
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

