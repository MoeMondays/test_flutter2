
import "dart:math";

int sum(int a, int b){
  return a+b;
}

void main(){
  Function f1 = sum;
  print(f1(1,2));

  Function f2 = (int a, int b){
    return a+b;
  };
  print(f2(1,2));

  Function f3 = (int a, int b) => a+b;
  print(f3(1,2));
}