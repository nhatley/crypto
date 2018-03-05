library(tidyverse)
library(httr)

#documenation here: https://min-api.cryptocompare.com/data/histoday?fsym=BTC&tsym=USD&limit=10

#all comes from this base: https://rest.coinapi.io/v1/ohlcv/
coins = read_rds("data/lists/five_coins.rds")
#all historical functions live here
source("code/functions/get_historical.R")
#one week
one_week = map_df(coins, function(x) get_historical_weeks(x, 1)) %>% mutate(duration = "one_week")
saveRDS(one_week, paste0("data/historical/time_series_cache//btc_eth_ltc_xrp_one_week", "_", Sys.Date(), ".rds"))
#one month
one_month = map_df(coins, function(x) get_historical_weeks(x, 4)) %>% mutate(duration = "one_month")
saveRDS(one_month, paste0("data/historical/time_series_cache//btc_eth_ltc_xrp_one_month", "_", Sys.Date(), ".rds"))
#three_months #this is the furhest back BITSTAMP_SPOT_BCH gpoes
three_months = map_df(coins, 
                      function(x) get_historical_weeks(x, 12)) %>% mutate(duration = "three_months")
saveRDS(three_months, paste0("data/historical/time_series_cache//btc_eth_ltc_xrp_three_months", "_", Sys.Date(), ".rds"))
#six months
six_months = map_df(coins, 
                    function(x) get_historical_weeks(x, 24)) %>% mutate(duration = "six_months")
saveRDS(six_months, paste0("data/historical/time_series_cache//btc_eth_ltc_xrp_six_months", "_", Sys.Date(), ".rds"))
#nine months
nine_months = map_df(coins, 
                    function(x) get_historical_weeks(x, 36)) %>% mutate(duration = "nine_months")
saveRDS(nine_months, paste0("data/historical/time_series_cache//btc_eth_ltc_xrp_nine_months", "_", Sys.Date(), ".rds"))
#one_year furthest back for BITSTAMP_SPOT_ETH_USD, BITSTAMP_SPOT_LTC_USD
one_year = map_df(coins, 
                    function(x) get_historical_weeks(x, 48)) %>% mutate(duration = "one_year")
saveRDS(one_year, paste0("data/historical/time_series_cache//btc_eth_ltc_xrp_one_year", "_", Sys.Date(), ".rds"))
two_years = map_df(coins, 
                  function(x) get_historical_weeks(x, 96)) %>% mutate(duration = "two_years")
saveRDS(one_year, paste0("data/historical/time_series_cache//btc_eth_ltc_xrp_two_years", "_", Sys.Date(), ".rds"))

all_data = one_week %>% bind_rows(one_month) %>% bind_rows(three_months) %>% 
  bind_rows(six_months) %>%  bind_rows(nine_months) %>% 
  bind_rows(one_year) %>% bind_rows(two_years)

saveRDS(all_data, "data/historical/all_data.rds")
saveRDS(all_data, paste0("data/historical/time_series_cache//btc_eth_ltc_xrp", "_", Sys.Date(), ".rds"))
