* NOTE: You need to set the Stata working directory to the path
* where the data file is located.

set more off

clear
quietly infix                    ///
  str     rectype       1-1      ///
  byte    statefip      54-55    ///
  int     county        56-59    ///
  byte    gq            94-94    ///
  int     enumdist      125-128  ///
  using `"/pkg/ipums/misc/census-das/das_dp_data/EXT1940USCB.dat"'
gen  _line_num = _n
drop if rectype != `"H"'
sort _line_num
save __temp_ipums_hier_H.dta

clear
quietly infix                    ///
  str     rectype       1-1      ///
  int     age           74-76    ///
  byte    race          85-85    ///
  byte    hispan        89-89    ///
  using `"/pkg/ipums/misc/census-das/das_dp_data/EXT1940USCB.dat"'
gen  _line_num = _n
drop if rectype != `"P"'
sort _line_num
save __temp_ipums_hier_P.dta

clear
use __temp_ipums_hier_H.dta
append using __temp_ipums_hier_P.dta
sort _line_num
drop _line_num
erase __temp_ipums_hier_H.dta
erase __temp_ipums_hier_P.dta

label var statefip     `"State (FIPS code)"'
label var county       `"County"'
label var gq           `"Group quarters status"'
label var enumdist     `"Enumeration district"'
label var age          `"Age"'
label var race         `"Race [general version]"'
label var hispan       `"Hispanic origin [general version]"'

save /pkg/ipums/misc/census-das/das_dp_data/stata/ipums_usa_orig.dta, replace
