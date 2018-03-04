library(plotly)
library(tidyverse)

make_ohlc_candlestick <- function(df, symbol_in, title) {
  ##make sure tidyverse and plotly are loaded 
  if("package:plotly" %in% search() == FALSE |
     "package:tidyverse" %in% search() == FALSE)
    stop("Load in plotly and tidyverse")
    df %>%
    filter(symbol==symbol_in) %>% 
    plot_ly(x = ~time_open, type="candlestick",
            open = ~price_open, close = ~price_close,
            high = ~price_high, low = ~price_low) %>%
    add_lines(x = ~time_open, y = ~price_close, 
              line = list(color = 'black', width = 0.75), inherit = F) %>%
    layout(showlegend = FALSE) %>% 
    layout(title = title)
}

symbol = "BITSTAMP_SPOT_XRP_USD"
title = "XRP"
  one_year %>% 
  filter(symbol==symbol) %>% 
  plot_ly(x = ~time_open, type="candlestick",
          open = ~price_open, close = ~price_close,
          high = ~price_high, low = ~price_low) %>%
  add_lines(x = ~time_open, y = ~price_close, 
            line = list(color = 'black', width = 0.75), inherit = F) %>%
  layout(showlegend = FALSE) %>% 
  layout(title = title)
  