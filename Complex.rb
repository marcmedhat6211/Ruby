class ComplexNum
    @real = 0
    @imag = 0
    
    def addComplex(cn1,cn2)
        realNum = cn1.real + cn2.real
        imgNum = cn1.imag + cn2.imag
        return realNum.to_s + "+" + imgNum.to_s + 'i'
    end

    def multComplex(cn1,cn2)
        realNum = (cn1.real * cn2.real) - (cn1.imag * cn2.imag)
        imgNum = (cn1.real * cn2.imag) + (cn1.imag * cn2.real)
        return realNum.to_s + "+" + imgNum.to_s + 'i'
    end

    def bulk_add(cns = [])
        i = 0
        $sum = ""
        # cns.each do |item|
        while i < cns.length
            puts "um in the loop"
            # $sum = item + cns[i] 
            $sum = self.addComplex($sum,cns[i])
            i += 1
        end
        return $sum.to_s
    end

    def bulk_multiply(cns = [])
        i = 0
        cns . each do |item|
            if i < cns.length
                $product = item * cns[i]
            end
            i += 1
        end
        return $product.to_s
    end

    def get_stats

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