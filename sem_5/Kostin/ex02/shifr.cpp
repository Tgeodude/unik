#include "iostream"
#include "vector"

int main(void)
{
    std::vector <int> arr;
    std::string value;

    std::cout << "Введиете 8 бит" << std::endl;
    std::cin >> value;

    for (size_t i = 0; i < value.size(); i++)
    {
        if (value[i] == '0')
            arr.push_back(0);
        else if (value[i] == '1')
            arr.push_back(1);
    }
    std::cout << std::endl;
    std::cout << "Ваша строка после кодирования" << std::endl;
    for (size_t i = 0; i < value.size() + 4; i++)
    {
        if (i == 0)
            arr.insert(arr.cbegin() + 0, 1);
        else if (i == 1)
            arr.insert(arr.cbegin() + 1, 0);
        else if (i == 3)
            arr.insert(arr.cbegin() + 3, 1);
        else if (i == 7)
            arr.insert(arr.cbegin() + 7, 0);
        std::cout << arr[i]; 
    }
    std::cout << std::endl;
    std::cout << std::endl;
    arr.erase(arr.cbegin() + 7);
    arr.erase(arr.cbegin() + 3);
    arr.erase(arr.cbegin() + 1);
    arr.erase(arr.cbegin() + 0);
    std::cout << "Ваша строка после декодирования" << std::endl;
    for (size_t i = 0; i < value.size(); i++)
    {
        std::cout << arr[i]; 
    }
}