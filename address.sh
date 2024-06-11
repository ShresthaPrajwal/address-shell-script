#!/bin/bash

ADDRESS_BOOK="address_book.txt"

# Add entry
function add_entry {
    echo "Enter name:"
    read name
    echo "Enter phone number:"
    read phone
    echo "Enter email:"
    read email
    echo "$name:$phone:$email" >> $ADDRESS_BOOK
}

# Search entry
function search_entry {
    echo "Enter name to search:"
    read name
    if grep -q -i "$name" $ADDRESS_BOOK; then
        grep -i "$name" $ADDRESS_BOOK
    else
        echo "No entry found for $name"
    fi
}

# Remove entry
function remove_entry {
    echo "Enter name to remove:"
    read name
    if grep -q -i "$name" $ADDRESS_BOOK; then
        grep -iv "$name" $ADDRESS_BOOK > temp
        mv temp $ADDRESS_BOOK
        echo "Entry removed successfully."
    else
        echo "No entry found for $name"
    fi
}
 
# Edit existing entry
function edit_entry {
    echo "Enter name to edit:"
    read name
    if grep -q -i "$name" $ADDRESS_BOOK; then
        grep -iv "$name" $ADDRESS_BOOK > temp
        mv temp $ADDRESS_BOOK
        echo "Enter new details."
        add_entry
    else
        echo "No entry found for $name"
    fi
}


# List all entries
function list_all_entries {
    cat $ADDRESS_BOOK
}

# main function
while true
do
    echo "-----------------Welcome to Prajwal's addrbook ----------------------"
    echo "1. Add entry"
    echo "2. Search entry"
    echo "3. Remove entry"
    echo "4. Edit entry"
    echo "5. List all entries"
    echo "6. Quit"
    read -p "Choose an option: " option

    case $option in
        1) add_entry ;;
        2) search_entry ;;
        3) remove_entry ;;
        4) edit_entry ;;
        5) list_all_entries ;;
	6) break ;;
        *) echo "Invalid option" ;;
    esac
done
