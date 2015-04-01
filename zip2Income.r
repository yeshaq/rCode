library(acs)
#zipList = c("07652","04106","14215","84404","44122","63109","21114","30132","07030","60187")
#geos=geo.make(zip.code=zipList)
#kTown=acs.fetch(geography=geos, table.number="B19013")
#x = seq(20000,100000,10000)
#print(x)
#findInterval(estimate(kTown),x)

### Given a csv file imported as testQ, a new column is formed which calculates the income from the homezipcode column.  

allZips = acs.fetch(geo = geo.make(zip.code="*"), table.number="B19013", endyear=2012) 

testQ$zipIncome <- apply(testQ['homezipcode'], 1, function(x) { ifelse(x %in% geography(allZips)[["zipcodetabulationarea"]],  estimate(acs.fetch(geo=geo.make(zip.code=as.character(x)),table.number="B19013")), 0)})