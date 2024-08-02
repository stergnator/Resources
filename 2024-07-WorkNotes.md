# Work Journal for August 2024

---

Friday 8/2/2024

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

