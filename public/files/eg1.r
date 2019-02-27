## start with a clean slate
rm(list=ls())



###############################
## say we count six individuals in a quadrat
n <- 6

## take a guess at the mean number
guess <- 7

## get the probability of the data given our guess
dpois(n, guess)

## our statistical model is that the obs data come from a Poisson distribution
## with mean "guess"
## e.g., Y = Poisson(X, guess)





###############################
## say we counted the number of individuals in 7 quadrats
n <- c(10, 5, 7, 6, 7, 4, 4)

## make another guess
guess <- 7

## get the probability of observing the model given the data
dpois(n, guess)

## keep these probabilities
ps <- dpois(n, guess)

## likelihood is most often measured as the log likelihood
log.ps <- log(ps)

## and we sum all the values across the observed data
sum.log.ps <- sum(log.ps)
sum.log.ps

## lets do all this in one step
sum(dpois(n, guess, log=T))
## thank goodness this is the same as the value that Excel gives.



###############################
## the challenge is to find the value of guess (the parameter of the model)
## that maximises the likelihood
## this is equivalent to minimising the log-likelihood

## make a vector of guesses
guesses <- seq(4, 10, 0.1)

## make an empty numeric vector into which we will put the likelihoods
log.likes <- numeric(length=length(guesses))

## use a loop to get each of the log likelihoods
for(i in 1:length(guesses))
	log.likes[i] <- sum(dpois(n, guesses[i], log=T))
	
## plot the log likelihood against the guess
par(cex=2)
plot(log.likes ~ guesses, type="l",
     xlab="Guess of the value of the mean",
     ylab="Log-likelihood", cex=2, lwd=2)
abline(v=6.1, lty="dashed")
## this is a likelihood surface

## report the maximum likelihood value
max(log.likes)

## find the guess which gives the maximimum log likelihood
guesses[which(log.likes==max(log.likes))]
## looks like 6.1 is the estimate of the mean that maximises the likelihood
## of the getting the data give the model
## I.e., 6.1 is the maximimum likelihood parameter estimate
## !!! we have performed maximimum likelihood parameter estimation



###############################
## how else could we get the maximum likelihood estimate?
## the challenge is rather easy in fact, we could just take the mean!
mean(n)
sum(dpois(n, mean(n), log=T))
## but we really were very close with our previous search




## we could also use a generalised linear model with poisson error structure
m1 <- glm(n ~ 1, family="poisson")
summary(m1)
## remember that family poisson uses a log link
exp(coef(m1))
## or let predict() do the work
predict(m1, type="response")
## gives the mean we calculated above
## so our previous answer of 6.1 was not too bad

## the log-likelihood of our previous guess was
max(log.likes)

## calculate the AIC of our guess
-2*max(log.likes) + 2
## this is very close to the AIC of the glm




## what happens to the likelihood surface if we have different numbers of observations
obs.1 <- rpois(10, 10)
obs.2 <- rpois(100, 10)

## make a vector of guesses
guesses <- seq(8, 14, 0.05)

## use sapply to get the likelihoods for each of the guesses
ll1 <- sapply(guesses, function(x) sum(dpois(obs.1, x, log=T)))
ll2 <- sapply(guesses, function(x) sum(dpois(obs.2, x, log=T)))

## plot the graph
par(mar=c(5,4,2,2))
plot(guesses, ll1-max(ll1), type="l",
     xlab="Guess of the mean", ylab="Log-likelihood - max(log-likelihood)")
lines(guesses, ll2-max(ll2))




