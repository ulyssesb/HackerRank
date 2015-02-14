#include <iostream>
#include <vector>
using namespace std;

const int N_LINES=5;
const int N_COLUMS=5;
const int INITIAL=-1

/* Head ends here */
char read_board(int posx, int posy, vector <string> board)
{
	string line;

	// Get the x line
	line = board.at(posx);

	// Get the y element in the line
	return line.at(posy);
}

void next_move(int posx, int posy, vector <string> board) 
{
	int x_up_limit, x_down_limit, y_left_limit, y_right_limit,
		dirty_cell_x, dirty_cell_y, distance, max_distance;


	// Initialize the position of the closest dirty cell
	dirty_cell_x = dirty_cell_y = -1;	

	// Initialize the max distantece that we can reach for a cell
	max_distance 

	// Initialize how much we can walk in one direction using
	// the robot position as center
	x_up_limit  	= posx * -1;
	x_down_limit 	= N_LINES - posx;
	y_left_limit	= posy * -1;
	y_right_limit 	= N_COLUMS - posy;

	// Walk the matrix from distance 0 to MAX_DISTANCE to find
	// the closest dirty cell
	while (distance < MAX_DISTANCE || dirty_cell_x != INITIAL)
	{
		
	}
}

/* Tail starts here */
int main(void) 
{
    int pos[2];
    vector <string> board;

    cin>>pos[0]>>pos[1];

    for(int i=0;i<5;i++) 
    {
        string s;cin >> s;
        board.push_back(s);
    }

    next_move(pos[0], pos[1], board);
    return 0;
}