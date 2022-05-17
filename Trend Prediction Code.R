library(wikipediatrend)
data<-wp_trend(page ="Obama", from="2010-01-01", to="2020-01-01");
View(data)

library(ggplot2)
qplot(date, views, data=data)
summary(data)

data $ views [data $ views ==0 ] <- NA
ds<- data$date
y<-log(data$views)
df<- data.frame(ds, y)
qplot(ds, y, data= df)

library(prophet) 
m<- prophet(df)


future<- make_future_dataframe(m, periods = 1000)
tail(future) 
forecast<-predict(m, future)
tail(forecast)
tail(forecast[c('ds')])

plot(m, forecast) # time scale forecast
prophet_plot_components(m, forecast) # forecast trend, weekly, yearly
