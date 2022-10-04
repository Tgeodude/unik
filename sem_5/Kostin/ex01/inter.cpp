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

    x1 = arr[0][0];
    x3 = arr[count - 1][0];
    y1 = arr[0][1];
    y3 = arr[count - 1][1];
    cout << "Точки которые остались после сжатия методом интерполяции" << endl;
    for (int i = 0; i < count; i++) {
        float x2, y2, tmp;
        x2 = arr[i][0];
        tmp = arr[i][1];
        y2 = (((x2 - x1) * (y3 - y1))/(x3 - x1)) + y1;
        if (fabs(y2 - tmp) <= e)
            cout << " " << arr[i][0] << " " << arr[i][1] << endl;
    }
        
    return 0;
}