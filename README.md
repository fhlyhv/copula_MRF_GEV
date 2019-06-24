# copula_MRF_GEV
spatial extreme-value models based on GEV marginals and Gaussian copulas with algorithms for interpolation

If the observed sites are located on a regular grid, please check the function main_regular_case.m in the folder regular for a toy example.

If the observed sites are distributed irregularly, please check main_irregular_case.m instead.

In both cases,

Xtrain is a n x p data matrix of the observed data, where n is the sample size and p is the dimension. 

Ltttrain is a p x 1 vector of the lattitude of the observed data, 

Lngtrain is a p x 1 vector of the longitude of the observed data,

Gh denotes the estimated vector of shape parameters at different locations of the observed data

Sh denotes the estimated vector of scale parameters at different locations of the observed data

Lh denotes the estimated vector of location parameters at different locations of the observed data

and likewise for Xtest, Ltttest, Lngtest, Gtest, Stest, and Ltest.

If you use our code, please cite the following paper:

@inproceedings{yu2012modeling, 
title={Modeling extreme events in spatial domain by copula graphical models}, 
author={Yu, Hang and Choo, Zheng and Uy, Wayne Isaac T and Dauwels, Justin and Jonathan, Philip}, 
booktitle={2012 15th International Conference on Information Fusion}, pages={1761--1768}, year={2012}, 
organization={IEEE} }
