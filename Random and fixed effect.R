install.packages(“lme4”)
library(lme4)
politeness=read.csv("http://www.bodowinter.com/tutorial/politeness_data.csv")
politeness = read.csv(file.choose( ))
which(is.na(politeness$frequency))

#or
which(!complete.cases(politeness))
boxplot(frequency ~ attitude*gender,col=c("white","lightgray"),politeness)
lmer(frequency ~ attitude, data=politeness)
politeness.model = lmer(frequency ~ attitude + (1|subject) + (1|scenario), data=politeness)
summary(politeness.model)
politeness.model = lmer(frequency ~ attitude +
                          gender + (1|subject) +
                          (1|scenario), data=politeness)
summary(politeness.model)
politeness.null = lmer(frequency ~ gender +
                         (1|subject) + (1|scenario), data=politeness,
                       REML=FALSE)
politeness.model = lmer(frequency ~ attitude +
                          gender + (1|subject) + (1|scenario),
                        data=politeness, REML=FALSE)
anova(politeness.null,politeness.model)
coef(politeness.model)
politeness.model = lmer(frequency ~ attitude +
                          gender + (1+attitude|subject) +
                          (1+attitude|scenario),
                        data=politeness,
                        REML=FALSE)
coef(politeness.model)
politeness.null = lmer(frequency ~ gender +
                         (1+attitude|subject) + (1+attitude|scenario),
                       data=politeness, REML=FALSE)
anova(politeness.null,politeness.model)
all.res=numeric(nrow(mydataframe))
for(i in 1:nrow(mydataframe)){
  myfullmodel=lmer(response~predictor+
                     (1+predictor|randomeffect),POP[-i,])
  all.res[i]=fixef(myfullmodel)[somenumber]}
