The goal is to create a singular dropdown that acts as a WHERE clause for the "self_selected_products_c" column. I'd like to have a selection of multiple device names included in this comma-delimited list to act as
WHERE "self_selected_products_c" LIKE '%%' AND "self_selected_products_c" LIKE '%%' etc.
Currently this type of filter defaults to OR  (ie WHERE "self_selected_products_c" LIKE '%%' OR "self_selected_products_c" LIKE '%%')


split_to_array
https://docs.aws.amazon.com/redshift/latest/dg/split_to_array.html
