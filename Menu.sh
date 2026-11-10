#!/bin/bash

# [START] Application begins

# [PROCESS] Initialize variables
password="k99"
attempts=0

# [WHILE DECISION] attempts < 3?
while [ $attempts -lt 3 ]; do
    # [TRUE] Continue to password input

    # [INPUT] Enter password
    read -p "Enter password: " input

    # [IF DECISION] input == password?
    if [ "$input" = "$password" ]; then
        # [TRUE]

        # [OUTPUT] Display access granted
        echo "Access granted."

        # [FLOW] Exit password loop
        break
    else
        # [FALSE]

        # [PROCESS] Increment attempts
        attempts=$((attempts + 1))

        # [OUTPUT] Display incorrect password
        echo "Incorrect password. Try again."

        # [IF DECISION] attempts == 2?
        if [ $attempts -eq 2 ]; then
            # [TRUE]

            # [OUTPUT] Display warning
            echo "Warning: You only have one attempt left."
        fi

        # [FALSE] Skip warning if attempts != 2

        # [FLOW] Return to password WHILE decision
    fi
done

# [IF DECISION] attempts == 3?
if [ $attempts -eq 3 ]; then
    # [TRUE]

    # [OUTPUT] Display access denied
    echo "Access denied. You have exceeded the maximum number of attempts."

    # [END] Terminate application
    exit
fi

# [FALSE] Continue to main menu

# ========================================
# MAIN MENU
# ========================================

# [WHILE DECISION] Application running?
while true; do
    # [TRUE] Display main menu

    # [OUTPUT] Display menu options
    echo ""
    echo "===== Main Menu ====="
    echo "H - Hexagonal Numbers - Task 1"
    echo "S - Square Numbers - Task 2"
    echo "Q - Quadratic Sequences - Task 3"
    echo "======================="

    # [INPUT] Enter menu selection
    read -p "Select an option: " option

    # [IF DECISION] option == H or h?
    if [ "$option" = "H" ] || [ "$option" = "h" ]; then
        # [TRUE] Execute Task 1

    # [ELIF DECISION] option == S or s?
    elif [ "$option" = "S" ] || [ "$option" = "s" ]; then
        # [TRUE] Execute Task 2

    # [ELIF DECISION] option == Q or q?
    elif [ "$option" = "Q" ] || [ "$option" = "q" ]; then
        # [TRUE] Execute Task 3

    else
        # [FALSE] No valid task selected

        # [OUTPUT] Display invalid selection warning
        echo "Invalid option. Please choose H, S or Q."

        # [FLOW] Return to main menu
        continue
    fi


    # [FLOW] Valid task completed

    # [OUTPUT] Display continuation prompt
    echo ""

    # [WHILE DECISION] Valid continuation input?
    while true; do
        # [TRUE] Ask user to continue or exit

        # [INPUT] Ask user whether to continue
        read -p "Would you like to perform another task? (Y/N): " again

        # [IF DECISION] again == Y or y?
        if [ "$again" = "Y" ] || [ "$again" = "y" ]; then
            # [TRUE] Return to main menu

            # [FLOW] Exit continuation loop
            break

        # [ELIF DECISION] again == N or n?
        elif [ "$again" = "N" ] || [ "$again" = "n" ]; then
            # [TRUE] Exit application

            # [OUTPUT] Display exit message
            echo "Exiting the application. Goodbye!"

            # [END] Terminate application
            exit

        else
            # [FALSE] Invalid response

            # [OUTPUT] Display invalid response
            echo "Invalid option. Please enter Y or N."

            # [FLOW] Return to continuation WHILE decision
        fi
    done

    # [FLOW] Return to main menu
done

# [END] Application terminates
