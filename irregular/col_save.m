function X_col=col_save(X_row,Grid)

n=size(Grid,2);
X_col=[];
for i=1:n
    X_col=[X_col,X_row(:,Grid(:,i))];
end

