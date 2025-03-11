# Strings in R

- check if a substring `p` is in a string (or a vector of strings) `x`: 
`grepl(pattern = p, x = x, fixed = TRUE)`: giving True or False (or a vector of True or False)
- replace a substring `p` with an alternative substring `r` in `x`:
`gsub(pattern = p, replacement = r, x = x, fixed = TRUE)`
- find a pattern `p` and get the substrings that is splited by `p` in `x`:
`strsplit(x, split = p, fixed = TRUE)`
- find a pattern `p` and get the substring before the first `p` in `x`:
`strsplit(x, split = p, fixed = TRUE)[1]`
- `fixed = TRUE` indicates exact match.