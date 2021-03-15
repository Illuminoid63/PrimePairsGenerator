def genPrimes(rangeBegin, rangeEnd)
    if rangeBegin < rangeEnd
        counter = rangeBegin
        primePair = []
        while counter <= rangeEnd
            p_flag = true
            counter2 = 2
            if Math.sqrt(counter) >= 2
                while counter2 <= Math.sqrt(counter)
                    if counter.modulo(counter2) == 0
                        counter = counter.to_i
                        p_flag = false
                    end
                    counter2 += 1
                end
            end
            if counter == 1
                p_flag = false
            end
            if p_flag
                primePair << counter
            end
            if primePair.length() == 2
                yield primePair
                temp = primePair[1]
                primePair = []
                primePair << temp
            end
            counter += 1
        end
    else 
        puts "Error, starting value is not less than ending value"
        exit
    end

end

def printPrimePairs(rangeBegin, rangeEnd)
    genPrimes(rangeBegin, rangeEnd) do |primePair|
        print "[#{primePair[0]} #{primePair[1]}]"
    end
    puts
end

def genPrimeArray(rangeBegin, rangeEnd)
    primeArray = []
    genPrimes(rangeBegin, rangeEnd) do |primePair|
        if primeArray.length() == 0
            primeArray << primePair[0]
            primeArray << primePair[1]
        elsif !primeArray.include?(primePair[0])
            primeArray << primePair[0]
        end
        if !primeArray.include?(primePair[1])
            primeArray << primePair[1]
        end
    end
    return primeArray
end

def genDiffPrimeArray(rangeBegin, rangeEnd)
    diffPrimeArray = []
    genPrimes(rangeBegin, rangeEnd) do |primePair|
        diffPrimeArray << primePair[1] - primePair[0]
    end
    return diffPrimeArray
end

def genBetweenPrimesArray(rangeBegin, rangeEnd)
    betweenPrimeArray = []
    genPrimes(rangeBegin, rangeEnd) do |primePair|
        betweenPrimeArray << ((primePair[1] - primePair[0]).to_f / 2.0) + primePair[0]
    end
    return betweenPrimeArray
end

def avgDifferenceOfPrimes(rangeBegin, rangeEnd)
    sum = 0
    count = 0
    genPrimes(rangeBegin, rangeEnd) do |primePair|
        sum += primePair[1] - primePair[0]
        count += 1
    end
    return sum.to_f / count.to_f
end

def findMinAndMaxDiff(rangeBegin, rangeEnd)
    min = 0
    max = 0
    genPrimes(rangeBegin, rangeEnd) do |primePair|
        diff = primePair[1] - primePair[0]
        if min == 0
            min = diff
        elsif diff < min
            min = diff
        end
        if diff > max
            max = diff
        end
    end
    return min, max
end

def main()
    puts "Input starting value"
    starting_val = gets
    starting_val.chomp!
    starting_val = starting_val.to_i

    puts "Input ending value"
    ending_val = gets
    ending_val.chomp!
    ending_val = ending_val.to_i

    printPrimePairs(starting_val, ending_val)

    primeArray = genPrimeArray(starting_val, ending_val)
    
    diffPrimeArray = genDiffPrimeArray(starting_val, ending_val)
    
    betweenPrimeArray = genBetweenPrimesArray(starting_val, ending_val)
    
    avgDifference = avgDifferenceOfPrimes(starting_val,ending_val)

    min, max = findMinAndMaxDiff(starting_val, ending_val)

end
main()