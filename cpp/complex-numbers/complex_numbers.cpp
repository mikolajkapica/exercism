#include "complex_numbers.h"
#include <math.h>

namespace complex_numbers {
   Complex Complex::operator+(const Complex& c) const {
        Complex result;
        result._real = this->_real + c._real;
        result._imag = this->_imag + c._imag;
        return result;
    }

    Complex Complex::operator-(const Complex& c) const {
        Complex result;
        result._real = this->_real - c._real;
        result._imag = this->_imag - c._imag;
        return result;
    }

    Complex Complex::operator*(const Complex& c) const {
        Complex result;
        result._real = this->_real * c._real - this->_imag * c._imag;
        result._imag = this->_real * c._imag + this->_imag * c._real;
        return result;
    }

    Complex Complex::operator/(const Complex& c) const {
        Complex result;
        result._real = (this->_real * c._real + this->_imag * c._imag) / (c._real * c._real + c._imag * c._imag);
        result._imag = (this->_imag * c._real - this->_real * c._imag) / (c._real * c._real + c._imag * c._imag);
        return result;
    }

    bool Complex::operator==(const Complex& c) const {
        return (this->_real == c._real && this->_imag == c._imag);
    }

    bool Complex::operator!=(const Complex& c) const {
        return !(this->_real == c._real && this->_imag == c._imag);
    }

    Complex Complex::conj() const {
        Complex result;
        result._real = this->_real;
        result._imag = - this->_imag;
        return result;
    }

    float Complex::abs() const {
        return sqrt(pow(this->_real, 2) + pow(this->_imag, 2));
    }

    Complex Complex::exp() const {
        Complex result;
        result._real = ::exp(this->_real) * cos(this->_imag);
        result._imag = ::exp(this->_real) * sin(this->_imag);
        return result;
    }
}  // namespace complex_numcers

