# Work Journal for August through September 2024

---

## Saturday 9/28/2024

- As I developed my own pet problem of linear estimation using pytorch I ran
into a problem of incompatible tensor shapes. The error code is:

```
mat1 and mat2 shapes cannot be multiplied (1x100 and 1x1)
Error occurs, No graph saved
Traceback (most recent call last):
  File "[redacted]\src\code\python\pt\STM_ld_csv_data.py", line 247, in <module>
...
...
...
  File "[redacted]\src\bin\venv\Lib\site-packages\torch\nn\modules\linear.py", line 117, in forward
    return F.linear(input, self.weight, self.bias)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
RuntimeError: mat1 and mat2 shapes cannot be multiplied (1x100 and 1x1)
```

The line 247 is noting special, so the problem must lie elsewhere:

```
writer.add_graph(model, x_dummy.to(device))
```

The surprising thing to me about this error is that I assembled the code from
various fragments I have read in books and webpages and so when I compared my
code to the original sources I could not see any significant differences. A
remaining difference was the data source.  For my pet problem I was using custom
data I had previously saved in a file and then subsequently read in from that
file as a `pandas dataframe`, while the original code was generating the data
from normal distributions as `numpy arrays`.  After further investigation I
learned that the tensors created from these different sources had different
shapes.

The original data has the desirable shape of

```python
x_tensor.shape
  torch.Size([20000, 1])
```

while my custom data had the malformed shape of

```python
x_tensor.shape
  torch.Size([20000])
```

