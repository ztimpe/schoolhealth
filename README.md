
<!-- README.md is generated from README.Rmd. Please edit that file -->

# schoolhealth

<!-- badges: start -->
<!-- badges: end -->

The goal of schoolhealth is to provide quick and easy access to
version-controlled information pertaining to the student and school
surveys, as well as document analytic approaches to using these data.
More concretely, the schoolhealth package loads meta-information, such
as codebooks and factor variables, that are critical to reproducible
research and evaluation.

If this package proves useful moving forward, additional information
will be provided as necessary.

## Installation

You can install the development version of schoolhealth from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("ztimpe/schoolhealth")
```

## Student Survey Codebook

After installation and loading the package, call the codebook like you
would any other R function:

``` r
library(schoolhealth)
codebook <- student_codebook
head(codebook)
#>           Variable                            Question response_options section
#> 1           census   Whether district conducted census  census; sampled    <NA>
#> 2 district_schools Total number of schools in district             <NA>    <NA>
#> 3          ncessch                      School NCES ID             <NA>    <NA>
#> 4    ed_department         Department conducting study             <NA>    <NA>
#> 5             plea              District of respondent             <NA>    <NA>
#> 6       state_name                          State name             <NA>    <NA>
#>   subset      type
#> 1    All character
#> 2    All    double
#> 3    All character
#> 4    All character
#> 5    All character
#> 6    All character
```

## Factor Variables

The student and school surveys are almost exclusively multiple choice
questions. When analyzing these data in R, casting these variables as
factors has a number of advantages, particularly when displaying tables
of statistics because the order of the factor can be preserved and that
response options receiving zero endorsements are included in output.

``` r
factor_variables <- student_codebook_factors
factor_variables[1]
#> $Q1
#> [1] "Male"                 "Female"               "Prefer not to answer"
```

Provide example of factor summary:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
