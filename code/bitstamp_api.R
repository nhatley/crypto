library(tidyverse)
library(httr)

tick <- GET("https://www.bitstamp.net/api/ticker/") %>% content()

cb_tick <- GET("https://api.coinbase.com/v2/prices/spot?currency=USD/date=2016-10-10") %>% 
  content()

cb_tick_hist <-  GET("https://api.coinbase.com/v2/prices/spot?currency=USDspot?date=2016-10-10") %>% 
  content()
  

#https://api.coinbase.com/v2/prices/:currency_pair/spot

