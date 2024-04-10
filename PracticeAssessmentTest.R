# Q1 ------------------------------------------------------------------------------------------------
# Store the ufo data into a data frame called ufo_data. 
# Show the structure of the UFO data frame as well as the first 15 rows of data within the data frame. 
# Then count the number of rows within the UFO data frame to confirm there are 89071 rows in it. 
# ---------------------------------------------------------------------------------------------------

ufo_data <- read.csv("ufo.csv")

# View the structure of the UFO data frame
str(ufo_data)

# Show the first 15 rows of the UFO data frame
head(ufo_data, 15)

# Count the number of rows in the UFO data frame
rows_count <- nrow(ufo_data)
print(paste("The number of rows in the UFO data frame is:", rows_count))

# Q2 ------------------------------------------------------------------------------------------------
# The datetime field is currently set as a chr variable and needs to be converted to a date variable. 
# The current date structure is represented in mm/dd/yyyy format.
# Using the relevant R command, convert the datetime variable to a date variable, 
# and prove that the date variable has been converted to a date variable. 
# ---------------------------------------------------------------------------------------------------

# Convert 'datetime' from character to Date format
ufo_data$datetime <- as.Date(ufo_data$datetime, format="%m/%d/%Y")

# To check  the conversion, use the str() function to show the structure of the data frame again
str(ufo_data$datetime)

# Q3 ------------------------------------------------------------------------------------------------
# Update the UFO data frame with the new date structure. 
# And prove that the date structure has now changed to a date variable 
# by displaying the new structure of the UFO data frame.  
# ---------------------------------------------------------------------------------------------------

# Display the structure of the updated ufo_data data frame
str(ufo_data)

# Q4 ------------------------------------------------------------------------------------------------
# The UFO data frame contains some headings that could cause future issues when referencing them. 
# Using the names() function, display the names of the UFO data frame. 
# Then modify the variable names shown in the table with their updated variable names. 
# Prove that the variable names have changed using the names() function 
# once you’ve modified the variable names. 
# ---------------------------------------------------------------------------------------------------

# Display current column names
names(ufo_data)

# Update column names
names(ufo_data)[names(ufo_data) == "duration..seconds."] <- "DurationSeconds"
names(ufo_data)[names(ufo_data) == "duration..hours.min."] <- "DurationHrsMins"
names(ufo_data)[names(ufo_data) == "date.posted"] <- "DatePosted"

# Display updated column names to confirm changes
names(ufo_data)

# Q5 --------------------------------------------------------------------------------------------------
# The latitude variable is incorrectly defined as a chr variable when it should be a numerical variable. 
# Recode the variable so that it is a numerical variable. Then show the new structure of the data frame. 
# -----------------------------------------------------------------------------------------------------

# Convert 'latitude' from character to numeric
ufo_data$latitude <- as.numeric(ufo_data$latitude)

# Display the new structure of the ufo_data data frame
str(ufo_data)

# Q6 --------------------------------------------------------------------------------------------------
# Using the mice and VIM libraries, display the number of missing variables in the UFO data frame. 
# Indicate in your R script file the following information: 
# • How many records have no missing data content?
# • How many variables have the datetime records missing?  
# • Which variable has the largest number of missing data points? 
# • What percent of data is available without missing data points? 
# In your R comments, discuss the nature of the missing data within the data frame. 
# Save your missing variable plot into the working directory. Call the file missingvars.png. 
# -----------------------------------------------------------------------------------------------------

# install.packages("mice")
# install.packages("VIM")
library(mice)
library(VIM)

# Summary of missing data
md.pattern(ufo_data)

# Visualize missing data
aggr_plot <- aggr(ufo_data, col=c('navyblue','yellow'), numbers=TRUE, sortVars=TRUE,
                  labels=names(ufo_data), cex.axis=.7, gap=3, ylab=c("Histogram of missing data","Pattern"))

# Save plot to working directory
png(filename = "missingvars.png")
print(aggr_plot)
dev.off()

# • How many records have no missing data content?
# 88177
# • How many variables have the datetime records missing?
# 518
# • Which variable has the largest number of missing data points? 
# the 'datetime' variable has the largest number of missing data points (518)
# • What percent of data is available without missing data points? 
percent_complete_cases <- (88177 / 89394) * 100
percent_complete_cases
# 98.64%

# Q7 --------------------------------------------------------------------------------------------------
# Decide what to do with your missing data. Then apply your suggestion. 
# How many records have you deleted from the ufo data frame? 
# -----------------------------------------------------------------------------------------------------

# Before deletion, record the number of rows
original_count <- nrow(ufo_data)

# Delete records with any missing data
ufo_data_clean <- na.omit(ufo_data)

# After deletion, record the new number of rows
new_count <- nrow(ufo_data_clean)

# Calculate the number of records deleted
records_deleted <- original_count - new_count
records_deleted

# Q8 --------------------------------------------------------------------------------------------------
# Sort the UFO data frame firstly by shape and then by city. 
# Then extract only the columns datetime, city, country and shape and store the content into 
# a data frame called sorted_ufo_data. 
# Display the first 15 rows of data in this new data frame. And show the new data frame structure. 
# -----------------------------------------------------------------------------------------------------

# Sort the UFO data frame by 'shape' and then by 'city'
ufo_data_sorted <- ufo_data[order(ufo_data$shape, ufo_data$city),]

# Extract only the specified columns
sorted_ufo_data <- ufo_data_sorted[,c("datetime", "city", "country", "shape")]

# Display the first 15 rows of the new data frame
head(sorted_ufo_data, 15)

# Show the structure of the new data frame
str(sorted_ufo_data)

# Q9 --------------------------------------------------------------------------------------------------
# Using the subset() function, find all entries in the UFO data frame where the country equals “gb” 
# and the shape variable equals “disk”. 
# Store the contents in a data frame called ufo_gb_disk. 
# Prove that there are 111 records in ufo_gb_disk.  
# -----------------------------------------------------------------------------------------------------

# Using subset() to filter entries where country is "gb" and shape is "disk"
ufo_gb_disk <- subset(ufo_data, country == "gb" & shape == "disk")

# Display the number of records in ufo_gb_disk
n_records <- nrow(ufo_gb_disk)
n_records

# Q10 --------------------------------------------------------------------------------------------------
# Using the write.csv() command, save your modified UFO data frame as modified_ufo.csv 
# and also save your ufo_gb_disk data frame as ufo_gb.csv and the sorted_ufo_data as sorted_ufo.csv. 
# Save all three files into the working directory of your project.  
# -----------------------------------------------------------------------------------------------------

# Save the modified UFO data frame as 'modified_ufo.csv'
write.csv(ufo_data, "modified_ufo.csv", row.names = FALSE)

# Save the ufo_gb_disk data frame as 'ufo_gb.csv'
write.csv(ufo_gb_disk, "ufo_gb.csv", row.names = FALSE)

# Save the sorted_ufo_data data frame as 'sorted_ufo.csv'
write.csv(sorted_ufo_data, "sorted_ufo.csv", row.names = FALSE)



