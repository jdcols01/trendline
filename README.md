# trendline
Stata package for aggregate trendlines while preserving data structure

# trendline v1.0
(19 Nov 2024)

This package provides the ability to draw simple aggregate line plots while preserving the structure of the data.

The package is still beta and is being constantly improved. It might still be missing checks and features. 


## Installation

The package can currently be installed from GitHub only:

```
net install trendline, from("https://raw.githubusercontent.com/jdcols01/trendline/main/installation/") replace
```

Even if you have the package installed, make sure that it is updated `ado update, update`.

## Syntax

The syntax for the latest version is as follows:

```stata
trendline numvar [if] [in], 
                time(varname) [category(varname) statistic(string) graph_options]
```

See the help file `help trendline` for details.

## Citation guidelines
Software packages take countless hours of programming, testing, and bug fixing. If you use this package, then a citation would be highly appreciated. Suggested citations:


*in BibTeX*

```
@software{trendline,
   author = {Colston, Jared},
   title = {Stata package ``trendline''},
   url = {https://github.com/jdcols01/trendline},
   version = {1.0},
   date = {2024-11-19}
}
```

*or simple text*

```
Colston, J. (2024). Stata package "trendline" version 1.0. Release date 19 November 2024. https://github.com/jdcols01/trendline.
```



## Examples

```stata
import delimited "https://raw.githubusercontent.com/jdcols01/trendline/refs/heads/main/world_gdp.csv", clear
encode region, gen(regnum)
```

Overall trend lines when no category is specified:

```
trendline gdp_percap, time(year)
```

<img src="/figures/figure1.png" width="100%">

Create trend lines by category:

```
trendline gdp_percap, time(year) category(regnum)
```

<img src="/figures/figure2.png" width="100%">

Change the aggregate statistic:
```
trendline gdp_percap, time(year) category(regnum) statistic(median)
```

<img src="/figures/figure3.png" width="100%">


Condition the trend lines based on select categories:

```
trendline gdp_percap if inlist(regnum,1,2), time(year) category(regnum)
```

<img src="/figures/figure4.png" width="100%">

Use all of the other twoway line options:

```
trendline gdp_percap if inlist(regnum,1,2), time(year) category(regnum) lpattern(dash)
```

<img src="/figures/figure5.png" width="100%">


```
trendline gdp_percap if inlist(regnum,1,2), time(year) category(regnum) lpattern(dash) scheme(s2color)
```

<img src="/figures/figure6.png" width="100%">

## Feedback

Please open an [issue](https://github.com/jdcols01/trendline/issues) to report errors, feature enhancements, and/or other requests. 


## Change log

**v1.0 (19 Nov 2024)**
- First release