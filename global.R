library(tidyverse)
library(formattable)

total_cost = function(borrow, fees, period, interest_rate, repayment_pcm){
  df = tibble(year = 0:period,
              borrowed = borrow + fees,
              interest = (borrow + fees) * (interest_rate / 100))

  for (i in 2:nrow(df)){
    df$borrowed[i] = df$borrowed[i - 1] + df$interest[i - 1] - (repayment_pcm * 12)
    df$interest[i] = df$borrowed[i] * (interest_rate / 100)
  }

  sum(df$interest)
}

