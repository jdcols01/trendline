{smcl}

Trendline: Simple aggregate lineplots while preserving data structure.

{p 8 17 2} 
{cmd:trendline}
{it:yvar}
[{it:weight}] 
[{help if}] 
[{help in}]{cmd:,}
{cmdab:t:ime(}{it:varname}{cmd:)} 
[{cmdab:cat:egory(}{it:varname}{cmd:)}
{cmdab:stat:istic(}{it:string}{cmd:)} 
{it:graph_options}]

{p 8 17 2}
Weights are supported if and as allowed by the {cmd:twoway} plot requested. 


{title:Description} 

{p 4 4 2} 
{cmd:trendline} is a wrapper for {help twoway line} that aggregates a y-variable 
over time based on your specifications. Using the {help collapse} command, 
this package provides aggregate measures over {cmd:time()} and optionally by {cmd:category()}. 
This wrapper is a reduced package as compared to other line graph packages, 
allowing it to be flexible with Stata's new suite of {help twoway} options.


{title:Options}

{p 4 8 2}
{cmd:time()} specifies the variable that measures time periods in your data. 
This is a required option.

{p 4 8 2}
{cmd:category()} is a categorical variable with which to separate the different trend lines. 
This can be numeric or string. If this option is not specified, the trend line represents 
the entire dataset over {cmd:time()}.

{p 4 8 2}
{cmd:statistic()} allows you to specify how you would like the trend line to be aggregated. 
All statistic options available in {help collapse} are available here. The default is {cmd: mean}.

{p 4 8 2}
All {it:graph_options} permitted for {help twoway line} are allowed with this command. 


{title:Examples} 

Use data from the World Bank for a multi-level time series.
{p 4 8 2}{cmd:. import delimited "https://raw.githubusercontent.com/jdcols01/trendline/refs/heads/main/world_gdp.csv", clear}{p_end}
{p 4 8 2}{cmd:. encode region, gen(regnum)}{p_end}

Overall trend lines when no category specified.
{p 4 8 2}{cmd:. trendline gdp_percap, time(year)}{p_end}

Trend lines by category.
{p 4 8 2}{cmd:. trendline gdp_percap, time(year) category(regnum)}{p_end}

Changing the aggregate statistic.
{p 4 8 2}{cmd:. trendline gdp_percap, time(year) category(regnum) statistic(median)}{p_end}

Condition the trend lines based on select categories.
{p 4 8 2}{cmd:. trendline gdp_percap if inlist(regnum,1,2), time(year) category(regnum)}{p_end}

Use all other {help twoway line} options.
{p 4 8 2}{cmd:. trendline gdp_percap if inlist(regnum,1,2), time(year) category(regnum) lpattern(dash)}{p_end}
{p 4 8 2}{cmd:. trendline gdp_percap if inlist(regnum,1,2), time(year) category(regnum) lpattern(dash) scheme(s2color)}{p_end}


{title:Author} 

{p 4 4 2}Jared D. Colston, University of Wisconsin-Madison{break} 
         colston@wisc.edu


{title:Also see}

{p 4 13 2}
On-line: help for {help line}, help for {help twoway}
