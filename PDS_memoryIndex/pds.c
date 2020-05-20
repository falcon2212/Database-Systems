#include<stdio.h>
#include<string.h>
#include<errno.h>
#include<stdlib.h>
#include"pds.h"


// Define the global variable
struct PDS_RepoInfo repo_handle;

int pds_create(char *repo_name)
{
	FILE *fp = fopen(repo_name,"wb+");
	if(fp==NULL)
	return 1;
	fclose(fp);
	return 0;
}
int pds_open( char *repo_name ,int rec_size)
{
	FILE *fp = fopen(repo_name,"rb+");
	if(fp==NULL)
		return 1;
	strcpy(repo_handle.pds_name,repo_name); 
	repo_handle.pds_data_fp = fp;
	repo_handle.repo_status = PDS_REPO_OPEN;
	return PDS_SUCCESS;  
}

int put_rec_by_key( int key, struct Contact *rec )
{
	if(fseek(repo_handle.pds_data_fp,0,SEEK_END))
	{
		return PDS_ADD_FAILED;
	}
	rec->contact_id = key;
	fwrite(rec,sizeof(struct Contact),1,repo_handle.pds_data_fp);
	return PDS_SUCCESS;
}

int get_rec_by_key( int key, struct Contact *rec )
{
	if(fseek(repo_handle.pds_data_fp,0,SEEK_SET))
	{
		return PDS_FILE_ERROR;
	}
	struct Contact c;
	while(fread(&c,sizeof(struct Contact),1,repo_handle.pds_data_fp)!=EOF)
	{
		if(c.contact_id==key){
			strcpy(rec->contact_name,c.contact_name);
			strcpy(rec->phone,c.phone);
			return PDS_SUCCESS;
		}
		if(fseek(repo_handle.pds_data_fp,sizeof(struct Contact),SEEK_CUR))break;
	}
	return PDS_REC_NOT_FOUND;
}

int pds_close()
{
	if(repo_handle.pds_data_fp==NULL)
		return PDS_FILE_ERROR;
	fclose(repo_handle.pds_data_fp);
	repo_handle.pds_data_fp=NULL;
}

