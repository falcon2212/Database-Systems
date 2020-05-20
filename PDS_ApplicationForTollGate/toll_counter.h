#ifndef TOLL_VEHICLE_H
#define TOLL_VEHICLE_H
#define TOLL_VEHICLE_SUCCESS 0
#define TOLL_VEHICLE_FAILURE 1

//toll_vehicle.h gives information about a vehicle that is using this tollway.
 
struct toll_vehicle{

	int toll_vehicle_id;
	char vehicle_number[30];
	char vehicle_type[30];// type of vehicle
	// domain = {Car, Bus, Truck, Van}
	int is_fast_track;//is this vehicle registered for fast track membership
	//domain = {0,1}
	char toll_type[30];// one way toll or two way toll
	// domain = {one_way, two_way, none}
	char toll_time[30];// time at which toll was taken
	//two way toll is valid till 24 hrs from the payment time
	int toll_status;
	//domain = {0,1}
};

extern struct PDS_RepoInfo *repoHandle;

int add_toll_vehicle( struct toll_vehicle *p );

void print_toll_vehicle( struct toll_vehicle *p );

int search_vehicle_by_vehicle_id( int toll_vehicle_id, struct toll_vehicle *p );

int search_vehicle_by_vehicle_number( char *vehicle_number, struct toll_vehicle *p, int *io_count );

int delete_vehicle_by_vehicle_id( int toll_vehicle_id);

int modify_vehicle_by_vehicle_id( int toll_vehicle_id, struct toll_vehicle *p );
// Load all the toll_vehicles from a TXT file
int store_toll_vehicles( char *toll_vehicle_data_file );

/* Return 0 if vehicle_number of the toll_vehicle matches with vehicle_number parameter */
/* Return 1 if vehicle_number of the toll_vehicle does NOT match */
/* Return > 1 in case of any other error */
int match_vehicle_number( struct toll_vehicle *p, char *vehicle_number );

#endif
