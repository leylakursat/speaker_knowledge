library(tidyverse)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
setwd('../data')
d = read.csv("example-subject_information.csv", header = TRUE)

# look at comments
unique(d$comments)

# fair price
ggplot(d, aes(x=fairprice)) +
  geom_histogram(stat="count")

# overall assessment
ggplot(d, aes(x=asses)) +
  geom_histogram(stat="count")
table(d$asses, d$workerid)

# enjoyment (3 levels)
ggplot(d, aes(x=enjoyment)) +
  geom_histogram(stat="count")

# age
ggplot(d, aes(x=age)) +
  geom_histogram(stat="count")

# gender
ggplot(d, aes(x=gender)) +
  geom_histogram(stat="count")

# education
ggplot(d, aes(x=education)) +
  geom_histogram(stat="count")

# language
ggplot(d, aes(x=language)) +
  geom_histogram(stat="count")

# average time 
df = read.csv("example-trials.csv", header = TRUE)

times = df %>%
  select(workerid,Answer.time_in_minutes) %>%
  unique()

times

times = times %>% 
  left_join(d,by = c("workerid"))

ggplot(times, aes(x=Answer.time_in_minutes)) +
  geom_histogram()

ggplot(times, aes(x=age, y=Answer.time_in_minutes)) +
  geom_point()+
  geom_smooth(method="lm")

times %>%
  filter(Answer.time_in_minutes<7)
