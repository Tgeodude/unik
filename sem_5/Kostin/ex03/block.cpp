#include "iostream"

int main (void){

    std::string str;

    std::cout << "Введите слово : ";
    std::getline(std::cin , str);
    std::cout << std::endl;
    while (str.size() % 5 != 0)
        str.push_back(' ');
    
    std::cout << "Ваше слово до шифрования : " << str << std::endl;
    char tmp;
    for (size_t i = 0; i < str.size(); i++)
    {
        tmp = str[i + 4];
        str[i + 4] = str[i + 3];
        str[i + 3] = str[i + 2];
        str[i + 2] = str[i];
        str[i] = str[i + 1];
        str[i + 1] = tmp;
        i += 4;
    }
    std::cout << "Ваше слово после шифрования : "<< str << std::endl;
    for (size_t i = 0; i < str.size(); i++)
    {
        tmp = str[i + 2];
        str[i + 2] = str[i + 3];
        str[i + 3] = str[i + 4];
        str[i + 4] = str[i + 1];
        str[i + 1] = str[i];
        str[i] = tmp;
        i += 4;

    }
    std::cout << "Ваше слово после дешифрования : " << str << std::endl;
}