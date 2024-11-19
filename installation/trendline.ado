*! 1.0 JDC 2024.11.19

capture program drop trendline
program define trendline
	
// Establish the syntax
	syntax varlist(numeric min=1 max=1) [if] [in] ///
		[aweight fweight pweight] , Time(varname) [CATegory(varname) ///
		STATistic(string) * ]
		
// Parse options
	if "`statistic'" == "" local statistic mean
	else local statistic "`statistic'"
	
	if "`category'" != "" {
		local collapsecat ", by(`time' `category')"
		local separatecmd "separate `varlist', by(`category') veryshortlabel"
	} 
	
	else {
		local collapsecat ", by(`time')"
		local yvar "`varlist'"
	}
	
// Draw graph
	quietly {
		preserve
			capture keep `if'
			collapse (`statistic') `varlist' `collapsecat'
			`separatecmd'
			if "`category'" != "" {
				local yvar "`r(varlist)'"
			} 				
			twoway line `yvar' `time', `options'
		restore
	}
end
	

























