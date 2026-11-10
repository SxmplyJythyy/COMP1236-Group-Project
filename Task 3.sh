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
