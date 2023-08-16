#include "say.h"
#include <algorithm>
namespace say {
    std::map<int, std::string> nums_to_voices = {
        {0, "zero"},
        {1, "one"},
        {2, "two"},
        {3, "three"},
        {4, "four"},
        {5, "five"},
        {6, "six"},
        {7, "seven"},
        {8, "eight"},
        {9, "nine"},
        {10, "ten"},
        {11, "eleven"},
        {12, "twelve"},
        {13, "thirteen"},
        {14, "fourteen"},
        {15, "fifteen"},
        {16, "sixteen"},
        {17, "seventeen"},
        {18, "eighteen"},
        {19, "nineteen"},
        {20, "twenty"},
        {30, "thirty"},
        {40, "forty"},
        {50, "fifty"},
        {60, "sixty"},
        {70, "seventy"},
        {80, "eighty"},
        {90, "ninety"},
    };

    std::map<int, std::string> pos_to_voices = {
        {100, "hundred"},
        {1000, "thousand"},
        {1000000, "million"},
        {1000000000, "billion"},
    };

    std::string to_voice_chunk(int n) {
        std::string a = std::to_string(n);
        int len = a.length();
        for (int i = len; i < 3; i++) {
            a = "0" + a;
        }

        std::string result = "";

        int hunds = a[0] - '0';
        int tens  = a[1] - '0';
        int ones  = a[2] - '0';

        if (hunds != 0) {
            result = nums_to_voices[hunds] + " " + pos_to_voices[100];
            if (tens || ones) result += " ";
        }

        if (tens != 0) {
            if (tens == 1) {
                result += nums_to_voices[tens * 10 + ones];
                return result;
            } else {
                result += nums_to_voices[tens * 10];
                if (ones) result += "-";
            }
        }

        if (ones != 0) {
            result += nums_to_voices[ones];
        }

        return result;
    }

    std::vector<std::tuple<int, std::string>> split_to_chunks(unsigned long long n) {
        std::vector<std::tuple<int, std::string>> chunks;
        for (int i = 0; n > 0; i++) {
            std::tuple<int, std::string> chunk;
            std::cout << "n: " << n << std::endl;
            if (n % 1000 == 0) {
                chunk = std::tuple(static_cast<int>(n % 1000), "");
            } else {
                chunk = std::tuple(static_cast<int>(n % 1000), pos_to_voices[std::pow(1000, i)]);
            }
            chunks.push_back(chunk);
            n /= 1000;
        }
        return chunks;
    }

    std::string in_english(unsigned long long n) {
        if (n >= 1000000000000ULL) {
            throw std::domain_error("Number too big");
        }

        if (nums_to_voices.find(n) != nums_to_voices.end()) {
            return nums_to_voices[n];
        }

        auto chunks = say::split_to_chunks(n);
        std::reverse(chunks.begin(), chunks.end());

        std::string result = "";
        for (auto chunk : chunks) {
            int num = std::get<0>(chunk);
            std::string pos = std::get<1>(chunk);
            if (num == 0) continue;
            result +=  say::to_voice_chunk(num) + " " + pos + " ";
            if (pos == "") result.pop_back();
        }
        result.pop_back();

        return result;
    }
}  // namespace say

