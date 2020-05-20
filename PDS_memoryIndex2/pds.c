#include<stdio.h>
#include<string.h>
#include<errno.h>
#include<stdlib.h>
#include"pds.h"
#include"bst.h"

struct PDS_RepoInfo repo_handle;

int pds_create(char *repo_name)
{
	// file name is maximum 10 characters
	char *fle1 = malloc(sizeof(char)*10) ;
	char *fle2 = malloc(sizeof(char)*10) ;
	strcpy(fle1,repo_name);
	strcat(fle1,".bin");

	strcpy(fle2,repo_name);
	strcat(fle2,".ndx");
	
	FILE *fp = fopen(fle1,"wb+");
	FILE *fp_ndx = fopen(fle2,"wb+");
	
	if(fp==NULL || fp_ndx ==NULL)
	return PDS_FILE_ERROR;

	fclose(fp);
	fclose(fp_ndx);
	return PDS_SUCCESS;
}
int pds_open( char *repo_name ,int rec_size)
{
	// file name is maximum 10 characters
	char *fle1 = malloc(sizeof(char)*10) ;
	char *fle2 = malloc(sizeof(char)*10) ;
	strcpy(fle1,repo_name);
	strcat(fle1,".bin");

	strcpy(fle2,repo_name);
	strcat(fle2,".ndx");
	
	FILE *fp = fopen(fle1,"wb+");
	FILE *fp_ndx = fopen(fle2,"wb+");
	
	if(fp==NULL || fp_ndx ==NULL)
	return PDS_FILE_ERROR;

	strcpy(repo_handle.pds_name,repo_name);

	repo_handle.pds_data_fp = fp;
	repo_handle.pds_ndx_fp = fp_ndx;
	repo_handle.pds_bst = NULL;
	repo_handle.rec_size = rec_size;

	return PDS_SUCCESS;  
}

int put_rec_by_key( int key, void *rec )
{
	if(fseek(repo_handle.pds_data_fp,0,SEEK_END))
	{
		return PDS_ADD_FAILED;
	}
	int offset = ftell(repo_handle.pds_data_fp);

	// add key,offset into bst
	struct PDS_NdxInfo *index = malloc(sizeof(struct PDS_NdxInfo));
	index->key = key;
	index->offset = offset;

	// write into the file
	fwrite(rec,repo_handle.rec_size,1,repo_handle.pds_data_fp);
	fwrite(index,sizeof(struct PDS_NdxInfo),1,repo_handle.pds_ndx_fp);

	//put into the BST
	int bst_status = bst_add_node(&repo_handle.pds_bst, key, index);

	if(bst_status)
		return bst_status;

	return PDS_SUCCESS;
}

int get_rec_by_key( int key, void *rec )
{
	//search for the record in the bst
	struct BST_Node *result = bst_search(repo_handle.pds_bst,key);
	if(result == NULL)
	{
		return PDS_REC_NOT_FOUND;
	}
	
	struct PDS_NdxInfo *index = (struct PDS_NdxInfo*)result->data;
	
	int offset = index->offset;

	if(fseek(repo_handle.pds_data_fp,offset,SEEK_SET))
	{
		return PDS_FILE_ERROR;
	}

	if(fread(rec,repo_handle.rec_size,1,repo_handle.pds_data_fp)!=EOF)
		return PDS_SUCCESS;

	return PDS_REC_NOT_FOUND;
}

int pds_close()
{
	if(repo_handle.pds_data_fp==NULL)
		return PDS_FILE_ERROR;

	bst_free(repo_handle.pds_bst);

	fclose(repo_handle.pds_data_fp);
	fclose(repo_handle.pds_ndx_fp);
	return PDS_SUCCESS;
}

