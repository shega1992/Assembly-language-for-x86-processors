// Prime_Number_Program.cpp - exercise 4 from chapter 13


#include <iostream>
#include "isPrime.h"

void Sieve_of_Eratosthenes(unsigned int buffer[], unsigned int n);

int main()
{
	const unsigned int SIZE = 100000;
	unsigned int buffer[SIZE] = {};

	Sieve_of_Eratosthenes(buffer, SIZE);

	unsigned int value;
	bool retVal;
	std::cout << "Please enter your value( 0 or 1 for exit): ";
	std::cin >> value;
	while (value != 0 && value != 1)
	{
		retVal = isPrime(value, buffer);
		(retVal) ? std::cout << value << " is prime\n" : std::cout << value << " is not prime\n";
		std::cout << "Please enter next value( 0 or 1 for exit): ";
		std::cin >> value;
	}

	return 0;

}

void Sieve_of_Eratosthenes(unsigned int buffer[], unsigned int n)
{
	// fill the buffer
	for (unsigned int i = 0; i < n; i++)
		buffer[i] = i;
	/* set all positions of prime numbers to 1
	   set all positions of nonprime numbers to 0*/
	for (unsigned int i = 2; i < n; i++)
	{
		if (buffer[i] != 0)
		{
			buffer[i] = 1;
			for (unsigned int j = i * i; j < n; j += i)
				buffer[j] = 0;
		}
	}

}




