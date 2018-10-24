library(tidyselect)


## Load time series data
# readxl is needed for loading data from excel files
library(readxl)

# sometimes the read_xlsx function can infer the proper data types on its own.
# It needs a little help here, though.
col_types = c('date', rep('numeric', 12))
df_whole = read_xlsx('../data/assetclass_data_monthly.xlsx', sheet='data', col_types = col_types)

# select out the date column
dates = df_whole %>% select('Dates')
# create a table of only the numeric columns (for convenience)
df = df_whole %>% select(-one_of('Dates'))

## Examine other example datasets
# https://ggplot2.tidyverse.org/reference/mpg.html
mpg
# https://ggplot2.tidyverse.org/reference/diamonds.html
diamonds

# Examples from pythonplot.com. Various examples using multiple packages.

# Bar chart
ggplot(data=mpg) + 
  aes(x=manufacturer) + 
  geom_bar() + 
  coord_flip() +
  ggtitle("Number of Cars by Make")

# Histogram
ggplot(data=mpg) + 
  aes(x=cty) + 
  geom_histogram(binwidth=2)

# Scatter plot
ggplot(data = mpg) +
  aes(x = displ, y = hwy) +
  geom_point() + 
  ggtitle("Engine Displacement in Liters vs Highway MPG") +
  xlab("Engine Displacement in Liters") +
  ylab("Highway MPG")

# Time Series
ggplot(df_whole) + aes(Dates, `Domestic Equity`) + geom_line()


# Scatter Plot with Facets and Color
ggplot(data = mpg) + 
  aes(x = displ, y = hwy, color = class) +
  geom_point() + 
  ggtitle("Engine Displacement in Liters vs Highway MPG") +
  xlab("Engine Displacement in Liters") +
  ylab("Highway MPG")

# Scatter plot with points sized by continuous value
ggplot(data = mpg) +
  aes(x = cty, y = hwy, size = cyl) +
  geom_point(alpha=.5)


