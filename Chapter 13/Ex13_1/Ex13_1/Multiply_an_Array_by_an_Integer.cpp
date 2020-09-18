// Multiply_an_Array_by_an_Integer.cpp - exercise 1 from chapter 13


#include <iostream>

int main()
{
	int buffer[] = { 1,2,3,4,5 };
	int multiplier = 2;
	__asm {
		lea edi, buffer
		mov ecx, LENGTH buffer
		mov ebx, multiplier
		mov edx, 0
	L1:
		mov eax, [edi]
		mul ebx
		mov [edi], eax
		add edi, TYPE buffer
		loop L1
	}

	for (int i = 0; i < sizeof buffer / sizeof(int); i++)
		std::cout << buffer[i] << ' ';

	return 0;
}


