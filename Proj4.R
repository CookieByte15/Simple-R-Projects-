library(dplyr)
library(ggplot2)
library(lubridate)

# Importing the dataset
data <- read.csv(file.choose())

# Converting date columns
data$borrow_date <- as.Date(data$borrow_date)
data$return_date <- as.Date(data$return_date)

# Displaying dataset
head(data)
str(data)

# Counting the number of times each book was borrowed
book_count <- table(data$book_title)
print(book_count)

# Counting books borrowed by each user
user_count <- table(data$user_id)
print(user_count)

# Bar plot showing books borrowed
barplot(
  book_count,
  main = "Books Borrowed",
  xlab = "Book Titles",
  ylab = "Number of Borrowings",
  col = "skyblue",
  las = 2
)

# Finding the most borrowed book
most_borrowed <- names(book_count)[which.max(book_count)]
print(most_borrowed)

# Finding the least borrowed book
least_borrowed <- names(book_count)[which.min(book_count)]
print(least_borrowed)

# Displaying borrowing counts
print(sort(book_count, decreasing = TRUE))

# Counting books borrowed according to genre
genre_count <- data %>%
  group_by(genre) %>%
  summarise(
    Borrow_Count = n()
  )
print(genre_count)

# Finding the most popular genre
most_popular_genre <- genre_count$genre[
  which.max(genre_count$Borrow_Count)
]
print(most_popular_genre)

# Finding the least popular genre
least_popular_genre <- genre_count$genre[
  which.min(genre_count$Borrow_Count)
]
print(least_popular_genre)

# Extracting month from borrowing date
data$Month <- month(
  data$borrow_date,
  label = TRUE
)

# Counting books borrowed each month
monthly_count <- data %>%
  group_by(Month) %>%
  summarise(
    Borrow_Count = n()
  )
print(monthly_count)

# Semester-wise borrowing analysis
semester_count <- data %>%
  group_by(semester) %>%
  summarise(
    Borrow_Count = n()
  )
print(semester_count)

# Counting borrowings by user category
category_count <- data %>%
  count(user_category, sort = TRUE)
print(category_count)

# Most active user category
most_active_category <- category_count$user_category[
  which.max(category_count$n)
]
print(most_active_category)

# Least active user category
least_active_category <- category_count$user_category[
  which.min(category_count$n)
]
print(least_active_category)

# Bar plot for user categories
barplot(
  category_count$n,
  names.arg = category_count$user_category,
  main = "Borrowing by User Category",
  xlab = "User Category",
  ylab = "Number of Borrowings",
  col = "lightgreen"
)

# Extracting month and year
data$Month <- format(data$borrow_date, "%B")
data$Year <- format(data$borrow_date, "%Y")

# Counting monthly borrowings across each year
monthly_borrowing <- data %>%
  group_by(Year, Month) %>%
  summarise(
    Borrow_Count = n(),
    .groups = "drop"
  )
print(monthly_borrowing)

# Finding peak borrowing period
peak_month <- monthly_borrowing[
  which.max(monthly_borrowing$Borrow_Count),
]
print(peak_month)

# Finding lowest borrowing period
lowest_month <- monthly_borrowing[
  which.min(monthly_borrowing$Borrow_Count),
]
print(lowest_month)

# Book popularity chart
book_popularity <- data %>%
  count(book_title, sort = TRUE)
ggplot(
  head(book_popularity, 10),
  aes(
    x = reorder(book_title, n),
    y = n
  )
) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  labs(
    title = "Top 10 Most Popular Books",
    x = "Book Title",
    y = "Number of Borrowings"
  ) +
  theme_minimal()

# Genre popularity chart
genre_popularity <- data %>%
  count(genre, sort = TRUE)
ggplot(
  genre_popularity,
  aes(
    x = reorder(genre, n),
    y = n
  )
) +
  geom_col(fill = "orange") +
  coord_flip() +
  labs(
    title = "Genre Popularity",
    x = "Genre",
    y = "Number of Borrowings"
  ) +
  theme_minimal()

# Total number of borrowing transactions
total_borrowings <- nrow(data)

# Total number of unique books
total_books <- length(unique(data$book_id))

# Total number of unique users
total_users <- length(unique(data$user_id))

# Most borrowed book
most_borrowed_book <- data %>%
  count(book_title, sort = TRUE) %>%
  slice(1)

# Most popular genre
popular_genre <- data %>%
  count(genre, sort = TRUE) %>%
  slice(1)

# Most active user
most_active_user <- data %>%
  count(user_id, sort = TRUE) %>%
  slice(1)

# Creating library usage summary
library_summary <- data.frame(
  Metric = c(
    "Total Borrowings",
    "Total Books",
    "Total Users",
    "Most Borrowed Book",
    "Most Popular Genre",
    "Most Active User"
  ),
  Result = c(
    total_borrowings,
    total_books,
    total_users,
    most_borrowed_book$book_title,
    popular_genre$genre,
    most_active_user$user_id
  )
)
print(library_summary)