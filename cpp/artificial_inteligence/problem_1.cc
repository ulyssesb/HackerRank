#include <iostream>
#include <vector>
using namespace std;

void displayPathtoPrincess(int n, vector <string> grid)
{
	int bot_x, bot_y, princess_x, princess_y, diff_x, diff_y;
	string direction_x, direction_y;

	// Find where's the position of princess and me
	int i,j;
	for ( vector<string>::iterator line = grid.begin() ; line != grid.end() ; line++ )
	{
		string line_ = *line;
		j = 0;
		for( string::iterator cell=line_.begin() ; cell != line_.end() ; cell++)
		{
			switch(*cell)
			{
				case 'm': bot_x = i ; bot_y = j; break;
				case 'p': princess_x = i ; princess_y = j; break;
			}
			j++;
		}
		i++;
	}

	// Find the diference between bot and princess positions
	diff_x = bot_x - princess_x;
	diff_y = bot_y - princess_y;

	direction_x = (diff_x < 0)? "DOWN" 	: "UP";
	direction_y = (diff_y < 0)? "RIGHT" : "LEFT";

	// cout << "BOT(" << bot_x << "," << bot_y << ")\n" ;
	// cout << "Princess(" << princess_x << "," << princess_y << ")\n" ;

	// Print to stdout the directions
	for (int i = 0; i < abs(diff_x); ++i)
	{
		cout << direction_x << endl;
	}

	for (int i = 0; i < abs(diff_y); ++i)
	{
		cout << direction_y << endl;
	}
}

int main(void) 
{

    int m;
    vector <string> grid;

    cin >> m;

    for(int i=0; i<m; i++) {
        string s; cin >> s;
        grid.push_back(s);
    }
    displayPathtoPrincess(m,grid);

    return 0;
}
