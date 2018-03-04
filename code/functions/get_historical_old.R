get_historical_weeks <- function(symbol, weeks){
  key = "&apikey=F21A43CA-D364-47CA-B7D4-11CB7A0BD205"
  url_base = "https://rest.coinapi.io/"
  middle = "v1/ohlcv/"
  period = "/history?period_id="
  period_id = "1DAY"
  time_start = "&time_start="
  time_start_id = str_replace(str_remove(as.POSIXct(Sys.Date(), format="%Y-%m-%d") - 
                                           lubridate::dweeks(weeks), "$"), "[[:space:]]", "T")
  time_end = "&time_end="
  today = str_replace(str_remove(lubridate::ymd_hms(Sys.time()), "$"), "[[:space:]]", "T")
  limit = "&limit="
  limit_id = '100000'
  
  call = paste0(url_base, middle, symbol, period, period_id, time_start, time_start_id, 
                limit, limit_id, key)
  
  df = GET(call) %>% content()
  df2 = 
    tibble(
      raw_time_period_start = df %>% map_chr(magrittr::extract2, "time_period_start"),
      raw_time_period_end = df %>% map_chr(magrittr::extract2, "time_period_end"),
      raw_time_open = df %>% map_chr(magrittr::extract2, "time_open"),
      price_open = df %>% map_dbl(magrittr::extract2, "price_open"),
      price_high = df %>% map_dbl(magrittr::extract2, "price_high"),
      price_low = df %>% map_dbl(magrittr::extract2, "price_low"),
      price_close = df %>% map_dbl(magrittr::extract2, "price_open"),
      volume_traded = df %>% map_dbl(magrittr::extract2, "volume_traded"),
      trades = df %>% map_int(magrittr::extract2, "trades_count")
    ) %>% 
    mutate(
      time_period_start = lubridate::as_date(raw_time_period_start),
      time_period_end = lubridate::as_date(raw_time_period_end),
      time_open = lubridate::as_date(raw_time_open),
      symbol = symbol
    ) %>% 
    select(
      symbol, time_period_start, time_period_end, time_open, price_open, price_high, price_low, 
      price_close, volume_traded, trades)
  
  
  print(paste(df2$symbol[[1]], min(df2$time_period_start), "thru", max(df2$time_period_end)))
    
  return(df2)
}

get_one_year <- function(symbol){
  key = "&apikey=F21A43CA-D364-47CA-B7D4-11CB7A0BD205"
  url_base = "https://rest.coinapi.io/"
  middle = "v1/ohlcv/"
  period = "/history?period_id="
  period_id = "1DAY"
  time_start = "&time_start="
  time_start_id = str_replace(str_remove(as.POSIXct(Sys.Date(), format="%Y-%m-%d") - 
                                           lubridate::dweeks(48), "$"), "[[:space:]]", "T")
  time_end = "&time_end="
  today = str_replace(str_remove(lubridate::ymd_hms(Sys.time()), "$"), "[[:space:]]", "T")
  limit = "&limit="
  limit_id = '100000'
  
  call = paste0(url_base, middle, symbol, period, period_id, time_start, time_start_id, 
                limit, limit_id, key)
  
  df = GET(call) %>% content()
  df2 = 
    tibble(
      raw_time_period_start = df %>% map_chr(magrittr::extract2, "time_period_start"),
      raw_time_period_end = df %>% map_chr(magrittr::extract2, "time_period_end"),
      raw_time_open = df %>% map_chr(magrittr::extract2, "time_open"),
      price_open = df %>% map_dbl(magrittr::extract2, "price_open"),
      price_high = df %>% map_dbl(magrittr::extract2, "price_high"),
      price_low = df %>% map_dbl(magrittr::extract2, "price_low"),
      price_close = df %>% map_dbl(magrittr::extract2, "price_open"),
      volume_traded = df %>% map_dbl(magrittr::extract2, "volume_traded"),
      trades = df %>% map_int(magrittr::extract2, "trades_count")
    ) %>% 
    mutate(
      time_period_start = lubridate::as_date(raw_time_period_start),
      time_period_end = lubridate::as_date(raw_time_period_end),
      time_open = lubridate::as_date(raw_time_open),
      symbol = symbol
    ) %>% 
    select(
      symbol, time_period_start, time_period_end, time_open, price_open, price_high, price_low, 
      price_close, volume_traded, trades)
  
  
  print(paste(df2$symbol[[1]], min(df2$time_period_start), "thru", max(df2$time_period_end)))
  
  return(df2)
}

