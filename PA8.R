# David Hulse
# COP2073C
# Programming Assignment 8
# 08JULY2026

# Create the Data Frame
RecipeA <- c(0, 4, 4, 5, 4, 1, 2, 3, 3, 5)
RecipeB <- c(7, 6, 4, 2, 3, 0, 8, 6, 2, 3)
RecipeC <- c(1, 0, 1, 0, NA, 1, 1, NA, 1, 0)

df <- data.frame(RecipeA, RecipeB, RecipeC)

# Stack and Remove NA values
newdf <- na.omit(stack(df))

# Summary
initial_summary <- summary(newdf)
initial_summary

# ANOVA
anova_result <- aov(values ~ ind, data = newdf)

# Response: values
# Predictor: ind
# Null hypothesis(H0):
# Mean transformation score is the same for all three recipes.

# Alternative(H1):
# At least one recipe has a different mean transformation score.

anova_summary <- summary(anova_result)
anova_summary

pval <- anova_summary[[1]]$`Pr(>F)`[1]
pval

if (pval < 0.05) {
  message("Sufficient evidence to reject the null hypothesis. Ingredient X may
          have an effect on the result.")
} else {
  message("Not enough evidence to reject the null hypothesis. Ingredient X does
          not appear to have an effect on the result.")
}
