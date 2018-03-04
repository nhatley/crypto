library(tidyverse)
library(httr)

#documenation here: https://min-api.cryptocompare.com/data/histoday?fsym=BTC&tsym=USD&limit=10

#all comes from this base: https://rest.coinapi.io/v1/ohlcv/
coins = read_rds("data/lists/five_coins.rds")
#all historical functions live here
source("code/functions/get_historical.R")
#one day
one_day = map_df(coins, function(x) get_historical_days(x, 1)) %>% mutate(duration = "one_day")
saveRDS(one_day, "data/historical/time_series/btc_eth_ltc_xrp_bch_last_day.rds")
#two dayss
#five days
five_days = map_df(coins, function(x) get_historical_days(x, 5)) %>% mutate(duration = "five_days")
saveRDS(five_days, "data/historical/time_series/btc_eth_ltc_xrp_bch_five_days.rds")
#one week
one_week = map_df(coins, function(x) get_historical_weeks(x, 1)) %>% mutate(duration = "one_week")
saveRDS(one_week, "data/historical/time_series/btc_eth_ltc_xrp_one_week.rds")
#one month
one_month = map_df(coins, function(x) get_historical_weeks(x, 4)) %>% mutate(duration = "one_month")
saveRDS(six_months, "data/historical/time_series/btc_eth_ltc_xrp_bch_one_month.rds")
#three_months #this is the furhest back BITSTAMP_SPOT_BCH gpoes
three_months = map_df(coins, 
                      function(x) get_historical_weeks(x, 12)) %>% mutate(duration = "three_months")
saveRDS(six_months, "data/historical/time_series/btc_eth_ltc_xrp_bch_one_month.rds")
#six months
six_months = map_df(coins, 
                    function(x) get_historical_weeks(x, 24)) %>% mutate(duration = "six_months")
saveRDS(six_months, "data/historical/time_series/btc_eth_ltc_xrp_bch_six_months.rds")
#nine months
nine_months = map_df(coins, 
                    function(x) get_historical_weeks(x, 36)) %>% mutate(duration = "nine_months")
saveRDS(six_months, "data/historical/time_series/btc_eth_ltc_xrp_bch_nine_months.rds")
#one_year furthest back for BITSTAMP_SPOT_ETH_USD, BITSTAMP_SPOT_LTC_USD
one_year = map_df(coins, 
                    function(x) get_historical_weeks(x, 48)) %>% mutate(duration = "one_year")
saveRDS(one_year, "data/historical/time_series/btc_eth_ltc_xrp_bch_one_year.rds")

all_data = one_day %>% bind_rows(six_months) %>% bind_rows(nine_months) %>% 
  bind_rows(one_year) %>% bind_rows(two_years)

saveRDS(all_data, "data/historical/btc_eth_ltc_xrp_bch.rds")
