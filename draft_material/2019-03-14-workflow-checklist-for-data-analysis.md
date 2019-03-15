---
title: Workflow/Checklist for data analysis
author: Owen
date: '2019-03-14'
slug: workflow-checklist-for-data-analysis
categories: []
tags: []
image:
  caption: ''
  focal_point: ''
---

# Before touching R/RStudio

* Question
* Hypothesis(es)
* Study methods, materials, design.
* Response variable(s)
* Explanatory variable(s)
* Prediction(s)
* Secure resources
* Perform study, including data collection.

If you don't know, e.g. because you did not conduct the study, *before* import into R inspect the datafiles in a spreadsheet program (so long as they're not too big) and note the following:

* if multiple datafiles are used, which contains what
* what variable names are used in the datafiles, and what these mean (i.e. which are response variables, which are explanatory, and what are others)
* number of rows and columns in the datafiles
* arrangement of the data in the datafile, e.g. tidy or not tidy
* any obvious things to deal with (e.g. how missing values are coded, date/time information, codes that need expanding, variable/column names that will need changing)

# After we read the datafile(s) into R:

* number of variables/columns
* number of rows
* variable types
* appropriate reprentation of missing values
* tidy the data (at some point)
* check for innapropriate duplicates
* fix dates
* replace any codes with informative words
* check for appropriate variable entries, e.g. levels of characters, ranges of numerics
* numbers of "things", number of experimental units, treatments, treatment combinations, temporal samples
* calculate response and/or explanatory variable(s) (if required)

# After data tidying and cleaning

* Shapes of variables (i.e. inspect the histograms of explanatory and response variables).
* Relationships among explanatory variables.
* Relationships relevant to hypotheses/predictions.
* Assess confidence in revealed patterns.
