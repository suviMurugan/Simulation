#include <iostream>
#include <stdlib.h>

#define ITER 10
#define SIZE 10

using namespace std;

class People{
    int id;
    int jobTime;
    static int num;
    public:
    People()
    {
        num     = num + 1;
        id      = num;
        jobTime = rand() % 10 + 1;
    }
    People(int i)
    {
        id      = i;
        jobTime = rand() % 10 + 1;
    }
    void printPeo()
    {
        cout<<"\nThe Citizen ID "<<id<<" with job size "<<jobTime;
    }
};
int People::num = -1;
class Population{
    People citizen[SIZE];
    public:
    void printPop()
    {
        cout<<"\nThe population has "<<SIZE<<" Citizens";
        for(int i=0;i<SIZE;i++)
        {
            citizen[i].printPeo();
        }
    }
    People getCitizen(int i)
    {
        return citizen[i];
    }
    People getCitizen()
    {
        int temp = rand() % SIZE ;
        return citizen[ temp ];
    }
};
class Queue{
    public:
    People citi[SIZE];
    int start,end;
    Queue()
    {
        start = -1;
        end   = -1;
    }
    int insertPeople(People x)
    {
        if( end == -1 )
         {
              start = 0;
              end = 0;
              citi[end]=x;
              //cout<<"\nInserted ";x.printPeo();   //Debug
              return 1;
         }
        else if( end == SIZE )
         {
              return -1;
         }
        else
         {
              end = end + 1;
              citi[end]=x;
              //cout<<"\nInserted ";x.printPeo();  //Debug
              return 1;
         }
    }
    int removePeople()
    {
        if( start == -1 )
        {
            return 0;
        }
        else if(start >= end)
        {
            return 0;
        }
        else
        {
            People temp = citi[end];
            temp.printPeo();
            end = end - 1;
            return 1;
        }
    }
    void printQue()
    {
        if (start == -1 || end == -1 || start == end)
        {
            cout<<"No Item in Queue now...!";
        }
        else
        {
            cout<<"The Queue stats is with "<<end - start;
            for (int i = start;i < end ; i++)
            {
                citi[i].printPeo();
            }
        }
    }
};
class Server{

};
int main()
{
    Population P;
    People temp;
    Queue Q;

int prob = 0;
int leverage = 0;
int val = 0;
    for ( int i = 0 ; i < ITER ; i++ )
    {
        prob = rand() % 10000 + leverage ;  // Total possible value is under 10000 as the rnad is divided by 10000.
        if( prob > 3000 )                   // if the prob is > 3000 means the probability of the event is 7 / 10 and not occuring is 3 / 10.
        {
            temp=P.getCitizen();
            Q.insertPeople(temp);
            leverage = 0;
            temp.printPeo();
            cout<<" added\n";
        }
        else
        {
            if( Q.removePeople() == 0 )
             leverage = 3001;
            else
            {
             leverage = 0;          // if server has no element in the queue then a leverage is added to increase the probability of the next event as arrival.
             cout<<" removed\n";
            }
        }
        val = val + (Q.end - Q.start);
        cout<<"The size is "<< (Q.end - Q.start)<<" , " << val;
    }
cout<<"\nThe average size is "<< (val*1.0) / ITER;
    return 0;
}
