#include <iostream>
#include <math.h>
using namespace std;
 
int main()
{
    int count;
    float e;

    cout << "Введите колличество точек" << endl;
    cin >> count;

    float arr[count][2];

    for (int i = 0; i < count; i++) {
        cout <<  "Введите x для " << i + 1 << " точки" << endl;
        cin >> arr[i][0];
        cout <<  "Введите y для " << i + 1 << " точки" << endl;
        cin >> arr[i][1];
    }
    cout << endl;
    cout << "Введите погрешность" << endl;
    cin >> e;
    cout << endl;
    cout << "Ваши точки до сжатия данных" << endl; 
    for (int i = 0; i < count; i++)
        cout << " " << arr[i][0] << " " << arr[i][1] << endl;

    float x1, x3, y1, y3;
    float arr1[count][2];

    cout << "Точки которые остались после сжатия методом интерполяции" << endl;
    int k = 0;
    for (int i = 0; i < count; i++) {
        float x2, y2, tmp;
        x1 = arr[i][0];
        y1 = arr[i][1];
        if (i + 2 >= count)
            break;
        x3 = arr[i + 2][0];
        y3 = arr[i + 2][1];
        x2 = arr[i + 1][0];
        y2 = arr[i + 1][1];
        tmp = fabs(y2 - (y1 + (((fabs(y3 - y1)) / 2))));
        if (tmp <= e)
        {
            arr1[i + 1][0] = x2;
            arr1[i + 1][1] = y2;
            k++;
        }
    }
    for (int i = 0; i < count; i++)
    {
        if(arr[i][0] != arr1[i][0] && arr[i][1] != arr1[i][1])
            cout << " " << arr[i][0] << " " << arr[i][1] << endl;
    }
    cout << "Точки после востанавления" << endl;
    for (int i = 0; i < count; i++)
    {
        cout << " " << arr[i][0] << " " << arr[i][1] << endl;
    }
    return 0;
}