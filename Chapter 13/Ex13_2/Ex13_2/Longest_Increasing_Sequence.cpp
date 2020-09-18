// Longest_Increasing_Sequence.cpp - exercise 2 from chapter 13

#include <iostream>
#include "CountFunc.h"


int main()
{
	long buffer[] = { -5, 10, 20, 14, 17, 26, 42, 22, 19, -5 };
	long return_val;
	
	return_val = CountFunc(buffer, sizeof buffer / sizeof(long));

	std::cout << return_val << std::endl;

	return 0;
}


