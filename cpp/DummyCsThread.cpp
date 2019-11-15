/* 
Minimal dummy project to get started with
*/

#include <stdio.h>
#include "csound.hpp"
#include "csPerfThread.hpp"

int main()
{
    //Create an instance of Csound
    Csound* csound = new Csound();

    //compile instance of csound.
    csound->Compile("../test1.csd");

    //prepare Csound for performance
    csound->Start();

    CsoundPerformanceThread* perfThread = new CsoundPerformanceThread(csound); 

    //start Csound performance
    perfThread->Play();

    while(perfThread->GetStatus() == 0)
    {
        
    }


    //free thread object
    delete perfThread;
    //free Csound object
    delete csound;

    return 0;
}



