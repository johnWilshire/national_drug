# clean up for nhdsd
# import data
df <- read.csv("ndshs2010.csv", stringsAsFactors = FALSE)
var_definitions <- read.csv("variabledefinitions.csv", stringsAsFactors = FALSE)
var_descriptions <- read.csv("variabledescriptions.csv", stringsAsFactors = FALSE)


# relable sexs
df$Sex[df$Sex == 1] <- "Male"
df$Sex[df$Sex == 2] <- "Female"

# relable alcohol
alch_lab <- var_definitions[var_definitions$Variable == "Alcohol", 3]
df$Alcohol[df$Alcohol == -1] <- 0
df$Alcohol <- df$Alcohol + 1
df$Alcohol <- alch_lab[df$Alcohol]

# relable tobacco
smoke_lab <- var_definitions[var_definitions$Variable == "Tobacco", 3]
df$Tobacco[df$Tobacco == -1] <- 0
df$Tobacco <- df$Tobacco + 1
df$Tobacco <- smoke_lab[df$Tobacco]

# relable Marijuana
weed_lab <- var_definitions[var_definitions$Variable == "Marijuana", 3]
df$Marijuana[df$Marijuana == -1] <- 0
df$Marijuana <- df$Marijuana + 1
df$Marijuana <- smoke_lab[df$Marijuana]

# remove missing
df <- df[df$Alcohol != "Missing", ]
df <- df[df$Tobacco != "Missing", ]

# attitudes


