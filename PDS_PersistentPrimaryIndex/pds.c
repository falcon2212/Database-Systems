#include<stdio.h>
#include<string.h>
#include<errno.h>
#include<stdlib.h>
#include"pds.h"
#include"bst.h"

struct PDS_RepoInfo repo_handle;
int pds_load_ndx()
{
	if(fseek(repo_handle.pds_ndx_fp,0,SEEK_SET))
	{
		return PDS_FILE_ERROR;
	}
	if(feof(repo_handle.pds_ndx_fp) == 1) return PDS_SUCCESS;

	struct PDS_NdxInfo *index = malloc(sizeof(struct PDS_NdxInfo));

	while(fread(index,sizeof(struct PDS_NdxInfo),1,repo_handle.pds_ndx_fp) 	== 1 ) 
	{

		bst_add_node(&repo_handle.pds_bst,index->key,index);
		index = malloc(sizeof(struct PDS_NdxInfo));
	}

	return PDS_SUCCESS;
}	

void unload_bst(struct BST_Node *root)
{
	if(root == NULL)
		return;
	else
	{
		fwrite(root->data,sizeof(struct PDS_NdxInfo),1,repo_handle.pds_ndx_fp);
		unload_bst(root->left_child);
		unload_bst(root->right_child);
	}

}

int pds_open( char *repo_name ,int rec_size)
{
	if(repo_handle.repo_status == PDS_REPO_OPEN)
		return PDS_REPO_ALREADY_OPEN;
	// file name is maximum 100 characters
	char fle1[100] ;
	char fle2[100] ;
	strcpy(fle1,repo_name);
	strcat(fle1,".bin");

	strcpy(fle2,repo_name);
	strcat(fle2,".ndx");
	
	FILE *fp = fopen(fle1,"ab+");
	FILE *fp_ndx = fopen(fle2,"rb");
	if(fp==NULL || fp_ndx ==NULL)
	return PDS_FILE_ERROR;

	strcpy(repo_handle.pds_name,repo_name);

	repo_handle.pds_data_fp = fp;
	repo_handle.pds_ndx_fp = fp_ndx;
	repo_handle.pds_bst = NULL;
	repo_handle.rec_size = rec_size;
	repo_handle.repo_status = PDS_REPO_OPEN;

	int load_status = pds_load_ndx();

	if(load_status)
		return load_status;

	fclose(repo_handle.pds_ndx_fp);
	return PDS_SUCCESS;  
}

int put_rec_by_key( int key, void *rec )
{
	if(repo_handle.repo_status == PDS_REPO_CLOSED)
		return PDS_REPO_NOT_OPEN;

	if(fseek(repo_handle.pds_data_fp,0,SEEK_END))
	{
		return PDS_FILE_ERROR;
	}
	int offset = ftell(repo_handle.pds_data_fp);

	// add key,offset into bst
	struct PDS_NdxInfo *index = malloc(sizeof(struct PDS_NdxInfo));
	index->key = key;
	index->offset = offset;

	// write into the file
	fwrite(&key,sizeof(key),1,repo_handle.pds_data_fp);
	fwrite(rec,repo_handle.rec_size,1,repo_handle.pds_data_fp);

	//put into the BST
	int bst_status = bst_add_node(&repo_handle.pds_bst, key, index);
	if(bst_status) return bst_status;

	return PDS_SUCCESS;
}

int get_rec_by_key( int key, void *rec )
{
	if(repo_handle.repo_status == PDS_REPO_CLOSED)
		return PDS_REPO_NOT_OPEN;

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
	int *key1;

	if(fread(key1,sizeof(key),1,repo_handle.pds_data_fp) == 1){
		if(fread(rec,repo_handle.rec_size,1,repo_handle.pds_data_fp) == 1)
			return PDS_SUCCESS;
		else
			return PDS_REC_NOT_FOUND;
	}
	return PDS_REC_NOT_FOUND;
}

int pds_close()
{
	if(repo_handle.repo_status == PDS_REPO_CLOSED)
		return PDS_REPO_NOT_OPEN;
	char fle1[100]; 
	strcpy(fle1,repo_handle.pds_name);
	strcat(fle1,".ndx");
	repo_handle.pds_ndx_fp = fopen(fle1,"wb");
	if(repo_handle.pds_ndx_fp == NULL)
		return PDS_NDX_SAVE_FAILED;
	
	unload_bst(repo_handle.pds_bst);

	bst_destroy(repo_handle.pds_bst);

	fclose(repo_handle.pds_data_fp);
	fclose(repo_handle.pds_ndx_fp);

	repo_handle.repo_status = PDS_REPO_CLOSED;
	return PDS_SUCCESS;
}

