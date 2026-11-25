# Library Book Circulation and User Behaviour Analysis

An R programming project analysing library borrowing patterns, book popularity, genre preferences and user behaviour.

## Dataset

**[Library Borrowing Dataset – Kaggle](https://www.kaggle.com/datasets/cookiebyte15/library-borrowing-dataset)**

The dataset is also included in this repository as `Library.csv`.

- 12,000 simulated transactions
- 1,668 unique users
- 700 unique books
- 9 genres
- Data spanning 2022–2025

*Note: Book metadata is derived from Goodbooks-10k. Borrowing transactions and user activity are synthetically generated for educational purposes.*

## Project Topics

1. Books Borrowed by Users
2. Most and Least Borrowed Books
3. Borrowing Patterns by Genre
4. Borrowing by Month and Semester
5. Comparison of User Categories
6. Identification of Peak Borrowing Periods
7. Book and Genre Popularity Visualisation
8. Overall Library Usage Summary

## Technologies Used

- R
- RStudio
- dplyr
- ggplot2
- lubridate

## Repository Structure

```text
Library-Book-Analysis/
│
├── README.md
├── Library_Analysis.R
└── Library.csv
```

## How to Run

1. Clone or download this repository.
2. Open `Library_Analysis.R` in RStudio.
3. Install the required packages:

```r
install.packages(c("dplyr", "ggplot2", "lubridate"))
```

4. Run the script and select `Library.csv` when prompted.

## Data Source

- [Library Borrowing Dataset – Kaggle](https://www.kaggle.com/datasets/cookiebyte15/library-borrowing-dataset)
- [Goodbooks-10k](https://github.com/zygmuntz/goodbooks-10k) – Original book metadata.

## License

The dataset incorporates book metadata from Goodbooks-10k, distributed under CC BY-SA 4.0. Please retain appropriate attribution and follow its licence terms when redistributing adapted data.

---

*Programming Workshop in R – Project 4*
