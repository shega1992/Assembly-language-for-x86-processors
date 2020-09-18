// Summing_Three_Arrays.cpp - exercise 3 from chapter 13

#include <iostream>
#include "Sum.h"

int main()
{
	long arr1[] = { 1,2,3,4,5};
	long arr2[] = { 1,2,3,4,5};
	long arr3[] = { 1,2,3,4,5};

	Sum(arr1, arr2, arr3, 5);

	for (int i = 0; i < 5; i++)
		std::cout << arr1[i] << ' ';

	return 0;
}


