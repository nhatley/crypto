library(tidyverse)
library(plotly)

six_months = read_rds("data/historical/btc_eth_ltc_xrp_bch_sixmos.rds")

#example from: https://plot.ly/r/candlestick-charts/
# p <- df %>%
#   plot_ly(x = ~Date, type="candlestick",
#           open = ~AAPL.Open, close = ~AAPL.Close,
#           high = ~AAPL.High, low = ~AAPL.Low) %>%
#   layout(title = "Basic Candlestick Chart")

table(six_months$symbol)
#btc 6 months
btc_six_months_candlestick <- six_months %>%
  filter(symbol=="BITSTAMP_SPOT_BTC_USD") %>% 
  plot_ly(x = ~time_open, type="candlestick",
          open = ~price_open, close = ~price_close,
          high = ~price_high, low = ~price_low) %>%
  add_lines(x = ~time_open, y = ~price_close, 
            line = list(color = 'black', width = 0.75), inherit = F) %>%
  layout(showlegend = FALSE) %>% 
  layout(title = "BTC Six Months")

eth_six_months_candlestick <- six_months %>%
  filter(symbol=="BITSTAMP_SPOT_ETH_USD") %>% 
  plot_ly(x = ~time_open, type="candlestick",
          open = ~price_open, close = ~price_close,
          high = ~price_high, low = ~price_low) %>%
  add_lines(x = ~time_open, y = ~price_close, 
            line = list(color = 'black', width = 0.75), inherit = F) %>%
  layout(showlegend = FALSE) %>% 
  layout(title = "ETH Six Months")

ltc_six_months_candlestick <- six_months %>%
  filter(symbol=="BITSTAMP_SPOT_LTC_USD") %>% 
  plot_ly(x = ~time_open, type="candlestick",
          open = ~price_open, close = ~price_close,
          high = ~price_high, low = ~price_low) %>%
  add_lines(x = ~time_open, y = ~price_close, 
            line = list(color = 'black', width = 0.75), inherit = F) %>%
  layout(showlegend = FALSE) %>% 
  layout(title = "LTC Six Months")

bch_six_months_candlestick <- six_months %>%
  filter(symbol=="BITSTAMP_SPOT_BCH_USD") %>% 
  plot_ly(x = ~time_open, type="candlestick",
          open = ~price_open, close = ~price_close,
          high = ~price_high, low = ~price_low) %>%
  add_lines(x = ~time_open, y = ~price_close, 
            line = list(color = 'black', width = 0.75), inherit = F) %>%
  layout(showlegend = FALSE) %>% 
  layout(title = "Bitcoin Cash (BCH) Six Months")

 