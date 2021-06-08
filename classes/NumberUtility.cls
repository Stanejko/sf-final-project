public class NumberUtility {
    
    public List<Integer> primeNumber(Integer number) {
        List<Integer> getPrimeNumbers = new List<Integer>();
        Boolean flag = true;
        
        for(Integer i = 2; i <= number; i++) {
            for(Integer j = 2; j <= Math.sqrt(i)+1; j++) {
                 if (Math.mod(i, j) == 0) {
                    flag = false;
                }
            }
            
            if (flag == true) {
                getPrimeNumbers.add(i);
            }
            else (flag == false) {flag = true;}
        }
        
        return getPrimeNumbers;
    }
    
    public List<Integer> fiboNumber(Integer number) { 
        List<Integer> getFiboNumbers = new List<Integer>();
        
        getFiboNumbers.add(1);
        getFiboNumbers.add(1);
        
        for (Integer i = 2; i <= N; i++) {
            getFiboNumbers.add(getFiboNumbers.get(i-1)+getFiboNumbers.get(i-2));
        }
        
        return getFiboNumbers;
    }
    
    public Boolean palindromeNumber(Integer number) {
        String enteredNumber = String.valueOf(number);
        String reverseNumber = enteredNumber.reverse();
        
        if (enteredNumber != reverseNumber) { return false;}
        
        return true;
    }
}
