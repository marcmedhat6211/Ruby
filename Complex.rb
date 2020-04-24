class ComplexNum
    @real = 0
    @imag = 0
    $addCount = 0
    $multCount = 0
    $bulk_add_count = 0
    $bulk_multiply_count = 0

    def addComplex(cn1,cn2)
        realNum = cn1.real + cn2.real
        imgNum = cn1.imag + cn2.imag
        $addCount += 1
        return realNum.to_s + "+" + imgNum.to_s + "i"
    end

    def multComplex(cn1,cn2)
        realNum = (cn1.real * cn2.real) - (cn1.imag * cn2.imag)
        imgNum = (cn1.real * cn2.imag) + (cn1.imag * cn2.real)
        $multCount += 1
        return realNum.to_s + "+" + imgNum.to_s + "i"
    end

    def bulk_add(cns = [])
        i = 0
        $sum 
        while i < cns.length
            $sum = self.addComplex($sum.to_i,cns[i])
            i += 1
        end
        $bulk_add_count += 1
        return $sum.to_s
    end

    def bulk_multiply(cns = [])
        i = 0
        $product
        while i < cns.length
            $product = self.multComplex($product.to_i,cns[i])
            i += 1
        end
        return $product.to_s
        $bulk_multiply_count += 1
    end

    def get_stats
        puts "you made " + $addCount.to_s            + " Adding operations"
        puts "you made " + $multCount.to_s           + " Multiplying operations"
        puts "you made " + $bulk_add_count.to_s      + " Bulk adding operations"
        puts "you made " + $bulk_multiply_count.to_s + " Bulk multiplying operations"
    end

end

complex = ComplexNum.new
addResult = complex.addComplex(1+2i,2+3i)
multResult = complex.multComplex(3+2i,1+7i)
puts "Adding result is " + addResult
puts "Multiplying result is " + multResult

trialArray = [1+2i,2+3i,3+2i,1+7i]
bulk_add_result = complex.bulk_add(trialArray)
bulk_product_result = complex.bulk_multiply(trialArray)
puts "bulk_add result is " + bulk_add_result
puts "bulk_multiply result is " + bulk_product_result

complex.get_stats