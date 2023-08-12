---
Title: A brief atlas between MATLAB and R
---

| Method | MATLAB Commands | R Commands|
| ------ | --------------- | --------- |
|Create empty vector/matrix `x` | `x = []` | `x = c(); x = data.frame()`|
|Add a new column/row `v` to `x`| `x = [x, v]; x = [x; v]`| `x = cbind(x, v); x = rbind(x, v)`|
|Transpose a matrix `x`| `x = x.'`| `x = t(x)`|
|Number of rows of a matrix| `size(x, 1)`| `nrow(x)`|
|Number of columns of a matrix | `size(x,2)` | `ncol(x)`|
|Elementwise multiplication/division of vectors `v1` and `v2`| `v1 .* v2; v1 ./ v2`| `v1 * v2; v1 / v2`|
|Delete the first/last column of `x`| `x(:,1) = []; x(:,end) = []`| `x = x[,-1]; x = x[,-ncol(x)]`|
|Delete the last two rows of `x`| `x((end-1):end,:) = []` | `x = x[-c(nrow(x)-1,nrow(x)),]`|
|Create a scatter plot of vector pairs `(x,y)`| `scatter(x,y)`|`plot(x,y)`|
|For loop| `for i=1:10` ... `end`| `for(i in 1:10){...}`|
|If, else if| `if x==1` ... `else if x < 2` ... `end`   | `if(x == 1){...} else if(x<2){...}`|
|Logic (0/1) vector indicating elements in a vector is larger than 1| `logic = (x>1)`| `logic = (x>1)`|
|Index of elements that satisfies a condition| `ind = find(x>1)`| `ind = which(x>1)`|
|Retrieve elements that satisfies a condition| `x(x>1); x(find(x>1))` | `x[x>1]; x[which(x>1)]`|
|Solve $x$ from $Ax = B$|   `x = A\B`|`x =  Solve(A, B)` |
|Identity matrix of dimension $n$|  `eye(n)` / `eye(n,n)`|`diag(n)`|
|Eigen value and eigen vectors of matrix $x$| `[vectors, values] = eigs(x)`| `ev = eigen(x); ev$values; ev$vectors`|
