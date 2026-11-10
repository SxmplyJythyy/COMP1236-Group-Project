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

        # ========================================
        # TASK 1 - HEXAGONAL NUMBERS
        # ========================================

        # [START] Task 1

        # [OUTPUT] Display selected task
        echo "You selected Hexagonal Numbers - Task 1"

        # [INPUT] Enter starting number (a)
        read -p "Enter starting number (a): " a

        # [INPUT] Enter ending number (b)
        read -p "Enter ending number (b): " b

        # [PROCESS] Initialize variables
        n=1
        oddCount=0
        evenCount=0
        oddSum=0
        evenSum=0

        # [PROCESS] Calculate first hexagonal number
        # Formula: hex = n * (2n - 1)
        hex=$((n * (2 * n - 1)))

        # [WHILE DECISION] hex <= b?
        while [ $hex -le $b ]; do
            # [TRUE] Continue checking hexagonal number

            # [IF DECISION] hex >= a?
            if [ $hex -ge $a ]; then
                # [TRUE] Hexagonal number is within range

                # [IF DECISION] hex % 2 == 0?
                if [ $((hex % 2)) -eq 0 ]; then
                    # [TRUE] Hexagonal number is even

                    # [OUTPUT] Display even hexagonal number
                    echo "$hex - Even"

                    # [PROCESS] Increment even count
                    evenCount=$((evenCount + 1))

                    # [PROCESS] Add hex to even sum
                    evenSum=$((evenSum + hex))

                else
                    # [FALSE] Hexagonal number is odd

                    # [OUTPUT] Display odd hexagonal number
                    echo "$hex - Odd"

                    # [PROCESS] Increment odd count
                    oddCount=$((oddCount + 1))

                    # [PROCESS] Add hex to odd sum
                    oddSum=$((oddSum + hex))
                fi

                # [FLOW] Odd/even branches reconnect
            fi

            # [FALSE] hex < a, skip odd/even processing

            # [PROCESS] Increment sequence position
            n=$((n + 1))

            # [PROCESS] Calculate next hexagonal number
            hex=$((n * (2 * n - 1)))

            # [FLOW] Return to WHILE decision (hex <= b?)
        done

        # [FALSE] hex > b, exit WHILE loop

        # [OUTPUT] Display results heading
        echo ""
        echo "===== Results ====="

        # [OUTPUT] Display total odd numbers
        echo "Total odd numbers: $oddCount"

        # [OUTPUT] Display total even numbers
        echo "Total even numbers: $evenCount"

        # [OUTPUT] Display sum of odd numbers
        echo "Sum of odd numbers: $oddSum"

        # [OUTPUT] Display sum of even numbers
        echo "Sum of even numbers: $evenSum"

        # [END] Task 1
        # [FLOW] Continue to application continuation prompt

    # [ELIF DECISION] option == S or s?
    elif [ "$option" = "S" ] || [ "$option" = "s" ]; then
        # [TRUE] Execute Task 2

        # ========================================
        # TASK 2 - SQUARE NUMBERS
        # ========================================

        # [START] Task 2

        # [OUTPUT] Display selected task
        echo "You selected Square Numbers - Task 2"

        # [INPUT] Enter starting position
        read -p "Enter starting position: " startPos

        # [INPUT] Enter amount of square numbers to print
        read -p "Enter amount of square numbers to print: " amount

        # [INPUT] Enter positive integer x
        read -p "Enter a positive integer (x): " x

        # [PROCESS] Initialize variables
        count=0

        # [IF DECISION] position % 2 == 0?
        if [ $((startPos % 2)) -eq 0 ]; then
            # [TRUE] Starting position is even

            # [PROCESS] Move to next odd position
            startPos=$((startPos + 1))
        fi

        # [FALSE] Starting position is already odd

        # [WHILE DECISION] count < amount?
        while [ $count -lt $amount ]; do
            # [TRUE] Continue generating & printing square numbers

            # [PROCESS] Calculate square number
            square=$((startPos * startPos))

            # [OUTPUT] Display square number
            echo "Position $startPos: $square"

            # [IF DECISION] x % square == 0?
            if [ $((x % square)) -eq 0 ]; then
                # [TRUE] Square number is a factor of x

                # [OUTPUT] Display factor message
                echo "$square is a factor of $x."
            else
                # [FALSE] Square number is not a factor of x

                # [OUTPUT] Display not a factor message
                echo "$square is not a factor of $x."
            fi

            # [PROCESS] Increment position by 2
            startPos=$((startPos + 2))

            # [PROCESS] Increment count
            count=$((count + 1))

            # [FLOW] Return to WHILE decision (count < amount?)
        done

        # [FALSE] count >= amount, exit WHILE loop

        # ========================================
        # SUM OF TWO CONSECUTIVE SQUARE NUMBERS
        # ========================================

        # [INPUT] Enter maximum value
        read -p "Enter maximum value for consecutive square numbers: " maxValue

        # [PROCESS] Initialize variables
        n=1
        sumCount=0

        # [PROCESS] Calculate first consecutive square sum
        sum=$((n * n + (n + 1) * (n + 1)))

        # [WHILE DECISION] sum <= maxValue?
        while [ $sum -le $maxValue ]; do
            # [TRUE] Sum is within maximum value

            # [OUTPUT] Display consecutive square sum
            echo "$n^2 + $(($n + 1))^2 = $sum"

            # [PROCESS] Increment sum count
            sumCount=$((sumCount + 1))

            # [PROCESS] Increment n
            n=$((n + 1))

            # [PROCESS] Calculate next consecutive square sum
            sum=$((n * n + (n + 1) * (n + 1)))

            # [FLOW] Return to WHILE decision (sum <= maxValue?)
        done

        # [FALSE] sum > maxValue, exit WHILE loop

        # [OUTPUT] Display total count
        echo ""
        echo "Total consecutive square sums found: $sumCount"

        # [END] Task 2
        # [FLOW] Continue to application continuation prompt

    # [ELIF DECISION] option == Q or q?
    elif [ "$option" = "Q" ] || [ "$option" = "q" ]; then
        # [TRUE] Execute Task 3

        # ========================================
        # TASK 3 - QUADRATIC SEQUENCES
        # ========================================

        # [START] Task 3

        # [OUTPUT] Display selected task
        echo "You selected Quadratic Sequences - Task 3."

        # [INPUT] Enter coefficients a, b and c
        read -p "Enter coefficient a: " a
        read -p "Enter coefficient b: " b
        read -p "Enter coefficient c: " c

        # [INPUT] Enter starting and ending positions
        read -p "Enter starting position (n1): " n1
        read -p "Enter ending position (n2): " n2

        # [INPUT] Enter number x
        read -p "Enter positive integer (x): " x

        # [PROCESS] Initialize variables
        n=$n1
        sum=0
        primeCount=0

        # [PROCESS] Calculate first term
        first=$((a * n1 * n1 + b * n1 + c))

        # [PROCESS] Calculate last term
        last=$((a * n2 * n2 + b * n2 + c))

        # [WHILE DECISION] n <= n2?
        while [ $n -le $n2 ]; do
            # [TRUE] Continue generating sequence

            # [PROCESS] Calculate current term
            term=$((a * n * n + b * n + c))

            # [OUTPUT] Display current term
            echo "Position $n: $term"

            # [PROCESS] Add current term to sum
            sum=$((sum + term))

            # [PROCESS] Initialize prime checking variables
            divisor=2
            isPrime=1

            # [IF DECISION] term < 2?
            if [ $term -lt 2 ]; then
                # [TRUE] Number is not prime

                # [PROCESS] Mark number as not prime
                isPrime=0
            fi

            # [WHILE DECISION] divisor < term?
            while [ $((divisor * divisor)) -le $term ]; do
                # [TRUE] Continue checking divisors

                # [IF DECISION] term % divisor == 0?
                if [ $((term % divisor)) -eq 0 ]; then
                    # [TRUE] Divisor found

                    # [PROCESS] Mark as not prime
                    isPrime=0

                    # [FLOW] Exit divisor loop
                    break
                fi

                # [FALSE] No divisor found

                # [PROCESS] Increment divisor
                divisor=$((divisor + 1))

                # [FLOW] Return to divisor WHILE decision
            done

            # [FALSE] Finished checking divisors

            # [IF DECISION] isPrime == 1?
            if [ $isPrime -eq 1 ]; then
                # [TRUE] Number is prime

                # [OUTPUT] Display prime result
                echo "$term is a prime number."

                # [PROCESS] Increment prime count
                primeCount=$((primeCount + 1))
            else
                # [FALSE] Number is not prime

                # [OUTPUT] Display non-prime result
                echo "$term is NOT a prime number."
            fi

            # [PROCESS] Increment sequence position
            n=$((n + 1))

            # [FLOW] Return to sequence WHILE decision
        done

        # [FALSE] n > n2, exit sequence loop

        # [PROCESS] Calculate product of first and last terms
        product=$((first * last))

        # [OUTPUT] Display results
        echo ""
        echo "===== Results ====="
        echo "Total prime numbers: $primeCount"
        echo "Sum of all terms: $sum"
        echo "Product of first and last terms: $product"

        # [IF DECISION] x == 0?
        if [ $x -eq 0 ]; then
            # [TRUE] Avoid division by zero

            # [OUTPUT] Display invalid x message
            echo "Cannot check multiples of zero."

        # [ELIF DECISION] product % x == 0?
        elif [ $((product % x)) -eq 0 ]; then
            # [TRUE] Product is a multiple of x

            # [OUTPUT] Display multiple result
            echo "$product is a multiple of $x."

        else
            # [FALSE] Product is not a multiple of x

            # [OUTPUT] Display non-multiple result
            echo "$product is NOT a multiple of $x."
        fi

        # [END] Task 3
        # [FLOW] Continue to application continuation prompt

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
