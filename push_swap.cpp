#include <iostream>
#include <limits.h>

#define AllowChars "\"-"
#define Disallowed  "abcdefghijklmnopqrstuvwxyz"

void	Allowed() {
	int	quote = 0;
	srand(time(0));
	std::string argument;
	for (int i = 0; i < 30; i++) {
		int random = rand() % 10000;
		if (random % 1 == 0)
			argument += '\"';
		argument += std::to_string(random) + " ";
	}
	for (int i = 0; i < argument.length(); i++)
		if (argument[i] == '\"')
			quote++;
	if (quote % 2)
		argument += '\"';
	std::cout << argument << std::endl;
}

void	Forbidden() {
	srand(time(0));
	std::string argument;
	for (int i = 0; i < 30; i++) {
		int random = rand() % SIZE_T_MAX;
		if (random % 2 == 0)
			argument += '\"';
		argument += std::to_string(random);
	}
	std::cout << argument << std::endl;
}

int main(int ac, char **av) {
	(void)ac;
	if (ac != 2)
		return 0;
	if (av[1][0] == '1')
		Allowed();
	else
		Forbidden();
}