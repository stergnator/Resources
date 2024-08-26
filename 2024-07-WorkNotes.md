# Work Journal for August 2024

---

## Monday 8/25/2024

I took a week off from logging my entries.  Here is a summary of the educational work I performed last week.

- I finished chapter 5 in `DLwP2`.  There's a file for each major section in the
  `src/code/python/pt/` directory.
- I started the Coursera Class [Deep Neural Networks with
  PyTorch](https://www.coursera.org/learn/deep-neural-networks-with-pytorch)
  Actually I started the class on `EDX.org`, but the audio was horrible.  It was
  an robot generated voice reading from an ill prepared script.  The class was
  actually created by IBM in 2017.  The notes on the site confirmed that the
  majority of people thought the delivery was very bad.  Anyway, I abandoned
  that class and found a similar class on Coursera.  It turned out to be the
  same class by IBM but updated in 2019 with a better voice.  The content is
  still lacking, but I am able to fill in the gaps from the various books I am
  ready through. My notes for this version of the class are in the
  `src/code/python/pt/Coursera` directory.  I completed section 4 of this class.



---

## Wednesday 8/14/2024

- Worked through the 1st half of chapter 5 in `DLwP2`
- [x] Finish 2nd half of chapter 5 in `DLwP2`

---

## Monday 8/12/2024

### Goals for this week

- [ ] PyTorch Activities
  - [ ] Read Chapter 5 in `DLwP2` and work the examples.
  - [ ] Find a dataset to work with
- [ ] Flesh out idea of school class schedule for students.  Leo's schedule was
  horrible.  The school is either incompetent or negligent.  The schedule was so
  bad it's hard to imagine someone purposely gave him 3 music class electives he
  did not ask for, and **none** of the electives he requested.
  - Sub Goals
    - Use `mojo.🔥`
    - Use `scipy.optimize.linprog`
- [ ] See if this [PyTorch video series](https://www.youtube.com/watch?v=kY14KfZQ1TI&list=WL&index=11) is any good.
- [ ] Learn more Solid Edge
  - [ ] Read and work examples in `Modeling synchronous and ordered features`
- [ ] Study Greek
- [ ] Continue to develope notes in [Obsidian](https://obsidian.md/).  I have
  been good with adding tags.  Now, add inter-document links too as this will
  develop the knowledge graph.

---

## Sunday 8/11/2024

- I did a little digging into [AutoGluon](https://github.com/autogluon/autogluon)
  - [ ] Do a small project in AutoGluon
- I read the web page [A Short Chronology Of Deep Learning For Tabular Data by Sebastian Raschka](https://sebastianraschka.com/blog/2022/deep-learning-for-tabular-data.html) The post contains a short summaries on a list of papers with links.  It's a useful resource.
- I read a little bit of `2021 Solid Edge Black Book`.  It was not a productive read.
  - [ ] Switch to another Resource

---

## Thursday 8/8/2024

- [ ] Read Chapter 13 **Common Modeling Patterns for Time Series** in the book __Modern Time Series Forecasting with Python__
- [ ] Read Blog Post [A Short Chronology Of Deep Learning For Tabular Data](https://sebastianraschka.com/blog/2022/deep-learning-for-tabular-data.html)
- [Installed PyTorch_Tabular](https://github.com/manujosephv/pytorch_tabular) which makes it easy to work with DL models in the tabular data domain, and it just so happens that timeseries data is tabular.
  - [ ] Read the PyTorch Tabular very detailed [documentation and tutorials](https://pytorch-tabular.readthedocs.io/en/latest/) to get you started.

---

## Wednesday 8/7/2024

- Finished working with Chapter 4 in `DLwP2`.
  - The last section covered text based OHE, which motivated discussion of embeddings.
  - My code can be found [here]((<src/code/python/pt/chap04-E.py>))
- I can now confidently say that the term `Tensor` used in the ML world has
  absolutely nothing to do with mathematical tensors used in physics. Coming
  from a physics/engineering background, the term tensor is used in the
  mathematical sense where the notion of point, vectors, spaces, reference
  systems, and transformations between them are codified. The classical notion
  of tensors (tensor fields) as used in differential geometry, algebraic
  geometry, general relativity, in the analysis of stress and strain in
  materials, and in numerous applications in the physical sciences are not
  what's happening here. In ML they are a multi-dimension matrix - full stop.

- [x] I finished the SolidEdge tutorial named `Part (Ordered Mode)`
  [Introduction to modeling parts with ordered features](https://docs.sw.siemens.com/en-US/doc/246738425/PL20220830878154140.seppabj/seppabj_introduction)
- [SolidEdge Index to Tutorials](https://docs.sw.siemens.com/en-US/doc/246738425/PL20220830878154140.xid1846157/xid486886) is the page that contains a listing and links to the tutorial collection.
- [ ] The next tutorial for me is [`Sheet Metal Part (Hybrid Mode)`](https://docs.sw.siemens.com/en-US/doc/246738425/PL20220830878154140.sessash/xid602585#xid602586)

- [ ] Start Chapter 5 in `DLwP2`
---

## Tuesday 8/6/2024

- Adding new book resource [Modern Time Series Forecasting with Python (2022)](Books/MLB)
  Along with traditional time series techniques, it also covers ML approaches as well as DL approaches.
  - I have cloned the book's github directory
  - [ ] Closely examine the examples of pytorch's dataloader classes.  I should be able to leverage this.
- Additional book resource [Machine Learning for Time Series Forecasting with Python (2020)](Books/MLB)
  While this book uses `keras` and `scikit-learn` as opposed to `pytorch` is does have nice explanations.
- [x] Reread 4.3 Representing Tabular Data (Wine Dataset), and worked with the example code  [chap04-B.py](src/code/python/pt/chap04-B.py) closely.
  - Once again, I examined closely their implementation of One Hot Encoding.

---

## Monday 8/5/2024

- [ ] Made a [little program](<src/code/python/pt/oneHot.py>) to experiment with One-Hot-Encoding.
  - Made a simple python only version
  - Made a scikit-learn based version
  - Made a pandas based version
  - I think I'm done with One-Hot-Encoding for now!

- Worked on understanding `tensor.scatter_()`.  It's an in place function for moving elements in a tensor according to input sources,

---

## Friday 8/2/2024

- [ ] Make a diversion today and read the `offical` getting started documentation pointed to by the [GitHub PyTorch repo](https://pytorch.org/tutorials/beginner/basics/intro.html)

---

## Thursday 8/1/2024

- [x] Continue reading through Chapter 4 in `DLwP2`
  - Focus on the time series section, 4.4.  Done.  But I don't understand the motivation for re-shaping the tensor.
  - More reading and running the example code was done today.  While I learned more about the PyTorch `tensor`, I am not entirely comfortable with the speed and brevity the book has adopted.  For example, I am still unclear why the airplane travel example, which is a univariate model and a standard example used by most ML tool kits, creates a tensor w/ 3 dimensions for input where two of the dimensions are 1D only, and this does not include the target.  There was mention of this multi-dimensional approach in other models.  There must be some reason motivating it.  Perhaps the GPU really likes this data structure?
  - [ ] Find another resource to help explain the modeling.

---

## Wednesday 7/31/2024

- [ ] Read Chapter 4 in `DLwP2`
  - I worked through section 4.3.  Each section that I am interested in get's
    its own file.  I check using ipython along the way, and at the end I run the
    whole file.  It's redundant and inefficient, but I learn a little bit more
    that way.  I wish I could just read and absorb, but that's not me.
- [ ] Review Monteprediction
- [ ] Reevaluate the BPNDX system
- I read Chapter 1 `PyTorch Recipes`.  It is an example laden text of the basic
  building blocks for using pytorch notation

## Tuesday 7/30/2024

- [x] Read Chapter 3 in `DLwP2`
  - worked through all examples
    - Aggregated them all in one file `chap03.py` and ran from command line
    - also ran individual examples in ipython
    - wrote my chapter notes into `~/src/code/python/pt/chap03.py`
- Started reviewing resources for time series forecasting using deep learning.
  - stored results in [Resource List](TimeSeriesDeepLearningBooks.md) which is untracked for now.

---

## Monday 7/29/2024

- Upgraded all python modules on `longboard`

- Installed `PyTorch` using instructions generated via the applet on the
  [PyTorch Start Locally Page.](https://pytorch.org/get-started/locally/)  I
  might as well start locally as I have a [NVidia RTX A4500 /w
  20GB](https://www.nvidia.com/en-us/design-visualization/rtx-a4500/)

```sh
pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu124
```

### Is it Common to Engineer Features for Deep Learning?

- [ ] [7 of the Most Used Feature Engineering Techniques](https://archive.is/cYtxG)

- [ ] [Feature Engineering For Deep Learning](https://medium.com/inside-machine-learning/feature-engineering-for-deep-learning-2b1fc7605ace)

    The conclusion is simple: many deep learning neural networks contain hard-coded data processing, feature extraction, and feature engineering. They may require less of these than other machine learning algorithms, but they still require some.

## Sunday 7/28/2024

### Areas of Interest

- [ ] [PyTorch](#pytorchpytorch)
- [ ] Knowledge Base Recording with [Obsidian](https://obsidian.md/)
- [ ] [Exercise & Health](#exercise--health)
- [ ] [Stock Market Study](#stock-market-study)
- [ ] [Clean Garage](#garage-tasks) to get ready to work on Corvette
- [ ] [Learn Greek](#greek)
- [ ] [Learn Motors & Mechatronics](#learn-motors--mechatronics)
- [ ] [Learn Mojo](#learn-mojo)
- [ ] [Learn 3d CAD](#learn-3d-cad)
- [ ] [Academic Studies](#academic-studies)

### PyTorch

- Create Study Plan

- [Get Started](https://pytorch.org/get-started/locally/) by using this website to
install, select preferences and run the command to install PyTorch locally, or
get started quickly with one of the supported cloud platforms.

- Read [Deep Learning with PyTorch 2nd Edition (DLwP2)](<../../Downloads/Books/MLB/Deep_Learning_with_PyTorch_Second_Editi_v4_MEAP.pdf>)

- Collect & resurrect my old datasets only after I can do some LTMS examples from the book.

### Exercise & Health

- Continue to only eat between 6am and 2pm
- Ride Bike & Do Kegels every day
- Use TENS twice a day for posterolateral abdominal wall and rectus abdominis
- Go to YMCA 2 times this week.

### Long Running Tasks

- [ ] Recover Quicken Data for House Build
- [ ] List of Restaurants in MntView

### Stock Market Study

- Keep detailed notes, plans and progess is [TradingNotes](./TradingNotes.md)
- Learn Think or Swim Platform
- Create Stock Lists on [StockCharts.com](https://StockCharts.com)
- Learn Options
- Pairs Trading
- [Fractal Dimension](https://www.youtube.com/watch?v=wgZYKFKZSeU)
- Many YouTube Videos

- [Zipline](https://pypi.org/project/zipline/) is a Pythonic algorithmic trading
library. It is an event-driven system for backtesting. Zipline is currently used
in production as the backtesting and live-trading engine powering Quantopian – a
free, community-centered, hosted platform for building and executing trading
strategies. Quantopian also offers a fully managed service for professionals
that includes Zipline, Alphalens, Pyfolio, FactSet data, and more.

- [pyfolio](https://pypi.org/project/pyfolio/) is a Python library for
  performance and risk analysis of financial portfolios developed by Quantopian
  Inc. It works well with the Zipline open source backtesting library. At the
  core of pyfolio is a so-called tear sheet that consists of various individual
  plots that provide a comprehensive performance overview of a portfolio.

### Garage Tasks

### Greek

- Anki
- Pimsluer Greek (currently on file 15)
- Memorize Sentences in [Glossika](<../../Downloads/Books/Greek/Glossika-Fluency-1.pdf>)
- Memorize Passages in [Elliniki Glossa](<../../Downloads/Books/Greek/Elliniki Glossa Modern Greek Lessons.pdf>)
- Study [ΚΛΙΚ στα Ελληνικά Α1](<../../Downloads/Books/Greek/ΚΛΙΚ στα ελληνικά. Επίπεδο Α1 για εφήβους και ενηλίκους (2014).pdf>)

### Learn Motors & Mechatronics

- Raspberry Pi / Arduino example and tinker kits
- I have lots of books, pick one and read it!
  - [Motors for Makers: A Guide to Steppers, Servos, and Other Electrical Machines](<"C:\Users\sterg\Downloads\Books\Hobby\Motors for Makers - A Guide to Steppers, Servos, and Other Electrical Machines.pdf">)

  - PWC Control
  - Stepper Motors
  - Brushless DC Motors

### Learn Mojo

- [x] Install mojo on Linux __UB2404UD__
- Follow Items in the [Next Steps](https://docs.modular.com/mojo/manual/get-started/#next-steps)

If you're new to Mojo, we suggest you learn the language basics in the [Introduction to Mojo](https://docs.modular.com/mojo/manual/basics).

If you want to experiment with some code, clone [the Mojo repo](https://github.com/modularml/mojo/) to try our code examples:

```sh
git clone https://github.com/modularml/mojo.git
```

### Learn 3d CAD

- Continue to make progress learning all the following packages
  - SolidEdge
  - OnShape
  - FreeCad

### Academic Studies

- Wavelets
- Physics
- Calculus
- Control Systems & Reinforcement Learning
- Robotics