get_two_years <- function(symbol){
  key = "&apikey=F21A43CA-D364-47CA-B7D4-11CB7A0BD205"
  url_base = "https://rest.coinapi.io/"
  middle = "v1/ohlcv/"
  period = "/history?period_id="
  period_id = "1DAY"
  time_start = "&time_start="
  time_start_id = str_replace(str_remove(as.POSIXct(Sys.Date(), format="%Y-%m-%d") - 
                                           lubridate::dweeks(96), "$"), "[[:space:]]", "T")
  time_end = "&time_end="
  today = str_replace(str_remove(lubridate::ymd_hms(Sys.time()), "$"), "[[:space:]]", "T")
  limit = "&limit="
  limit_id = '100000'
  
  call = paste0(url_base, middle, symbol, period, period_id, time_start, time_start_id, 
                limit, limit_id, key)
  
  df = GET(call) %>% content()
  df2 = 
    tibble(
      raw_time_period_start = df %>% map_chr(magrittr::extract2, "time_period_start"),
      raw_time_period_end = df %>% map_chr(magrittr::extract2, "time_period_end"),
      raw_time_open = df %>% map_chr(magrittr::extract2, "time_open"),
      price_open = df %>% map_dbl(magrittr::extract2, "price_open"),
      price_high = df %>% map_dbl(magrittr::extract2, "price_high"),
      price_low = df %>% map_dbl(magrittr::extract2, "price_low"),
      price_close = df %>% map_dbl(magrittr::extract2, "price_open"),
      volume_traded = df %>% map_dbl(magrittr::extract2, "volume_traded"),
      trades = df %>% map_int(magrittr::extract2, "trades_count")
    ) %>% 
    mutate(
      time_period_start = lubridate::as_date(raw_time_period_start),
      time_period_end = lubridate::as_date(raw_time_period_end),
      time_open = lubridate::as_date(raw_time_open),
      symbol = symbol
    ) %>% 
    select(
      symbol, time_period_start, time_period_end, time_open, price_open, price_high, price_low, 
      price_close, volume_traded, trades)
  
  
  print(paste(df2$symbol[[1]], min(df2$time_period_start), "thru", max(df2$time_period_end)))
  
  return(df2)
}

