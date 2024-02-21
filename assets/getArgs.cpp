#include <iostream>
#include <vector>

std::string	to_lower(std::string &av) {
	for (int i = 0; i < av.length(); i++)
		av[i] = std::tolower(av[i]);
	return av;
}

int	isdigit(std::string av) {
	// std::cout << av << std::endl;
	for (int i = 0; i < av.length(); i++)
		if (!std::isdigit(av[i]))
			return false;
	return true;
}

int main( int ac, char **av) {
	std::string	getThem;
	for (int i = 0; i < ac; i++) {
		std::string arg = av[i];
		if (!to_lower(arg).compare("after") || !to_lower(arg).compare("after:")) {
			for (; i < ac; i++)
				if (isdigit(av[i]))
					break ;
			for (; i < ac && isdigit(av[i]) || std::string(av[i + 1]) == " "; i++) {
				if (std::string(av[i]) == " ")
					continue ;
				getThem += std::string(av[i]) + " ";
			}
			break ;
		}
	}
	std::cout << getThem << std::endl;
}