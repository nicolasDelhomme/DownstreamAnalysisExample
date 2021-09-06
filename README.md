# Downstream Analysis Examples

This repository is about downstream analyses that can be performed on expression profiling data, for example after a differential expression (DE) analysis

## Set up

1. Create a new project in RStudio to clone the GitHub repository: [https://github.com/nicolasDelhomme/DifferentialExpressionExample.git](https://github.com/nicolasDelhomme/DownstreamAnalysisExample.git)

2. Create a link to the data and to the persistent storage

```{bash}
ln -s ../raw_data data
ln -s ../persistent analysis
```

3. Populate the UPSCb-common submodule (RStudio does not retrieve submodules by 
default). In the RStudio terminal do:

```{bash}
git submodule init
git submodule update --remote
cd UPSCb-common
git submodule init
git submodule update
cd ..
```

## Content

There are two folders that will be used:

* doc
* src/R

The `doc` folder contains PDF presentations.

The `src/R` folder contains the code for the examples and the homework.
