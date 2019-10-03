## Projeto "Test a Perceptual Phenomeno" feito pro Lorant Romano para o Nanodegree da Udacity: Data Analyst

# Carregando os dados

df <- read.csv('stroopdata.csv')
head(df)


### Q1: Question response correctly identifies the independent and dependent variables in the experiment.
#### R: The independent Variable is if is Congruent or Incongruent, de dependet variable is the time taken to fininsh
#### PS:The Data Frame is with worng disposition of data, as variable, Congruent and incongruent should be a unique column.

### Q2a: Null and alternative hypotheses are clearly stated in words and mathematically. Symbols in the mathematical statement are defined.
### R: H0 = There are no statisticaly differences between Congruents and Incongruents observations
### R: H1 = There are statisticaly differences between Congruents and Incongruents observations

### Q2b: A statistical test is proposed which will distinguish the proposed hypotheses. Any assumptions made by the statistical test are addressed.
### R: I will use t-test to reject or not the null hypotheses

### Q3: Descriptive statistics, including at least one measure of centrality and one measure of variability, have been computed for the dataset’s groups.
print(paste0("The mean time of Congruent ones are: ",mean(df$Congruent)))
print(paste0("The median time of Congruent ones are: ",median(df$Congruent)))
print(paste0("The standard deviation of Congruent ones are: ",sd(df$Congruent)))
summary(df$Congruent)

print(paste0("The mean time of incongruent ones are: ",mean(df$Incongruent)))
print(paste0("The median time of incongruent ones are: ",median(df$Incongruent)))
print(paste0("The standard deviation of incongruent ones are: ",sd(df$Incongruent)))
summary(df$Incongruent)

### Q4: One or two visualizations have been created that show off the data, including comments on what can be observed in the plot or plots.
# Sturge's Rule # of bin
sr <- round(1+3.222  * log10(length(df$Congruent)))
hist(df$Congruent, breaks = seq(5,25,(25-5) / sr), prob = T)
lines(density(df$Congruent))
sr <- round(1+3.222  * log10(length(df$Incongruent)))
hist(df$Incongruent, breaks = seq(15,40,(40-15)/ sr), prob = T)
lines(density(df$Incongruent))
### R: Looking for the Congruent's Histogram, we can see that the distribution is near to normal, although, at Incongruent's Histogram, 
### shows us a Right Skewed distribution

### Q5: A statistical test has been correctly performed and reported, including test statistic, p-value, and test result. 
### The test results are interpreted in terms of the experimental task performed. Alternatively, students may use a bootstrapping 
### approach to simulate the results of a traditional hypothesis test.

## alpha = 0.05
## degree of freedom(df) = 24
## t-critical = 2.064

MeanDiff <- mean(df$Congruent) - mean(df$Incongruent)
sdDiff <- sd(df$Congruent - df$Incongruent)

t <- MeanDiff / (sdDiff / sqrt(length(df$Congruent-1)))

### R: We reject the null Hypothesys due the fact our t (8.02) is bigger than our critical area (2.064)
