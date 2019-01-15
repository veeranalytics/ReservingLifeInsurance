# Import Libraries
library(lifecontingencies)

# Import data
# Life Table data downloaded from Society of Acturies website
data(soaLt)

# Generate the actuarial table object using an interest rate of 6%
soaAct <- new("actuarialtable", x=soaLt$x, lx=soaLt$Ix, interest=0.06)

# Export in a dataframe showing corresponding commutation functions
soaActDf <- as(soaAct, "data.frame")
head(soaActDf)

# Definition of terms used in Actuarial Table
# x = Age interval (e.g. 1 year, 0-5 years, etc)
# Nx = Number alive at the beginning of the age interval x
# lx = Proportion alive at the beginning of age interval x
# Dx = Dx = v**x * lx, where v = 1/(1+interest rate)
# Cx =  v**(x+1) * dx, where v = 1/(1+interest rate) and 
# dx is The number of deaths between exact ages x and x+1
# Mx = Cx + Cx+1 + Cx+2 + ....
# Rx = The number of female offspring produced per female of age x 

# Example 01:
# Calculate the reserve for a (whole) life insurance policy on a 60-year-old
# policyholder paid by annual premiums at year 10
# First, we get the yearly benefit premium using
P <- Axn(soaAct,60)/axn(soaAct,60)

# and then we get the benefit reserve at year 10
V <- Axn(soaAct,60+10)-P*axn(soaAct,60+10)
V

# Example 02: 
# Calculate the reserve for a 20-year endowment at t = 10, for a policyholder
# aged 60.

#Endowment insurance
#full value premium
U=AExn(soaAct, 60,20)

#benefit yearly premium
P <- U/axn(soaAct, 60,20)

#reserve
V <- AExn(soaAct, 60+10,20-10)-P*axn(soaAct, 60+10,20-10)
V
             
             





