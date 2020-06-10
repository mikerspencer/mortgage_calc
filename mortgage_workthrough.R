library(tidyverse)


borrow = 80000
period = 10
interest = 2.59
repayment_pcm = 579

df = tibble(year = 0:period,
            borrowed = borrow,
            interest = borrow * (interest / 100))

for (i in 2:nrow(df)){
  df$borrowed[i] = df$borrowed[i - 1] + df$interest[i - 1] - (repayment_pcm * 12)
  df$interest[i] = df$borrowed[i] * (interest / 100)
}
