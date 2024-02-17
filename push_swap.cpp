#include <iostream>

#define AllowChars "\"-"

int main() {
	srand(time(0));
	std::string argument;
	for (int i = 0; i < 30; i++) {
		int random = rand() % 150;
		if (random % 2 == 0)
			argument += '\"';
		argument += std::to_string(random) + " ";
	}
	std::cout << argument << std::endl;
}