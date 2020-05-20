#include<stdio.h>
#include<string.h>
#include "contact.h"
void print1(struct Contact *c)
{
	printf("%s\n",c->contact_name );
}
void print2(struct Contact *c)
{

	printf("%s\n",c->phone );
}
void somedemo(void (*f)(struct Contact *),struct Contact *c)
{
	f(c);
}
int main()
{
	struct Contact c;
	strcpy(c.contact_name,"khalid");
	strcpy(c.phone,"12345");
	somedemo(print1,&c);
	somedemo(print2,&c);
	return 0;
}