get_three_months <- function(symbol){
  key = "&apikey=F21A43CA-D364-47CA-B7D4-11CB7A0BD205"
  url_base = "https://rest.coinapi.io/"
  middle = "v1/ohlcv/"
  period = "/history?period_id="
  period_id = "1DAY"
  time_start = "&time_start="
  time_start_id = str_replace(str_remove(as.POSIXct(Sys.Date(), format="%Y-%m-%d") - 
                                           lubridate::dweeks(12), "$"), "[[:space:]]", "T")
  time_end = "&time_end="
  today = str_replace(str_remove(lubridate::ymd_hms(Sys.time()), "$"), "[[:space:]]", "T")
  limit = "&limit="
  limit_id = '100000'
  
  call = paste0(url_base, middle, symbol, period, period_id, time_start, time_start_id, 
                limit, limit_id, key)
  
  df = GET(call) %>% content()
  df2 = 
    tibble(
      raw_time_period_start = df %>% map_chr(magrittr::extract2, "time_period_start"),
      raw_time_period_end = df %>% map_chr(magrittr::extract2, "time_period_end"),
      raw_time_open = df %>% map_chr(magrittr::extract2, "time_open"),
      price_open = df %>% map_dbl(magrittr::extract2, "price_open"),
      price_high = df %>% map_dbl(magrittr::extract2, "price_high"),
      price_low = df %>% map_dbl(magrittr::extract2, "price_low"),
      price_close = df %>% map_dbl(magrittr::extract2, "price_open"),
      volume_traded = df %>% map_dbl(magrittr::extract2, "volume_traded"),
      trades = df %>% map_int(magrittr::extract2, "trades_count")
    ) %>% 
    mutate(
      time_period_start = lubridate::as_date(raw_time_period_start),
      time_period_end = lubridate::as_date(raw_time_period_end),
      time_open = lubridate::as_date(raw_time_open),
      symbol = symbol
    ) %>% 
    select(
      symbol, time_period_start, time_period_end, time_open, price_open, price_high, price_low, 
      price_close, volume_traded, trades)
  
  
  print(paste(df2$symbol[[1]], min(df2$time_period_start), "thru", max(df2$time_period_end)))
  
  return(df2)
}

get_one_month <- function(symbol){
  key = "&apikey=F21A43CA-D364-47CA-B7D4-11CB7A0BD205"
  url_base = "https://rest.coinapi.io/"
  middle = "v1/ohlcv/"
  period = "/history?period_id="
  period_id = "1DAY"
  time_start = "&time_start="
  time_start_id = str_replace(str_remove(as.POSIXct(Sys.Date(), format="%Y-%m-%d") - 
                                           lubridate::dweeks(4), "$"), "[[:space:]]", "T")
  time_end = "&time_end="
  today = str_replace(str_remove(lubridate::ymd_hms(Sys.time()), "$"), "[[:space:]]", "T")
  limit = "&limit="
  limit_id = '100000'
  
  call = paste0(url_base, middle, symbol, period, period_id, time_start, time_start_id, 
                limit, limit_id, key)
  
  df = GET(call) %>% content()
  df2 = 
    tibble(
      raw_time_period_start = df %>% map_chr(magrittr::extract2, "time_period_start"),
      raw_time_period_end = df %>% map_chr(magrittr::extract2, "time_period_end"),
      raw_time_open = df %>% map_chr(magrittr::extract2, "time_open"),
      price_open = df %>% map_dbl(magrittr::extract2, "price_open"),
      price_high = df %>% map_dbl(magrittr::extract2, "price_high"),
      price_low = df %>% map_dbl(magrittr::extract2, "price_low"),
      price_close = df %>% map_dbl(magrittr::extract2, "price_open"),
      volume_traded = df %>% map_dbl(magrittr::extract2, "volume_traded"),
      trades = df %>% map_int(magrittr::extract2, "trades_count")
    ) %>% 
    mutate(
      time_period_start = lubridate::as_date(raw_time_period_start),
      time_period_end = lubridate::as_date(raw_time_period_end),
      time_open = lubridate::as_date(raw_time_open),
      symbol = symbol
    ) %>% 
    select(
      symbol, time_period_start, time_period_end, time_open, price_open, price_high, price_low, 
      price_close, volume_traded, trades)
  
  
  print(paste(df2$symbol[[1]], min(df2$time_period_start), "thru", max(df2$time_period_end)))
  
  return(df2)
}

