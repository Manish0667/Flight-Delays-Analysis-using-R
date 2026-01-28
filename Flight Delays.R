------------------------------------
  # Step 1: Install Required Packages
  ------------------------------------
# Install Required Packages
install.packages("readxl")
library(readxl)

install.packages("ggplot2")
library(ggplot2)

install.packages("dplyr")
library(dplyr)

--------------------------------------------
#Step 2: Read the Dataset + Understand Data
--------------------------------------------
# Load dataset
flight_data <- read_excel("flightdelays.xlsx")

# Viwe first rows
head(flight_data)

# Structure of dataset
str(flight_data)

# Dimensions (rows, columns)
dim(flight_data)

# Check missing values
colSums(is.na(flight_data))

# Total missing values
sum(is.na(flight_data))

--------------------------------------------
# Step 3: Summary of Descriptive Statistics
--------------------------------------------  
# Summary of Descriptive Statistics
summary(flight_data)

# Histograms (Relationships)
ggplot(flight_data, aes(x = schedtime)) +
  geom_histogram() +
  ggtitle("Histogram of Scheduled Time")

-------------------------------------
# Step 4: Histograms (Relationships)  
-------------------------------------
# Scheduled Time
ggplot(flight_data, aes(x = schedtime)) +
  geom_histogram() +
  ggtitle("Histogram of Scheduled Time")

# Carrier
ggplot(flight_data, aes(x = carrier)) +
  geom_bar() +
  ggtitle("Flights by Carrier")

# Destination
ggplot(flight_data, aes(x = dest)) +
  geom_bar() +
  ggtitle("Flights by Destination")

# Origin
ggplot(flight_data, aes(x = origin)) +
  geom_bar() +
  ggtitle("Flights by Origin Airport")

# Weather (0=On time, 1=Delayed)
ggplot(flight_data, aes(x = weather)) +
  geom_bar() +
  ggtitle("Weather Impact on Delays")

# Day of Week
ggplot(flight_data, aes(x = dayweek)) +
  geom_bar() +
  ggtitle("Flights by Day of Week")

----------------------------------------------------
# Step 5: Scatter Plot (On Time vs Delayed Flights)
----------------------------------------------------
ggplot(flight_data, aes(x = distance, y = deptime, color = as.factor(delay))) +
  geom_point() +
  ggtitle("Scatter Plot: Distance vs Departure Time") +
  labs(color = "Delay Status")

-------------------------------------------
# Step 6: Box Plot (Delay by Day of Month)
-------------------------------------------
ggplot(flight_data, aes(x = as.factor(daymonth), y = deptime)) +
  geom_boxplot() +
  ggtitle("Departure Time Distribution Across Month Days")

------------------------------------
# Step 7: Define Hours of Departure
------------------------------------
flight_data$dep_hour <- floor(flight_data$deptime / 100)

head(flight_data$dep_hour)

-------------------------------------------------
# Step 8: Categorical Representation Using Table
-------------------------------------------------
table(flight_data$carrier, flight_data$delay)

-----------------------------------
# Step 9: Redefine Delay Variable
-----------------------------------
flight_data$delay_status <- ifelse(flight_data$delay == 1, "Delayed", "On Time")

table(flight_data$delay_status)

--------------------------------------
# Step 10: Summary of Major Variables
--------------------------------------
summary(flight_data$distance)
summary(flight_data$schedtime)
summary(flight_data$deptime)

-----------------------------------------
# Step 11: Histograms of Major Variables
-----------------------------------------
ggplot(flight_data, aes(x = distance)) +
  geom_histogram() +
  ggtitle("Histogram of Flight Distance")

---------------------------------------
# Step 12: Pie Chart (Flights Delayed)
---------------------------------------
delay_count <- table(flight_data$delay_status)

pie(delay_count,
    main = "Delayed vs On-Time Flights")

