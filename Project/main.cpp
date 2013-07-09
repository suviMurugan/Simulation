#include <iostream>
#include <stdlib.h>
#define SIZE 5
#define POP 10

using namespace std;

class People{
private:
    int id;
    bool disease[SIZE];
    float probability[SIZE];
public:
    People(){
    id=0;
     for(int i=0;i<SIZE;i++){
      this->disease[i]=0;
        if(i==0)
            this->probability[i]=1;
        else
            this->probability[i]=0;
     }
    }
    People(int iden,bool dis[],float prob[]){
        this->id=iden;
        for(int i=0;i<SIZE;i++){
        this->disease[i]=dis[i];
        this->probability[i]=prob[i];
        }
    }
    void print(){
    cout<<"\nid Number :"<<this->id;
    for(int i=0;i<SIZE;i++){
        cout<<"\nFor disease "<<i<<" the probability is "<<this->probability[i];
    }
    }
};
class Population {
    People* node[POP];
    bool connect[POP][POP];
    public:
    Population(){
        float arr[SIZE];
        bool va[]={1,0,0,0,0};
        int value;
        int tot=10000;
    for(int i=0;i<POP;i++){
        tot=10000;
        for(int j=0;j<SIZE;j++){
            value  = (rand() % tot) + 1;
            arr[j] =  value / ( 10000.0 );
            cout<<"val "<<tot<<" "<<j<<endl ;
            tot    = tot - value;
        }
        node[i] = new People(i,va,arr);
    }
    }
    void printPOP(){
        for(int i=0;i<POP;i++){
        cout<<"\n-------";
        node[i]->print();
        }
    }
};
int main()
{
    Population pop1;
    pop1.printPOP();
    return 0;
}
