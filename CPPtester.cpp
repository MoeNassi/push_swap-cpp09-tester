#include <iostream>
#include <sstream>
#include <vector>

int	_stoi( std::string var ) {
	int		i = 0;
	for (int i = 0; i < var.length(); i++)
		if (!std::isdigit(var[i]))
			throw std::runtime_error("Error");
	std::stringstream ss(var);
	if (!(ss >> i))
		throw std::runtime_error("Error");
	return (i);
};

int main(int ac, char **av) {
	try {
		std::vector < int > seq;
		for (int i = 1; i < ac; i++)
			seq.push_back(_stoi(av[i]));
		for (int i = 0; i + 1 < seq.size(); i++) {
			if (seq[i] > seq[i + 1])
				throw std::runtime_error("Error");
		}
	}
	catch (std::exception &e) {
		std::cout << e.what() << std::endl;
	}
}