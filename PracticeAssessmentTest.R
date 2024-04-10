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
#Prove that the variable names have changed using the names() function once you’ve modified the variable names. 
# ---------------------------------------------------------------------------------------------------

# Display current column names
names(ufo_data)

# Update column names
names(ufo_data)[names(ufo_data) == "duration..seconds."] <- "DurationSeconds"
names(ufo_data)[names(ufo_data) == "duration..hours.min."] <- "DurationHrsMins"
names(ufo_data)[names(ufo_data) == "date.posted"] <- "DatePosted"

# Display updated column names to confirm changes
names(ufo_data)



