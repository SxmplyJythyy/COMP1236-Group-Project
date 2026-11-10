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
