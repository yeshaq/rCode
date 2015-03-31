library(acs)
zipList = c("07652","04106","14215","84404","44122","63109","21114","30132","07030","60187")
geos=geo.make(zip.code=zipList)
kTown=acs.fetch(geography=geos, table.number="B19013")
x = seq(20000,100000,10000)
print(x)
findInterval(estimate(kTown),x)