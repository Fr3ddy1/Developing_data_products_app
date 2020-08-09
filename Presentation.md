Data Analysis App
========================================================
author: Freddy F. Tapia C.
date: August 9, 2020
autosize: true

Introduction
========================================================

This application allows the user to observe a data and make a graph from it. This app counts with two main sections,

* **Data section**: this section allows to visualize the chosen data, for this purpose a table is shown, in this section the user will be able to see the content of the variables and thus be able to choose which variables they want to choose to make a graph.

* **Plot section**: in this section a graph was made, for which it is necessary for the user to enter a value for the variable "X" and one or more values for the variable "Y".


Data Section
========================================================

In this section the user can observe the data selected, an example of the table is presented below,

![plot of chunk unnamed-chunk-1](Presentation-figure/unnamed-chunk-1-1.png)

Tips
========================================================

* The graphics of this application were made with plotly.

* Each entry on the left side panel has a help button (question mark), which when clicked displays a window where you can obtain information about it.

* The shinyhelper package is the one that allows you to add the help buttons to the inputs, which is very useful for the user.

Conclusions
========================================================

* This application is just a sample of what can be done with the package shiny of R, it could be applied to the analysis of the stock markets where it is very useful to compare the graph of a stock with respect to another or several stocks.

* As an improvement, you can consider placing an option to load the data from the computer, or if you want to go further, you could take the data directly from the web.