My solution was to change the shape of the tensors I created from my custom data using the [tensor.view()](#tensor.view) method::

```python
x_tensor = torch.as_tensor(dataP['x']).float().view(dataP['x'].size, 1).to(device)
y_tensor = torch.as_tensor(dataP['y']).float().view(dataP['y'].size, 1).to(device)
```

An improved solution is to make sure `float32` data types are returned in pandas
dataframe when read in from a csv file as opposed to the default 64bit floats as
follows:

```python
dataP = pd.read_csv(inputCsvDataFN,
                    dtype = {'x': np.float32 , 'y': np.float32}
                    )
```

And then the above solution simplifies to the following (and uses less
memory too):

```python
x_tensor = torch.as_tensor(dataP['x']).view(dataP['x'].size, 1).to(device)
y_tensor = torch.as_tensor(dataP['y']).view(dataP['y'].size, 1).to(device)
```

The lesson here is to make certain I understand and know the shapes of my tensors.

### Tensor.view()

[Tensor.view(*shape) → Tensor](https://pytorch.org/docs/stable/generated/torch.Tensor.view.html) documentation.

  Returns a new tensor with the same data as the self tensor but of a different shape.

  The returned tensor shares the same data and must have the same number of elements, but may have a different size. For a tensor to be viewed, the new view size must be compatible with its original size and stride, i.e., each new view dimension must either be a subspace of an original dimension, or
  only span across original dimensions $d,d+1,…,d+kd,d+1,…,d+k$ that satisfy the following contiguity-like condition that $∀i=d,…,d+k−1∀i=d,…,d+k−1,$

$$
  stride[i]=stride[i+1]×size[i+1]  \\
  stride[i]=stride[i+1]×size[i+1]
$$

---

## Tuesday 9/25/2024

- I need to create a new python virtual environment since after installing
`tensorflow` the existing environment got corrupted.  I did not really need to
install `tensorflow` as all I really needed was `tensorboard`.  But when you
install and run just `tensorboard` it produces a message about reduced capabilities
which I thought were important.  Surprise! I don't need them (yet?)!

I'm ok with the `reduced feature set` as seen in the startup message below:

```powershell
code\python\pt via 🐍 v3.12.6 (venv)
tensorboard.exe --logdir=runs
  TensorFlow installation not found - running with reduced feature set.
  Serving TensorBoard on localhost; to expose to the network, use a proxy or pass --bind_all
  TensorBoard 2.17.1 at http://localhost:6006/ (Press CTRL+C to quit)
```

### VENV Corruption Details

The corruption is evidenced when when some, but not all, python and pip
commands produced messages similar to the following:

```txt
Fatal error in launcher: Unable to create process using ': The system cannot find the file specified.
```

And here's another example.

```txt
❯ pip list --local
Fatal error in launcher: Unable to create process using '"[redacted]\src\KB\PyTorch\Jupyter\.venv\Scripts\python.exe"  "[redacted]\src\KB\.venv\Scripts\pip.exe" list --local': The system cannot find the file specified.
```

It may have been related to using an `Alias` to initialize the virtual environment as follows:

```powershell
Set-Alias -Name avenv  -Value [redacted]\src\bin\venv\Scripts\Activate.ps1
```

I will stop using this alias and see what happens.

### Steps to produce the new virtual environment

```powershell

# new directory for this common environment

cd src/bin/
python3 -m venv 'venv'
./venv/Scripts/Activate.ps1
# use https://pytorch.org/get-started/locally/ to generate the following command
pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu124

python -c "import torch;print(torch.__version__)"
  > 2.4.1+cu124

pip3 install --upgrade numpy
python -c "import numpy as np;print(np.__version__)"
  > 2.1.1

pip install tensorboard
python -c "import tensorboard;print(tensorboard.__version__)"
  > 2.17.1

pip install monteprediction
pip install jupyter
pip install matplotlib

```

---

---

## Through Sunday 9/22/24

- Added a git repo to the Obsidian KB
- Installed [Working Copy](https://workingcopyapp.com/) on the ipad so that I can see
  my KB on it.
  - [ ] Trying to get iOS Obsidian syncing with git is near impossible unless you are using github.  I am not making my KB public at this point.  It will eventually replace my [Resources.md], [TechLog.md], and [PostgreSQL.md] files.

- I worked up to page 175 in `Deep Learning with PyTorch - Step-by-Step`, i.e. `Going Classy`.

## Friday 9/6/2024

- As of 8/28/2024 [PyTorch Release 2.4.1 - Final RC is available](https://dev-discuss.pytorch.org/t/pytorch-release-2-4-1-final-rc-is-available/2422)

Ok, let's test it and see if it works with numpy 2+.  It does!

```sh
pip3 install torch==2.4.1 torchvision==0.19.1 torchaudio==2.4.1 --index-url https://download.pytorch.org/whl/test/cu124
```

---

## Thursday 9/5/2024

- I have worked well into chapter 7 this week, through the first half of the `Dataset` class.

- Worked through pg 66 of `Deep Learning with PyTorch - Step-by-Step`, which is basically a rehash of every thing I read so far.

- Worked through PyTorch tutorial.  Up to [Build the Neural Network](https://pytorch.org/tutorials/beginner/basics/buildmodel_tutorial.html)

---

## Tuesday 8/26/2024

- Today I asked [Claude.ai](https://cluade.ai) for a recommendation for pytorch online tutorials.  It responded with

```
Good morning. For scientists and engineers with programming and mathematical modeling experience, I'd recommend the official PyTorch tutorials available on the PyTorch website. These tutorials are comprehensive and well-suited for those with a strong technical background.

The official PyTorch tutorials cover:

1. Basic tensor operations
2. Neural network modeling
3. Data loading and preprocessing
4. Training and optimization techniques
5. Advanced topics like custom C++ and CUDA extensions

These tutorials are designed to quickly bring experienced programmers up to speed with PyTorch's capabilities and syntax.

Additionally, you might find the "Deep Learning with PyTorch" free online book valuable. It's written by Eli Stevens, Luca Antiga, and Thomas Viehmann, and provides in-depth explanations of PyTorch concepts with a focus on practical applications.

Would you like me to provide more details on specific aspects of these resources or suggest any supplementary materials?
```

Interestingly, the book suggestion I am already reading.  That's good to know, and I will also start looking at the main PyTorch website as well.

I then followed up asking for a list of supplementary materials, which it promptly produced:

```
Certainly. Here's a list of supplementary materials that can complement the official PyTorch tutorials for scientists and engineers:

1. "Dive into Deep Learning" - An interactive book that teaches deep learning using PyTorch. It covers both theory and implementation.

2. Fast.ai's "Practical Deep Learning for Coders" course - While not exclusively PyTorch-focused, it uses PyTorch and provides excellent practical insights.

3. Stanford CS230 Deep Learning course - Includes PyTorch implementations of various deep learning models.

4. "PyTorch for Deep Learning and Computer Vision" course on Udemy - Focuses on computer vision applications using PyTorch.

5. "Programming PyTorch for Deep Learning" by Ian Pointer - A book that covers creating and deploying deep learning applications with PyTorch.

6. PyTorch Lightning documentation - A lightweight PyTorch wrapper that simplifies training complex models.

7. Paperspace tutorials - Offers various PyTorch tutorials on topics like GANs, reinforcement learning, and more.

8. "Deep Learning with PyTorch Step-by-Step" by Daniel Voigt Godoy - A comprehensive guide available on GitHub.

9. TorchVision, TorchText, and TorchAudio documentation - For domain-specific PyTorch extensions.

10. "PyTorch Recipes" by Avik Jain - A GitHub repository with various PyTorch implementations and tricks.

Would you like more information on any of these resources or recommendations tailored to specific areas of interest within deep learning or PyTorch?

```

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

