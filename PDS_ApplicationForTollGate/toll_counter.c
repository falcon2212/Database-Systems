#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include "pds.h"
#include "toll_counter.h"

// Load all the toll_vehicles from a TXT file
int store_toll_vehicles( char *toll_vehicle_data_file)
{
	FILE *pfptr;
	char toll_vehicle_line[500], token;
	struct toll_vehicle p, dummy;
	int status;
	pfptr = (FILE *) fopen(toll_vehicle_data_file, "r");
	while(fgets(toll_vehicle_line, sizeof(toll_vehicle_line)-1, pfptr)){
		sscanf(toll_vehicle_line, "%d%s%s%d%s%s%d", 
			&(p.toll_vehicle_id),
			p.vehicle_number,
			p.vehicle_type,
			&p.is_fast_track,
			p.toll_type,
			p.toll_time,
			&p.toll_status
			);
		print_toll_vehicle( &p );
		status = add_toll_vehicle( &p );
	}
	if(status != PDS_SUCCESS)
		return TOLL_VEHICLE_FAILURE;
	else
		return TOLL_VEHICLE_SUCCESS;
}


void print_toll_vehicle(struct toll_vehicle *p){
	printf("%d,%s,%s,%s\n",
		p->toll_vehicle_id,
		p->vehicle_number,
		p->vehicle_type,
		p->toll_type
	 );
}

int search_toll_vehicle( int toll_vehicle_id, struct toll_vehicle *p )
{
	int status = get_rec_by_ndx_key( toll_vehicle_id, p );
	if(status != PDS_SUCCESS)
		return TOLL_VEHICLE_FAILURE;
	else
		return TOLL_VEHICLE_SUCCESS;

}

int add_toll_vehicle( struct toll_vehicle *p )
{
	int status = put_rec_by_key( p->toll_vehicle_id, p );

	if( status != PDS_SUCCESS ){
		fprintf(stderr, "Unable to add toll_vehicle with toll_id %d. Error %d", p->toll_vehicle_id, status );
		return TOLL_VEHICLE_FAILURE;
	}
	else
		return TOLL_VEHICLE_SUCCESS;
}
int search_vehicle_by_vehicle_id( int toll_vehicle_id, struct toll_vehicle *p )
{
	 if(get_rec_by_ndx_key(toll_vehicle_id, p)!=PDS_SUCCESS)
	 	return TOLL_VEHICLE_FAILURE;
	 else
	 	return TOLL_VEHICLE_SUCCESS;
}

int match_toll_vehicle_number(struct toll_vehicle *p, char* vehicle_number )
{
	if( p == NULL || vehicle_number == NULL )
		return 2;
	if( strcmp(p->vehicle_number, vehicle_number) != 0 ){
		return 1;
	}
	else{
		return 0;
	}
}
int search_vehicle_by_vehicle_number( char *vehicle_number, struct toll_vehicle *p, int *io_count )
{

	int status = get_rec_by_non_ndx_key( vehicle_number, p, match_toll_vehicle_number, io_count);
	if(status != PDS_SUCCESS)
		return TOLL_VEHICLE_FAILURE;
	else
		return TOLL_VEHICLE_SUCCESS;

}

int delete_vehicle_by_vehicle_id( int toll_vehicle_id)
{
	int status = delete_rec_by_ndx_key(toll_vehicle_id);
	if(status != PDS_SUCCESS)
		return TOLL_VEHICLE_FAILURE;
	else
		return TOLL_VEHICLE_SUCCESS;
}

int modify_vehicle_by_vehicle_id( int toll_vehicle_id, struct toll_vehicle *p )
{
	int status = modify_rec_by_key(toll_vehicle_id, p);
	if(status != PDS_SUCCESS)
		return TOLL_VEHICLE_FAILURE;
	else
		return TOLL_VEHICLE_SUCCESS;

}
