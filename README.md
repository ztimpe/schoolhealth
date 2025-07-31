
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
of statistics because the order of the factor can be preserved and
response options receiving zero endorsements are included in output. You
can access individual elements either by name or index.

``` r
factor_variables <- student_codebook_factors
# use "Q1"
factor_variables['Q1']
#> $Q1
#> [1] "Male"                 "Female"               "Prefer not to answer"
# or index position
factor_variables[1]
#> $Q1
#> [1] "Male"                 "Female"               "Prefer not to answer"
```

Provide example of factor summary:

``` r
table(student_survey$Q1)
#> 
#>               Female                 Male Prefer not to answer 
#>                  517                  510                   23
```

Summarize the unweighted data.

``` r
library(dplyr,warn.conflicts = FALSE)
student_survey |>
   count(Q1)|>
   na.omit()|>
   mutate(
          pct = paste0(round(n/sum(n,na.rm=T),2)*100,'%')
          )
#> # A tibble: 3 × 3
#>   Q1                       n pct  
#>   <chr>                <int> <chr>
#> 1 Female                 517 49%  
#> 2 Male                   510 49%  
#> 3 Prefer not to answer    23 2%
```

We recommend using the srvyr package for analyses with weighted data.

``` r
library(srvyr,warn.conflicts = FALSE)
 student_survey |>
    select(ncessch:race)|>
    as_survey_design(
       ids = ncessch,
       weights = finalwt,
       fpc = district_schools
    )|>
    select(Q1)|>
    na.omit()|>
    group_by(Q1)|>
    summarise(mean = round(survey_mean(),3))
#> # A tibble: 3 × 3
#>   Q1                    mean mean_se
#>   <chr>                <dbl>   <dbl>
#> 1 Female               0.476   0.008
#> 2 Male                 0.503   0.008
#> 3 Prefer not to answer 0.021   0.002
```
