/*
This module is made with the simulation of event point.

Add is the function to add of a member into the Queue.(Arrival)

Remove is the function to remove a member from the queue. (Service)
*/

#include <iostream>
#include <stdlib.h>

#define ITER 100

using namespace std;
int pop = 0;

int add()
{
    pop = pop + 1;  //adding element to the Queue
    return 1;
}

int remove()
{
    if(pop <= 0 )   //no removal without a member inside the population
    return 0;
    pop = pop - 1;
    return 1;
}

int main()
{
    int prob = 0;
    long val=0;
    int leverage=0;
    for ( int i = 0 ; i < ITER ; i++ )
    {
        prob = rand() % 10000 + leverage ;  // Total possible value is under 10000 as the rnad is divided by 10000.
        if( prob > 3000 )                   // if the prob is > 3000 means the probability of the event is 7 / 10 and not occuring is 3 / 10.
        {
            add();
            leverage = 0;
            cout<<"\n add "<< pop;
        }
        else
        {
            if( pop == 0 )
             leverage = 3001;
            else
            {
             leverage = 0;          // if server has no element in the queue then a leverage is added to increase the probability of the next event as arrival.
             remove();
             cout<<"\n remove "<<pop;
            }
        }
        val = val + pop;
    }
    cout<<"The average value is "<< val/ITER;   // The average value is sum of queue length at every instance divided by the total number of iteration.
    return 0;                                   //Thus it is average queue length when simulation is over.
}
