class Position {
	Int x, y;
	
	Int main() {
		Position[][][] p = new Position[3][4][5];
		Position k = p[1][2][3];
		p[2][2][2] = k;
		return 0;
	}
	
}
