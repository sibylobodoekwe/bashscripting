#!/bin/bash

# Function to list and sort the contents of a directory
list_and_sort_directory() {
    local dir="$1"
    local sort_order="$2"

    echo "Contents of $dir:"

    if [ "$sort_order" == "a" ]; then
        ls -1 "$dir" | sort
    elif [ "$sort_order" == "d" ]; then
        ls -1 "$dir" | sort -r
    else
        ls -1 "$dir"
    fi

    echo ""
}

if [ $# -lt 1 ]; then
    echo "Usage: $0 <directory1> [directory2] ... [a|d]"
    exit 1
fi

# Check if the last argument is "a" or "d" for sorting
last_arg="${!#}"
sort_order=""
if [ "$last_arg" == "a" ] || [ "$last_arg" == "d" ]; then
    sort_order="$last_arg"
    # Remove the sorting argument
    set -- "${@:1:($#-1)}"
fi

# Iterate through the directory arguments
for dir in "$@"; do
    if [ -d "$dir" ]; then
        list_and_sort_directory "$dir" "$sort_order"
    else
        echo "Error: $dir is not a directory."
    fi
done


# Assignment 2
# Bash script to output the dataset into two columns:
# Create a Bash script that outputs this dataset into two columns
# one for the country and the other for its capital.
# Create a Bash script that outputs this dataset into two columns: 
# one for the country and the other for its capital.

#!/bin/bash

echo "Country | Capital"
echo "-----------------"

while read -r line; do
    country=$(echo "$line" | cut -d ',' -f 1)
    capital=$(echo "$line" | cut -d ',' -f 2)
    echo "$country | $capital"
done < countries.txt

# Create a Bash script that outputs this dataset into two columns: 
# one for the country and the other for its capital.


#!/bin/bash

read -p "Enter a letter: " letter

echo "Country | Capital"
echo "-----------------"

while read -r line; do
    country=$(echo "$line" | cut -d ',' -f 1)
    if [[ "${country:0:1}" == "$letter" ]]; then
        capital=$(echo "$line" | cut -d ',' -f 2)
        echo "$country | $capital"
    fi
done < countries.txt

# For an added challenge, 
# have your script accept a letter as input. 
# The output should be just the countries that start with the input letter. 
# For another challenge, create another Bash script that outputs a 
# two-column list sorted alphabetically by capital city.
#!/bin/bash

# Check if a filename is provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 <filename> [letter]"
    exit 1
fi

filename="$1"

# Check if the file exists
if [ ! -f "$filename" ]; then
    echo "File $filename not found."
    exit 1
fi

# Check if a letter is provided as the second argument
if [ -n "$2" ]; then
    letter="$2"
    filter=true
else
    filter=false
fi

# Function to sort the data by capital city
sort_by_capital() {
    sort -t':' -k2
}

# Output the dataset in two columns, optionally filtered by letter and sorted by capital city
if $filter; then
    grep "^$letter" "$filename" | sort_by_capital | awk -F':' '{ printf "%-15s %s\n", $1, $2 }'
else
    sort_by_capital < "$filename" | awk -F':' '{ printf "%-15s %s\n", $1, $2 }'
fi
