#if !defined(COMPLEX_NUMBERS_H)
#define COMPLEX_NUMBERS_H
#include <cmath>

namespace complex_numbers {
    class Complex {
        double _real;
        double _imag;

        // constructor
        public:
            Complex(double real = 0, double imag = 0) {
                _real = real; 
                _imag = imag;   
            }
            Complex operator+(const Complex&) const;
            Complex operator-(const Complex&) const;
            Complex operator*(const Complex&) const;
            Complex operator/(const Complex&) const;
            bool operator==(const Complex&) const;
            bool operator!=(const Complex&) const;
            double real() const { return _real; }
            double imag() const { return _imag; }
            Complex conj() const;
            float abs() const;
            Complex exp() const;
    };

}  // namespace complex_numbers

#endif  // COMPLEX_NUMBERS_H