get_two_weeks <- function(symbol){
  key = "&apikey=F21A43CA-D364-47CA-B7D4-11CB7A0BD205"
  url_base = "https://rest.coinapi.io/"
  middle = "v1/ohlcv/"
  period = "/history?period_id="
  period_id = "1DAY"
  time_start = "&time_start="
  time_start_id = str_replace(str_remove(as.POSIXct(Sys.Date(), format="%Y-%m-%d") - 
                                           lubridate::dweeks(2), "$"), "[[:space:]]", "T")
  time_end = "&time_end="
  today = str_replace(str_remove(lubridate::ymd_hms(Sys.time()), "$"), "[[:space:]]", "T")
  limit = "&limit="
  limit_id = '100000'
  
  call = paste0(url_base, middle, symbol, period, period_id, time_start, time_start_id, 
                limit, limit_id, key)
  
  df = GET(call) %>% content()
  df2 = 
    tibble(
      raw_time_period_start = df %>% map_chr(magrittr::extract2, "time_period_start"),
      raw_time_period_end = df %>% map_chr(magrittr::extract2, "time_period_end"),
      raw_time_open = df %>% map_chr(magrittr::extract2, "time_open"),
      price_open = df %>% map_dbl(magrittr::extract2, "price_open"),
      price_high = df %>% map_dbl(magrittr::extract2, "price_high"),
      price_low = df %>% map_dbl(magrittr::extract2, "price_low"),
      price_close = df %>% map_dbl(magrittr::extract2, "price_open"),
      volume_traded = df %>% map_dbl(magrittr::extract2, "volume_traded"),
      trades = df %>% map_int(magrittr::extract2, "trades_count")
    ) %>% 
    mutate(
      time_period_start = lubridate::as_date(raw_time_period_start),
      time_period_end = lubridate::as_date(raw_time_period_end),
      time_open = lubridate::as_date(raw_time_open),
      symbol = symbol
    ) %>% 
    select(
      symbol, time_period_start, time_period_end, time_open, price_open, price_high, price_low, 
      price_close, volume_traded, trades)
  
  
  print(paste(df2$symbol[[1]], min(df2$time_period_start), "thru", max(df2$time_period_end)))
  
  return(df2)
}

get_one_week <- function(symbol){
  key = "&apikey=F21A43CA-D364-47CA-B7D4-11CB7A0BD205"
  url_base = "https://rest.coinapi.io/"
  middle = "v1/ohlcv/"
  period = "/history?period_id="
  period_id = "1DAY"
  time_start = "&time_start="
  time_start_id = str_replace(str_remove(as.POSIXct(Sys.Date(), format="%Y-%m-%d") - 
                                           lubridate::dweeks(1), "$"), "[[:space:]]", "T")
  time_end = "&time_end="
  today = str_replace(str_remove(lubridate::ymd_hms(Sys.time()), "$"), "[[:space:]]", "T")
  limit = "&limit="
  limit_id = '100000'
  
  call = paste0(url_base, middle, symbol, period, period_id, time_start, time_start_id, 
                limit, limit_id, key)
  
  df = GET(call) %>% content()
  df2 = 
    tibble(
      raw_time_period_start = df %>% map_chr(magrittr::extract2, "time_period_start"),
      raw_time_period_end = df %>% map_chr(magrittr::extract2, "time_period_end"),
      raw_time_open = df %>% map_chr(magrittr::extract2, "time_open"),
      price_open = df %>% map_dbl(magrittr::extract2, "price_open"),
      price_high = df %>% map_dbl(magrittr::extract2, "price_high"),
      price_low = df %>% map_dbl(magrittr::extract2, "price_low"),
      price_close = df %>% map_dbl(magrittr::extract2, "price_open"),
      volume_traded = df %>% map_dbl(magrittr::extract2, "volume_traded"),
      trades = df %>% map_int(magrittr::extract2, "trades_count")
    ) %>% 
    mutate(
      time_period_start = lubridate::as_date(raw_time_period_start),
      time_period_end = lubridate::as_date(raw_time_period_end),
      time_open = lubridate::as_date(raw_time_open),
      symbol = symbol
    ) %>% 
    select(
      symbol, time_period_start, time_period_end, time_open, price_open, price_high, price_low, 
      price_close, volume_traded, trades)
  
  
  print(paste(df2$symbol[[1]], min(df2$time_period_start), "thru", max(df2$time_period_end)))
  
  return(df2)
}

