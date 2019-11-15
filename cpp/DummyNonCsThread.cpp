/* 
Minimal dummy project to get started with
*/

#include <stdio.h>
#include "csound.hpp"

int main()
{
    //Create an instance of Csound
    Csound* csound = new Csound();

    //compile instance of csound.
    csound->Compile("../test1.csd");

    //prepare Csound for performance
    csound->Start();

    //perform entire score
    csound->Perform();	

    //free Csound object
    delete csound;

    return 0;
}



