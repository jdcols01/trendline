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

{p 4 8 2}{cmd:. sysuse auto, clear}

{p 4 8 2}{cmd:. sepscatter mpg weight, separate(foreign)}{p_end}
{p 4 8 2}{cmd:. gen myforeign = substr("df", foreign + 1, 1)}{p_end}
{p 4 8 2}{cmd:. sepscatter mpg weight, separate(foreign) mylabel(myforeign)}{p_end}
{p 4 8 2}{cmd:. sepscatter mpg weight, separate(foreign) mynumeric(myforeign)}{p_end}

{p 4 8 2}{cmd:. sepscatter mpg weight, separate(rep78) mylabel(rep78)}{p_end}
{p 4 8 2}{cmd:. sepscatter mpg weight, separate(rep78) missing legend(ring(0) pos(1) col(1))}{p_end}

{p 4 8 2}{cmd:. webuse grunfeld, clear}{p_end}
{p 4 8 2}{cmd:. sepscatter mvalue time, separate(company) recast(connect) ysc(log) yla(5000 2000 1000 500 200 100)  legend(pos(3) col(1))}{p_end}
{p 4 8 2}{cmd:. sepscatter mvalue time, separate(company) recast(connect) ysc(log) yla(5000 2000 1000 500 200 100)  legend(pos(3) col(1))} 


{title:Author} 

{p 4 4 2}Jared D. Colston, University of Wisconsin-Madison{break} 
         colston@wisc.edu


{title:Also see}

{p 4 13 2}
On-line: help for {help line}, help for {help twoway}
