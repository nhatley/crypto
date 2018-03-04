library(tidyverse)
library(httr)

current_date <- as.numeric(as.POSIXct(Sys.Date(), format="%Y-%m-%d"))
  
six_months_ago <- as.POSIXct(Sys.Date(), format="%Y-%m-%d") - lubridate::dweeks(24)

#documenation here: https://min-api.cryptocompare.com/data/histoday?fsym=BTC&tsym=USD&limit=10

#all comes from this base: https://rest.coinapi.io/v1/ohlcv/

#coin API
#site = https://docs.coinapi.io/#general
key = "F21A43CA-D364-47CA-B7D4-11CB7A0BD205"
url_base = "https://rest.coinapi.io/"
middle = "/v1/ohlcv/BTC"
period = "?period_id="

bitstamp_btc_usd = "BITSTAMP_SPOT_BTC_USD"
bitstamp_eth_usd = "BITSTAMP_SPOT_ETH_USD"
bitstamp_ltc_usd = "BITSTAMP_SPOT_LTC_USD"
bitstamp_xrp_usd = "BITSTAMP_SPOT_XRP_USD"
bitstamp_bch_usd = "BITSTAMP_SPOT_BCH_USD"

#can see all symbols at data/lists/symbols.rds
coins = list(bitstamp_btc_usd, bitstamp_eth_usd, bitstamp_ltc_usd, 
             bitstamp_xrp_usd, bitstamp_bch_usd)
saveRDS(coins, "data/lists/five_coins.rds")
#all historical functions live here
source("code/functions/get_historical.R")
#one day
one_week = map_df(coins, function(x) get_historical_weeks(x, 1)) %>% mutate(duration = "one_week")
saveRDS(six_months, "data/historical/btc_eth_ltc_xrp_bch_sixmos.rds")


one_week = map_df(coins, function(x) get_historical_weeks(x, 1)) %>% mutate(duration = "one_week")
saveRDS(six_months, "data/historical/btc_eth_ltc_xrp_bch_sixmos.rds")


#one month
six_months = map_df(coins, get_one_months)
saveRDS(six_months, "data/historical/btc_eth_ltc_xrp_bch_sixmos.rds")
  #six months
six_months = map_df(coins, get_six_months)
saveRDS(six_months, "data/historical/btc_eth_ltc_xrp_bch_sixmos.rds")

  #one_year
one_year = map_df(coins, get_one_year)
#some symbols are not available this long; investigate
saveRDS(one_year, "data/historical/btc_eth_ltc_xrp_bch_oneyear.rds")

  #two_years
two_years = map_df(coins, get_two_years)
#some symbols are not available this long; investigate
saveRDS(one_year, "data/historical/btc_eth_ltc_xrp_bch_twoyears.rds")



