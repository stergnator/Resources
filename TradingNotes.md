---
title: "Trading Notes for STM"
output: pdf_document
---

<style type="text/css">
   ol {list-style-type: upper-alpha;}
   ol ol { list-style-type: decimal;}
   ol ol ol { list-style-type: lower-roman;}
   ol ol ol ol { list-style-type: lower-alpha;}
   ol ol ol ol ol { list-style-type: decimal;}
   ol ol ol ol ol ol { list-style-type: upper-roman;}
</style>

# Trading Notes for STM

---

## Monday 8/7/2023

### [Introduction to backtesting trading strategies](https://towardsdatascience.com/introduction-to-backtesting-trading-strategies-7afae611a35e)

In this 1st article, I would like to continue the series on quantitative
finance. In the first article, I described the stylized facts of asset returns.
Now I would like to introduce the concept of backtesting trading strategies and
how to do it using existing frameworks in Python.

### [ZipLine Data Import](https://towardsdatascience.com/backtesting-trading-strategies-using-custom-data-in-zipline-e6fd65eeaca0)

In this 2nd article, learn how to import custom data into zipline

### [Evaluate the performance of trading strategies in Python](https://towardsdatascience.com/the-easiest-way-to-evaluate-the-performance-of-trading-strategies-in-python-4959fd798bb3)

This is the third part of a series of articles on backtesting trading strategies
in Python. This time, the goal of the article is to show how to quickly and
efficiently evaluate the performance of our strategies using a library called
pyfolio (developed by Quantopian, the creators of zipline). pyfolio can be used
as a standalone library and provide performance results based only on a provided
series of returns. However, it works efficiently with zipline and I present this
combination in this article.

### [Algorithmic trading based on Technical Analysis in Python](https://towardsdatascience.com/algorithmic-trading-based-on-technical-analysis-in-python-80d445dc6943)

This is the fourth part of a series of articles on backtesting trading strategies in Python. The previous ones described the following topics:

    introducing the zipline framework and presenting how to test basic strategies (link)
    importing custom data to use with zipline (link)
    evaluating the performance of trading strategies (link)

This time, the goal of the article is to show how to create trading strategies based on Technical Analysis (TA in short). Quoting Wikipedia, technical analysis is a “methodology for forecasting the direction of prices through the study of past market data, primarily price, and volume”.

In this article, I show how to use a popular Python library for calculating TA indicators — TA-Lib — together with the zipline backtesting framework. I will create 5 strategies and then investigate which one performs best over the investment horizon.

### [ZipLine](https://pypi.org/project/zipline/)

Zipline is a Pythonic algorithmic trading library. It is an event-driven system
for backtesting. Zipline is currently used in production as the backtesting and
live-trading engine powering Quantopian – a free, community-centered, hosted
platform for building and executing trading strategies. Quantopian also offers a
fully managed service for professionals that includes Zipline, Alphalens,
Pyfolio, FactSet data, and more.

### [pyfolio](https://pypi.org/project/pyfolio-reloaded/)

pyfolio is a Python library for performance and risk analysis of financial
portfolios that works well with the Zipline open source backtesting library.  At
the core of pyfolio are various tear sheets that combine various individual
plots and summary statistics to provide a comprehensive view of the performance
of a trading algorithm.

### [VectorBT](https://vectorbt.dev/)

vectorbt is a Python package for quantitative analysis that takes a novel
approach to backtesting: it operates entirely on pandas and NumPy objects, and
is accelerated by Numba to analyze any data at speed and scale. This allows for
testing of many thousands of strategies in seconds.

### [QuantStats](https://pypi.org/project/QuantStats/)

[QuantStats](https://github.com/ranaroussi/quantstats) is a Python library that
performs portfolio profiling, allowing quants and portfolio managers to
understand their performance better by providing them with in-depth analytics
and risk metrics.

QuantStats is comprised of 3 main modules:

    quantstats.stats - for calculating various performance metrics, like Sharpe ratio, Win rate, Volatility, etc.

    quantstats.plots - for visualizing performance, drawdowns, rolling statistics, monthly returns, etc.

    quantstats.reports - for generating metrics reports, batch plotting, and creating tear sheets that can be saved as an HTML file.

### [backtrader](https://www.backtrader.com/)

A feature-rich Python framework for backtesting and trading

[backtrader](https://github.com/mementum/backtrader) allows you to focus on
writing reusable trading strategies, indicators and analyzers instead of having
to spend time building infrastructure.  Live Trading and backtesting platform
written in Python.

