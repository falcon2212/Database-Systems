#include<stdio.h>
#include "pds.h"
#include "contact.h"
int main(int argc, char *argv[])
{
	int status = pds_create(argv[1]);
	if(status == PDS_SUCCESS)
		printf("PDS %s created successfully\n",argv[1]);
	else
		printf("Some error occured\n");
	return 0;
}