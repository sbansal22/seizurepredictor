:Name: Evolving Hydrofoils using DEAP - Software Design, Olin College
:Authors: Colin Snow, Sparsh Bansal, Thomas Jagielski
:Version: 1.0

===== 
Evolving Hydrofoils
===== 

Evolving Hydrofoils is an application of Evolutionary Algorithms offered in the DEAP to evolve hydrofoils, analysed on the basis of the ratio of Coefficient of Drag (Cd) with Coefficient of Lift (Cl). The physical quantities are determined using  a FORTRAN based script, XFOIL, a subsonic airfoil development system. This is the final project whcih was developed by the authors during Software Design, a class at Olin College of Engineering.

============

Evolving Hydrofoils Version 1.0 requires the following Python packages

A. classes.py

.. code-block:: python

    import random
    import string
    import sys
    import numpy as np   # Used for statistics
    from deap import algorithms
    from deap import base
    from deap import tools
    
============    

B. editAirfoil.py

.. code-block:: python

    import subprocess as sp
    import shutil
    import sys
    import string
    import time
    import pandas as pd
    import os
    import evaluateFoil
    import random
    import numpy as np
    
============

C. evaluateFoil.py

.. code-block:: python

    import subprocess as sp
    import shutil
    import sys
    import string
    import time
    import pandas as pd
    import os

============

D. evolveAirfoil.py

.. code-block:: python

    import random
    import string
    import sys
    import numpy    # Used for statistics
    from deap import algorithms
    from deap import base
    from deap import tools
    import classes

Installation
============

The easiest and fastest way to get the packages up and running:

.. code-block:: python

    pip install deap
    sudo apt install xfoil
    
Documentation
=============

We have added comments for every line of code that we felt could be beneficial for someone to understand the program

Note: We haved added comments especially on the imported packages and code so that we can fully understand the code written by someone else. We have cited the sources wherever appropriate.

Contributing Works
==================

We used information from:

:i: Think Python - Allen Downey

:ii: Evolutionary Algorithms Toolbox - Software Design

:iii: DEAP - Computer Vision and Systems Laboratory, Université Laval

:iiii: XFOIL - Mark Drela, Massachusetts Institute of Technology

Built With
======
Think Python:
https://www.greenteapress.com/thinkpython/thinkpython.pdf

Evolutionary Algorithms Toolbox:
https://sd19spring.github.io/toolboxes/evolutionary-algorithms

Distributed Evolutionary Algorithms in Python:
https://github.com/deap/deap

XFOIL:
https://web.mit.edu/drela/Public/web/xfoil/

Authors
======
Colin Snow - Electrical and Computer Engineer, Olin College

Sparsh Bansal - Electrical and Computer Engineer, Olin College

Thomas Jagielski - Electrical and Computer Engineer, Olin College

Acknowledgments
======

We acknowledge all the guidance and remarks from the Software Design teaching team, as well as all our classmates for the peer reviews and helpful suggestions and recommendtaions.
