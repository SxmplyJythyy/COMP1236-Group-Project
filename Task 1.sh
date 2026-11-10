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
