#include <iostream>
#include <vector>
using namespace std;

void nextMove(int n, int r, int c, vector <string> grid){
	int princess_x, princess_y;

	// Find where's the princess
	int i=0,j=0;
	for ( vector<string>::iterator line = grid.begin() ; line != grid.end() ; line++ )
	{
		string line_ = *line;
		j = 0;
		for( string::iterator cell=line_.begin() ; cell != line_.end() ; cell++)
		{
			if (*cell == 'p') 
			{
				princess_x = i ; princess_y = j; 
			}
			j++;
		}
		i++;
	}

	// Printout the first step
	if (princess_x > r)
		cout << "DOWN" << endl;
	else if (princess_x < r)
		cout << "UP" << endl;
	else if (princess_y > c)
		cout << "RIGHT" << endl;
	else if (princess_y < c)
		cout << "LEFT" << endl;
}

int main(void) 
{

    int n, x, y;
    vector <string> grid;

    cin >> n;
    cin >> x;
    cin >> y;

    for(int i=0; i<n; i++) {
        string s; cin >> s;
        grid.push_back(s);
    }

    nextMove(n, x, y, grid);
    return 0;
}